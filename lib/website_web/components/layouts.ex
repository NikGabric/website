defmodule WebsiteWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use WebsiteWeb, :html

  embed_templates "layouts/*"

  @doc """
  Renders your app layout.
  """
  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="flex justify-between py-4 max-w-240 mx-auto">
      <.link navigate={~p"/"}>
        gabric.dev
      </.link>

      <div class="flex gap-8">
        <.link navigate={~p"/cv"}>
          cv
        </.link>
        <.link navigate={~p"/blog"}>
          blog
        </.link>
      </div>
    </header>

    <main class="py-20 max-w-240 mx-auto">
      <div class="mx-auto space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>
    """
  end
end
