defmodule ImaasClient.Api.Form do
  @moduledoc false

  use Ecto.Schema

  alias Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :image, :any, virtual: true
    field :image_thumb, :any, virtual: true
    field :created_at, :utc_datetime
  end

  def changeset(%__MODULE__{} = form, attrs) do
    Changeset.cast(form, attrs, [:image])
  end

  def invalid_changeset do
    %__MODULE__{}
    |> Changeset.change()
    |> Changeset.validate_required([:image])
    |> with_action(:insert)
  end

  defp with_action(changeset, action) do
    %{changeset | action: action}
  end

  def parse(attrs) do
    %__MODULE__{}
    |> Changeset.cast(attrs, [:image])
    |> Changeset.validate_required([:image])
    |> Changeset.apply_action(:insert)
  end

  def parse_list(attrs) when is_list(attrs) do
    traverse(attrs, fn attrs ->
      %__MODULE__{}
      |> Changeset.cast(attrs, [:image, :image_thumb, :created_at])
      |> Changeset.apply_action(:insert)
    end)
  end

  defp traverse(enum, fun) do
    with {:ok, enum} <- Enum.reduce(enum, {:ok, []}, traversed(fun)) do
      {:ok, Enum.reverse(enum)}
    end
  end

  defp traversed(fun) do
    fn x, macc ->
      with {:ok, acc} <- macc,
           {:ok, y} <- fun.(x) do
        {:ok, [y | acc]}
      end
    end
  end
end
