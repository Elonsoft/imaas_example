defmodule Imaas.MixProject do
  use Mix.Project

  def project do
    [
      app: :imaas,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: ["lib"],
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Imaas.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {
        :arc_ecto,
        git: "https://github.com/Elonsoft/arc_ecto.git",
        commit: "3a5383850ba6e2a5e996eaaa8ab8fc8b79ea2c6e"
      },
      {:arc, "~> 0.11"},
      {:ecto_sql, "~> 3.1"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.10"},
      {:phoenix_ecto, "~> 4.0"},
      {:plug_cowboy, "~> 2.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"]
    ]
  end
end
