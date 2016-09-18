defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    to(limit - 1, factors, 0)
  end

  defp to(0, _, acc) do
    acc
  end

  defp to(limit, factors, acc) do
    if Enum.any?(factors, fn(f) -> rem(limit, f) == 0 end) do
      to(limit - 1, factors, acc + limit)
    else
      to(limit - 1, factors, acc)
    end
  end
end
