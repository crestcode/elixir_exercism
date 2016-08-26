defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    case valid?(nucleotide) && valid?(strand) do
      :true ->
        count strand, nucleotide, 0
      :false ->
        raise ArgumentError
    end
  end

  defp valid?(nucleotide) when is_integer nucleotide do
    nucleotide in @nucleotides
  end

  defp valid?(strand) when is_list strand do
    Enum.all? strand, &(valid? &1)
  end

  defp count([], nucleotide, count) do
    count
  end

  defp count([head | tail], nucleotide, count) when head == nucleotide do
    count tail, nucleotide, count + 1
  end

  defp count([head | tail], nucleotide, count) do
    count tail, nucleotide, count
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """

  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce @nucleotides, %{}, &Map.put(&2, &1, count(strand, &1))
  end
end
