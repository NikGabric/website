defmodule WebsiteWeb.BlogController do
  use WebsiteWeb, :controller

  alias Website.Blog

  def index(conn, _params) do
    render(conn, :index, posts: Blog.list_published_posts())
  end

  def show(conn, %{"slug" => slug}) do
    render(conn, :show, post: Blog.get_published_post_by_slug!(slug))
  end
end
