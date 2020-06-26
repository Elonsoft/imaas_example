defmodule ImaasWeb.ErrorView do
  use ImaasWeb, :view

  def render("404.html", _assigns) do
    "Not Found"
  end

  def render("500.html", _assigns) do
    "Internal Server Error"
  end

  def render("unprocessable_entity.json", %{errors: errors}) do
    %{errors: errors}
  end
end
