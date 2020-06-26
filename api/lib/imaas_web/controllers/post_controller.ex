defmodule ImaasWeb.PostController do
  @moduledoc false

  use ImaasWeb, :controller

  alias Imaas.Images

  action_fallback ImaasWeb.ErrorController

  def index(conn, _) do
    render(conn, :index, posts: Images.list())
  end

  def create(conn, attrs) do
    with {:ok, post} <- Images.create(attrs) do
      conn
      |> put_status(:created)
      |> render(:created, post: post)
    end
  end
end
