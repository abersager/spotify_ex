defmodule Spotify.AuthenticationClient do
  @moduledoc false

  alias Spotify.{
    AuthenticationErrorResponse,
    AuthRequest,
    Credentials
  }

  alias HTTPoison.{
    Error,
    Response
  }

  def post(params) do
    with {:ok, %Response{status_code: _code, body: body}} <- AuthRequest.post(params),
         {:ok, response} <- Poison.decode(body) do
      case response do
        %{"error" => error, "error_description" => error_description} ->
          {:error,
           %AuthenticationErrorResponse{error: error, error_description: error_description}}

        success_response ->
          {:ok, Credentials.get_tokens_from_response(success_response)}
      end
    else
      {:error, %Error{reason: reason}} ->
        {:error, reason}

      _generic_error ->
        {:error, error: "unknown_error", error_description: "Error parsing response from Spotify"}
    end
  end
end
