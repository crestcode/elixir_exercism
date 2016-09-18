defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist_of? a, b -> :sublist
      sublist_of? b, a -> :superlist
      true -> :unequal
    end
  end

  defp sublist_of?(a, b) do
    cond do
      length(a) > length(b) -> false
      a === Enum.take(b, length a) -> true
      true -> sublist_of?(a, tl b)
    end
  end
end
