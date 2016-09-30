defmodule Prime do
  require Logger

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1, do: raise ArgumentError
  def nth(count) do
    find_nth_prime(count)
  end

  defp find_nth_prime(count, current \\ 2)
  defp find_nth_prime(count, current) when count == 1, do: current
  defp find_nth_prime(count, current) do
    if Enum.any?(round(:math.sqrt(current + 1))..2, & rem(current + 1, &1) == 0) do
      find_nth_prime(count, current + 1)
    else
      find_nth_prime(count - 1, current + 1)
    end
  end
end
