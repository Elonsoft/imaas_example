defmodule ImaasClientWeb.PostController do
  @moduledoc false

  use ImaasClientWeb, :controller

  alias ImaasClient.Api

  action_fallback ImaasClientWeb.ErrorController

  def index(conn, _) do
    with {:ok, posts} <- Api.list_posts() do
      render(conn, :index, posts: posts)
    end
  end

  def new(conn, _) do
    render(conn, :form, changeset: Api.new_form())
  end

  def create(conn, params) do
    with %{"form" => form} <- params,
         {:ok, _} <- Api.create_post(form) do
      redirect(conn, to: Routes.post_path(conn, :index))
    else
      empty_form when is_map(empty_form) ->
        render(conn, :form, changeset: Api.invalid_form())

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :form, changeset: changeset)

      e ->
        e
    end
  end
end
