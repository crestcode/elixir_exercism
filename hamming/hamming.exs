defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "Lists must be the same length"}
  end
  def hamming_distance(strand1, strand2) do
    hamming_distance(strand1, strand2, 0)
  end

  defp hamming_distance([], [], acc), do: {:ok, acc}
  defp hamming_distance([h1 | t1], [h2 | t2], acc) when h1 != h2 do
    hamming_distance(t1, t2, acc + 1)
  end
  defp hamming_distance([h1 | t1], [h2 | t2], acc) do
    hamming_distance(t1, t2, acc)
  end
end
