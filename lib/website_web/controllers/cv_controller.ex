defmodule WebsiteWeb.CvController do
  use WebsiteWeb, :controller

  def show(conn, _params) do
    render(conn, :show)
  end
end
