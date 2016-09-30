defmodule Roman do
  @roman_numerals [
                    M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
                    L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1
                  ]
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    numerals(@roman_numerals, number, "")
  end

  defp numerals(_, 0, acc), do: acc
  defp numerals([{k, v} | tail], number, acc) do
    numerals(tail, rem(number, v), acc <> String.duplicate(to_string(k), div(number, v)))
  end
end
