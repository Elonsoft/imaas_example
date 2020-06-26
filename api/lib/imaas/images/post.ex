defmodule Imaas.Images.Post do
  @moduledoc false

  use Ecto.Schema

  import Arc.Ecto.Schema
  import Ecto.Changeset

  alias Imaas.Images.Image

  schema "posts" do
    field :image, Image.Type
    timestamps()
  end

  def changeset(%__MODULE__{} = post, attrs) do
    post
    |> cast_attachments(attrs, [:image])
    |> validate_required([:image])
  end
end
