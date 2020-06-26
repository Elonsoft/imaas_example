defmodule ImaasClientWeb.Router do
  use ImaasClientWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ImaasClientWeb do
    pipe_through :browser

    get "/posts", PostController, :index
    get "/posts/new", PostController, :new
    post "/posts", PostController, :create
  end
end
