defmodule ImaasClientWeb.ErrorController do
  @moduledoc false

  use ImaasClientWeb, :controller

  alias ImaasClientWeb.ErrorView

  def call(conn, _) do
    conn
    |> put_view(ErrorView)
    |> put_status(:internal_server_error)
    |> render(:"500")
  end
end
