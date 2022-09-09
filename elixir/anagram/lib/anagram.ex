defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = String.downcase(base)
    Enum.filter(candidates, fn candidate ->
      candidate = String.downcase(candidate)

      base != candidate and
      base |> String.graphemes() |> Enum.sort()
      ==
      candidate |> String.graphemes() |> Enum.sort()
    end)
  end
end
