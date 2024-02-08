defmodule Spotify.PagingTest do
  use ExUnit.Case

  alias Spotify.Paging

  test "%Paging{}" do
    expected = ~w[cursors href items limit next offset previous total]a |> Enum.sort()
    actual = %Paging{} |> Map.from_struct() |> Map.keys() |> Enum.sort()

    assert actual == expected
  end

  test "response/2" do
    collection = [%Spotify.Playlist{}]
    actual = Paging.response(%{}, collection)
    expected = %Paging{items: collection}

    assert actual == expected
  end
end
