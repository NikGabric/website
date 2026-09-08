defmodule WebsiteWeb.CvController do
  use WebsiteWeb, :controller

  alias Website.Cv

  def show(conn, _params) do
    render(conn, :show,
      experience: Cv.experience(),
      skills: Cv.skills(),
      projects: Cv.projects(),
      education: Cv.education(),
      languages: Cv.languages()
    )
  end
end
