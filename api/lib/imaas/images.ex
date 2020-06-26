defmodule Imaas.Images do
  @moduledoc false

  alias Imaas.Images.Post
  alias Imaas.Repo

  def list do
    Repo.all(Post)
  end

  def create(attrs) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end
end
