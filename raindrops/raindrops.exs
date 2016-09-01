defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  def convert(number) do
    convert(number, [])
  end

  defp convert(number, acc) do
    cond do
      rem(number, 3) == 0 -> convert(div(number, 3), acc ++ ["Pling"])
      rem(number, 5) == 0 -> convert(div(number, 5), acc ++ ["Plang"])
      rem(number, 7) == 0 -> convert(div(number, 7), acc ++ ["Plong"])
      Enum.empty? acc -> Integer.to_string(number)
      true -> acc |> Enum.uniq |> Enum.join
    end
  end
end
