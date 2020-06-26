defmodule ImaasWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :imaas

  if Application.get_env(:imaas, :environment) == :dev do
    plug Plug.Static,
      at: "/uploads",
      from: Path.expand("./uploads"),
      gzip: false
  else
    plug Plug.Static,
      at: "/uploads",
      from: {:imaas, "uploads"},
      gzip: false
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_imaas_key",
    signing_salt: "47A6UB82"

  plug ImaasWeb.Router
end
