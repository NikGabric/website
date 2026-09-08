defmodule WebsiteWeb.CvHTML do
  use WebsiteWeb, :html

  embed_templates "cv_html/*"

  attr :title, :string
  attr :start_year, :integer
  attr :end_year, :integer
  attr :desc, :string
  attr :tech, :string

  def experience_card(assigns) do
    ~H"""
    <div class="flex flex-wrap items-baseline justify-between gap-x-4">
      <h3 class="font-semibold">{@title}</h3>
      <span class="text-sm text-base-content/60">{@start_year} - {@end_year}</span>
    </div>
    <p class="mt-1 text-base-content/80">
      {@desc}
    </p>
    <p class="mt-1 text-sm text-base-content/60">
      {@tech}
    </p>
    """
  end
end
