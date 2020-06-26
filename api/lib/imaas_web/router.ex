defmodule ImaasWeb.Router do
  use ImaasWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :put_secure_browser_headers
  end

  scope "/", ImaasWeb do
    pipe_through :api

    resources "/posts", PostController, only: [:index, :create]
  end
end
