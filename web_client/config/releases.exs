import Config

application_host =
  System.get_env("APPLICATION_HOST") ||
    raise "environment variable APPLICATION_HOST is missing"

port =
  System.get_env("PORT") ||
    raise "environment variable PORT is missing"

config :imaas_client, ImaasClientWeb.Endpoint,
  http: [port: String.to_integer(port)],
  url: [host: application_host, port: String.to_integer(port)]

config :logger,
  level: "LOG_LEVEL" |> System.get_env("info") |> String.to_existing_atom()

api_url =
  System.get_env("API_URL") ||
    raise "environment variable API_URL is missing"

config :imaas_client,
  api_url: api_url
