defmodule Spotify.CategoryTest do
  use ExUnit.Case
  alias Spotify.Category

  test "%Category{}" do
    expected = ~w[href icons id name]a |> Enum.sort()
    actual = %Category{} |> Map.from_struct() |> Map.keys() |> Enum.sort()

    assert actual == expected
  end
end
