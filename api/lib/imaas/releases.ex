defmodule Imaas.Releases do
  @moduledoc false

  @app :imaas

  def create do
    for repo <- repos() do
      case repo.__adapter__.storage_up(repo.config) do
        :ok ->
          IO.puts("The database for #{inspect(repo)} has been created")

        {:error, :already_up} ->
          IO.puts("The database for #{inspect(repo)} has already been created")

        {:error, term} when is_binary(term) ->
          raise "The database for #{inspect(repo)} couldn't be created: #{term}"

        {:error, term} ->
          raise "The database for #{inspect(repo)} couldn't be created: #{inspect(term)}"
      end
    end
  end

  def migrate do
    for repo <- repos() do
      migrator = &Ecto.Migrator.run(&1, :up, all: true)
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, migrator)
    end
  end

  def rollback(repo, version) do
    migrator = &Ecto.Migrator.run(&1, :down, to: version)
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, migrator)
  end

  defp repos do
    Application.load(@app)
    Application.fetch_env!(@app, :ecto_repos)
  end
end
