defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @not_brackets ~r/[^\(\)\{\}\[\]]/
  @pair ~r/\(\)|\{\}|\[\]/

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.replace(@not_brackets, "")
    |> match_brackets
  end

  defp match_brackets(""), do: true

  defp match_brackets(str) do
    if Regex.match? @pair, str do
      match_brackets(String.replace str, @pair, "")
    else
      false
    end
  end
end
