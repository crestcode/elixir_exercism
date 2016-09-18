defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @tile_values %{
    a: 1, b: 3, c: 3, d: 2, e: 1, f: 4, g: 2, h: 4, i: 1, j: 8, k: 5, l: 1, m: 3,
    n: 1, o: 1, p: 3, q: 10, r: 1, s: 1, t: 1, u: 1, v: 4,  w: 4, x: 8, y: 4, z: 10
  }

  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.replace(~r/\W/ , "")
    |> String.downcase
    |> String.graphemes
    |> Enum.map(&String.to_atom &1)
    |> Enum.map(&Map.get(@tile_values, &1, 0))
    |> Enum.sum
  end
end
