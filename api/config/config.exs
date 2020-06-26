# General application configuration
import Config

config :imaas, environment: Mix.env()

config :imaas,
  ecto_repos: [Imaas.Repo]

config :imaas, ImaasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dkNEeKMQHs1Z7GV/ZRP/5ITdas9GWA5XyTvXjjw384gvis6aj4mh5MOV7gGKthLq",
  render_errors: [view: ImaasWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Imaas.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :arc,
  storage: Arc.Storage.Local,
  storage_dir: "uploads"

import_config "#{Mix.env()}.exs"
