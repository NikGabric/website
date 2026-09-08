defmodule WebsiteWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use WebsiteWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="py-4 max-w-240 mx-auto">
      <div>
        gabric.dev
      </div>
    </header>

    <main class="px-4 py-20 sm:px-6 lg:px-8 max-w-240 mx-auto">
      <div class="mx-auto space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>
    """
  end
end
