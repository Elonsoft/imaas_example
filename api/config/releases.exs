import Config

application_host =
  System.get_env("APPLICATION_HOST") ||
    raise "environment variable APPLICATION_HOST is missing"

port =
  System.get_env("PORT") ||
    raise "environment variable PORT is missing"

config :imaas, ImaasWeb.Endpoint,
  http: [port: String.to_integer(port)],
  url: [host: application_host, port: String.to_integer(port)]

postgres_user =
  System.get_env("POSTGRES_USER") ||
    raise "environment variable POSTGRES_USER is missing"

postgres_password =
  System.get_env("POSTGRES_PASSWORD") ||
    raise "environment variable POSTGRES_PASSWORD is missing"

postgres_db =
  System.get_env("POSTGRES_DB") ||
    raise "environment variable POSTGRES_DB is missing"

postgres_host =
  System.get_env("POSTGRES_HOST") ||
    raise "environment variable POSTGRES_HOST is missing"

postgres_pool_size =
  "POSTGRES_POOL_SIZE"
  |> System.get_env("10")
  |> String.to_integer()

config :imaas, Imaas.Repo,
  username: postgres_user,
  password: postgres_password,
  database: postgres_db,
  hostname: postgres_host,
  pool_size: postgres_pool_size

web_url =
  System.get_env("WEB_URL") ||
    raise "environment variable WEB_URL is missing"

config :logger,
  level: "LOG_LEVEL" |> System.get_env("info") |> String.to_existing_atom()

config :arc,
  storage_dir: Path.join(Application.app_dir(:imaas), "uploads")

converter_url =
  System.get_env("CONVERTER_URL") ||
    raise "environment variable CONVERTER_URL is missing"

config :imaas,
  application_host: "http://#{application_host}",
  web_url: web_url,
  converter_url: converter_url
