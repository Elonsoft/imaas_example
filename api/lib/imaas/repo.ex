defmodule Imaas.Repo do
  use Ecto.Repo,
    otp_app: :imaas,
    adapter: Ecto.Adapters.Postgres
end
