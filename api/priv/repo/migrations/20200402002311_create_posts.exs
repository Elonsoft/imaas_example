defmodule Imaas.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :image, :string
      timestamps()
    end
  end
end
