defmodule WebsiteWeb.HomeHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use WebsiteWeb, :html

  embed_templates "home_html/*"
end
