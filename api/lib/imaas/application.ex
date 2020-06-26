defmodule Imaas.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Imaas.Repo,
      ImaasWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Imaas.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ImaasWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
