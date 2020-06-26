defmodule ImaasClient.Api do
  @moduledoc false

  alias ImaasClient.Api.Form

  def list_posts do
    with {:ok, %{status_code: 200, body: body}} <- request_posts_list(),
         {:ok, attrs} <- Jason.decode(body) do
      Form.parse_list(attrs)
    end
  end

  defp request_posts_list do
    HTTPoison.get(posts_url(), accept: "application/json")
  end

  def new_form do
    Form.changeset(%Form{}, %{})
  end

  def invalid_form do
    Form.invalid_changeset()
  end

  def create_post(attrs) do
    with {:ok, %{image: upload}} <- Form.parse(attrs) do
      upload
      |> upload_to_base64
      |> send_new_post
    end
  end

  defp upload_to_base64(%{content_type: content_type, path: path}) do
    "data:#{content_type};base64,#{file_to_base64(path)}"
  end

  defp file_to_base64(path) do
    path |> File.read!() |> Base.encode64()
  end

  defp send_new_post(image) do
    HTTPoison.post(posts_url(), Jason.encode!(%{image: image}),
      accept: "application/json",
      "content-type": "application/json"
    )
  end

  defp posts_url do
    "#{Application.get_env(:imaas_client, :api_url)}/posts"
  end
end
