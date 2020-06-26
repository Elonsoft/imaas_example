# General application configuration
use Mix.Config

config :imaas_client, ImaasClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HTgWnSze5YcaIFK1GNopIPOYP7rZntPybvc7o5CNppio1IjCZslKVofzXse/O9yA",
  render_errors: [view: ImaasClientWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ImaasClient.PubSub, adapter: Phoenix.PubSub.PG2],
  server: true

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
