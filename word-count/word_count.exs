defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Enum.reduce words(sentence), %{}, &increment_count(&1, &2)
  end

  defp words(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[^\w -]+/u, "")
    |> String.split(~r/[_ ]+/)
  end

  defp increment_count(word, acc) do
    Map.update acc, word, 1, &(&1 + 1)
  end
end
