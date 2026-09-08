defmodule Website.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Website.Blog` context.
  """

  @doc """
  Generate a unique post slug.
  """
  def unique_post_slug, do: "some slug#{System.unique_integer([:positive])}"

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        excerpt: "some excerpt",
        published: true,
        published_at: ~U[2026-09-07 10:49:00Z],
        slug: unique_post_slug(),
        title: "some title"
      })
      |> Website.Blog.create_post()

    post
  end
end
