defmodule ImaasClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :imaas_client,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: ["lib"],
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {ImaasClient.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.0"},
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.10"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_pubsub, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
