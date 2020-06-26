defmodule ImaasWeb.ErrorController do
  @moduledoc false

  use ImaasWeb, :controller

  alias ImaasWeb.ErrorView

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_view(ErrorView)
    |> put_status(:unprocessable_entity)
    |> render(:unprocessable_entity, errors: errors_from_changeset(changeset))
  end

  defp errors_from_changeset(%{errors: errors}) do
    for {field, {msg, _}} <- errors, into: %{}, do: {field, msg}
  end
end
