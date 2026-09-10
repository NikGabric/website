defmodule WebsiteWeb.BlogControllerTest do
  use WebsiteWeb.ConnCase

  import Website.BlogFixtures

  describe "index" do
    test "lists published posts", %{conn: conn} do
      post = post_fixture()

      conn = get(conn, ~p"/blog")
      assert html_response(conn, 200) =~ post.title
    end

    test "does not list unpublished posts", %{conn: conn} do
      post = post_fixture(published: false)

      conn = get(conn, ~p"/blog")
      refute html_response(conn, 200) =~ post.title
    end
  end

  describe "show" do
    test "shows the published post by slug", %{conn: conn} do
      post = post_fixture()

      conn = get(conn, ~p"/blog/#{post.slug}")
      assert html_response(conn, 200) =~ post.title
    end

    test "renders the post body as markdown", %{conn: conn} do
      post = post_fixture(body: "Some **bold** text.")

      conn = get(conn, ~p"/blog/#{post.slug}")
      assert html_response(conn, 200) =~ "<strong>bold</strong>"
    end

    test "does not render raw HTML embedded in the post body", %{conn: conn} do
      post = post_fixture(body: "<script>alert('xss')</script>")

      conn = get(conn, ~p"/blog/#{post.slug}")
      refute html_response(conn, 200) =~ "<script>alert('xss')</script>"
    end

    test "404s for an unpublished post", %{conn: conn} do
      post = post_fixture(published: false)

      assert_error_sent 404, fn ->
        get(conn, ~p"/blog/#{post.slug}")
      end
    end
  end
end
