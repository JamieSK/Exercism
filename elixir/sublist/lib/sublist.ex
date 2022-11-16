defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal
  def compare(_, []), do: :superlist
  def compare([], _), do: :sublist
  def compare(a, b) when length(b) < length(a) do
    Enum.reduce_while(Enum.chunk_every(a, length(b), 1, :discard), :unequal, fn sublist, match_found ->
      if sublist === b, do: {:halt, :superlist}, else: {:cont, match_found}
    end)
  end
  def compare(a, b) when length(a) < length(b) do
    Enum.reduce_while(Enum.chunk_every(b, length(a), 1, :discard), :unequal, fn sublist, match_found ->
      if sublist === a, do: {:halt, :sublist}, else: {:cont, match_found}
    end)
  end
  def compare(_a, _b), do: :unequal
end
