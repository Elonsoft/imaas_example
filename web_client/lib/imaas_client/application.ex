defmodule ImaasClient.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      ImaasClientWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ImaasClient.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ImaasClientWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
