defmodule WebsiteWeb.CvHTML do
  use WebsiteWeb, :html

  embed_templates "cv_html/*"

  attr :title, :string
  slot :inner_block, required: true

  def section(assigns) do
    ~H"""
    <section class="mt-10">
      <h2 class="text-xl text-primary">## {@title}</h2>
      {render_slot(@inner_block)}
    </section>
    """
  end

  attr :title, :string
  attr :start_year, :integer
  attr :end_year, :integer
  attr :desc, :string
  attr :tech, :string

  def experience_card(assigns) do
    ~H"""
    <div class="flex flex-wrap items-baseline justify-between gap-x-4">
      <h3 class="font-semibold text-lg">{@title}</h3>
      <span class="text-sm text-base-content/60">{@start_year} - {@end_year}</span>
    </div>
    <p class="mt-1 text-base-content/80">
      {@desc}
    </p>
    <p class="mt-1 text-xs text-base-content/50">
      {@tech}
    </p>
    """
  end
end
