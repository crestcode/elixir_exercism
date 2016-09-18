defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&anagram? String.downcase(base), String.downcase(&1))
  end

  defp anagram?(base, candidate) do
    base != candidate && sorted_chars(base) === sorted_chars(candidate)
  end

  defp sorted_chars(word) do
    word
    |> String.graphemes
    |> Enum.sort
  end
end
