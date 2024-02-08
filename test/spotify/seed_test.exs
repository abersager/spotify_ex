defmodule Spotify.SeedTest do
  use ExUnit.Case

  test "%Seed{}" do
    actual = %Spotify.Seed{} |> Map.from_struct() |> Map.keys() |> Enum.sort()

    expected =
      ~w[afterFilteringSize afterRelinkingSize href id initialPoolSize type]a |> Enum.sort()

    assert actual == expected
  end
end
