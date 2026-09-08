#!/usr/bin/env bash
# Run this ON THE VPS as the deploy user: bash setup-server.sh
#
# One-time preparation before the first CI/CD deploy. Safe to re-run: it
# never overwrites an existing /opt/website/.env and never prints a secret
# it just wrote.
set -euo pipefail

DOMAIN="gabric.dev"
APP_DIR="/opt/website"

echo "==> 1/5 Checking prerequisites"
docker --version
docker compose version

echo "==> 2/5 Checking GHCR pull access"
if docker pull ghcr.io/nikgabric/website:latest >/dev/null 2>&1; then
  echo "    OK: can already pull the image"
else
  echo "    Cannot pull ghcr.io/nikgabric/website:latest yet."
  echo "    This is expected if CI hasn't pushed an image yet -- there is"
  echo "    nothing to pull before the first successful build/deploy. If"
  echo "    that's the situation you're in, this is not a misconfiguration:"
  echo "    just re-run this script after the first image lands (or push"
  echo "    one manually) and the check will pass."
  echo "    If an image already exists in the registry and this still"
  echo "    fails, log in with a PAT that has read:packages, then re-run:"
  echo "      docker login ghcr.io -u nikgabric"
  exit 1
fi

echo "==> 3/5 Checking DNS"
resolved="$(getent hosts "$DOMAIN" | awk '{print $1}' | head -1 || true)"
public_ip="$(curl -fsS https://api.ipify.org || echo unknown)"
echo "    $DOMAIN resolves to: ${resolved:-<nothing>}"
echo "    this host's public IP: $public_ip"
if [ "$resolved" != "$public_ip" ]; then
  echo "    WARNING: DNS does not point here yet. Let's Encrypt will fail."
  echo "    Point the A record at $public_ip and wait before deploying."
fi

echo "==> 4/5 Creating $APP_DIR/.env"
sudo mkdir -p "$APP_DIR"
sudo chown "$USER" "$APP_DIR"
if [ -f "$APP_DIR/.env" ]; then
  echo "    .env already exists, leaving it alone"
else
  pg_pass="$(openssl rand -base64 24 | tr -d '/+=')"
  read -rsp "    Paste SECRET_KEY_BASE (generate locally with: mix phx.gen.secret): " skb
  echo
  cat > "$APP_DIR/.env" <<EOF
SECRET_KEY_BASE=$skb
POSTGRES_PASSWORD=$pg_pass
DATABASE_URL=ecto://postgres:$pg_pass@db/website_prod
PHX_HOST=$DOMAIN
EOF
  chmod 600 "$APP_DIR/.env"
  echo "    wrote $APP_DIR/.env (chmod 600)"
fi

echo "==> 5/5 Deploy key"
if [ -f ~/.ssh/authorized_keys ] && grep -q "github-deploy" ~/.ssh/authorized_keys; then
  echo "    a key tagged github-deploy is already authorised"
else
  echo "    On your LAPTOP run:"
  echo "      ssh-keygen -t ed25519 -C github-deploy -f ~/.ssh/website_deploy -N ''"
  echo "    Append the .pub half to ~/.ssh/authorized_keys on this box,"
  echo "    then add the private half to GitHub as the SSH_PRIVATE_KEY secret."
fi

echo
echo "Done. Remaining GitHub secrets to set (gh secret set <name> ...):"
echo "  SSH_HOST=$public_ip"
echo "  SSH_USER=$USER"
echo "  SSH_PRIVATE_KEY=<private half of the github-deploy keypair>"
echo "  SSH_KNOWN_HOSTS=<output of: ssh-keyscan $public_ip>"
echo
echo "  Run that ssh-keyscan on YOUR OWN machine, not on this server:"
echo "  pinning a host key you fetched from the very box you're trying to"
echo "  authenticate defeats the purpose of pinning it. Cross-check the"
echo "  fingerprint against netcup's console or your own ~/.ssh/known_hosts"
echo "  before trusting it."
