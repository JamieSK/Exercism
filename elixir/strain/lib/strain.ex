defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([hd | tl], fun) do
    if fun.(hd), do: [hd | keep(tl, fun)], else: keep(tl, fun)
  end
  def keep([], _), do: []

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([hd | tl], fun) do
    if fun.(hd), do: discard(tl, fun), else: [hd | discard(tl, fun)]
  end
  def discard([], _), do: []
end
