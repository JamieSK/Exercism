defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size > byte_size(s), do: []
  def slices(_, size) when size < 1, do: []

  def slices(s, size) do
    0..(String.length(s) - size)
    |> Enum.reduce([], fn offset, substrings ->
      [String.slice(s, offset..(offset + size - 1)) | substrings]
    end)
    |> Enum.reverse()
  end
end
