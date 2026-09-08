defmodule WebsiteWeb.PageControllerTest do
  use WebsiteWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)

    assert html |> LazyHTML.from_document() |> LazyHTML.query("#home-intro") |> Enum.any?()
  end
end
