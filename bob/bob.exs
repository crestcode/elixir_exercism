defmodule Bob do
  def hey(input) do
    cond do
        Regex.match?(~r/\?$/, input) -> "Sure."
        Regex.match?(~r/^(?=.[^a-z])(?=.*[\p{Lu}]).+$/, input) -> "Whoa, chill out!"
        Regex.match?(~r/^\s*$/, input) -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end
end
