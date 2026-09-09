defmodule WebsiteWeb.BlogHTML do
  use WebsiteWeb, :html

  embed_templates "blog_html/*"

  attr :title, :string
  attr :excerpt, :string
  attr :slug, :string
  attr :published_at, DateTime

  def blog_card(assigns) do
    ~H"""
    <.link
      navigate={~p"/blog/#{@slug}"}
      class="flex h-32 gap-2 rounded-lg outline outline-neutral hover:bg-secondary/30 hover:text-secondary-content"
    >
      <img src={~p"/images/placeholder.svg"} alt="" class="rounded-xl p-2" />

      <div class="p-2">
        <h4>{@title}</h4>
        <p>{@excerpt}</p>
      </div>

      <div class="ml-auto shrink-0 p-2 text-md text-base-content/60">
        {Calendar.strftime(@published_at, "%d.%m.%Y")}
      </div>
    </.link>
    """
  end
end
