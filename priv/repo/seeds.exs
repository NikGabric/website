# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Website.Repo.insert!(%Website.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Website.Blog

posts = [
  %{
    title: "Hello, World",
    slug: "hello-world",
    excerpt: "The first post on this blog.",
    body: "This is the first post on this blog. More to come soon.",
    published: true,
    published_at: ~U[2026-08-01 09:00:00Z]
  },
  %{
    title: "Setting Up the Site",
    slug: "setting-up-the-site",
    excerpt: "A few notes on how this site is built.",
    body: "This site runs on Phoenix, Ecto, and Postgres, styled with Tailwind and daisyUI.",
    published: true,
    published_at: ~U[2026-08-10 09:00:00Z]
  },
  %{
    title: "A Week In Review",
    slug: "a-week-in-review",
    excerpt: "Some thoughts from the past week.",
    body: "Here's a recap of what I've been working on lately.",
    published: true,
    published_at: ~U[2026-08-20 09:00:00Z]
  },
  %{
    title: "On Writing Regularly",
    slug: "on-writing-regularly",
    excerpt: "Trying to post more often.",
    body: "I'm aiming to write here more consistently going forward.",
    published: true,
    published_at: ~U[2026-09-01 09:00:00Z]
  },
  %{
    title: "Draft: Work In Progress",
    slug: "draft-work-in-progress",
    excerpt: "Not ready yet.",
    body: "This one is still a draft and shouldn't show up publicly.",
    published: false,
    published_at: ~U[2026-09-08 09:00:00Z]
  }
]

for attrs <- posts do
  case Blog.create_post(attrs) do
    {:ok, post} ->
      IO.puts("Created post: #{post.title}")

    {:error, changeset} ->
      IO.inspect(changeset.errors, label: "Failed to create post #{attrs.title}")
  end
end
