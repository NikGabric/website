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
    <header class="flex justify-between items-end p-4 max-w-240 mx-auto border-l border-r border-dotted">
      <.link navigate={~p"/"} class="flex gap-2 text-xl font-bold">
        <img src={~p"/images/favicon.svg"} width={20} />gabric.dev
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

    <main class="max-w-240 mx-auto mb-4 border border-dotted">
      <div class="mx-auto space-y-4 p-4">
        {render_slot(@inner_block)}
      </div>
    </main>
    """
  end
end
