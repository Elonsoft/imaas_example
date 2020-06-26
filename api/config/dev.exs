import Config

config :imaas, Imaas.Repo,
  username: "postgres",
  password: "postgres",
  database: "imaas_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :imaas, ImaasWeb.Endpoint,
  http: [port: 4001],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime

config :imaas,
  web_url: "http://localhost:4000",
  application_host: "http://localhost:4001",
  converter_url: "http://localhost:4002"
