defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&oink/1)
    |> Enum.map(&List.to_string/1)
    |> Enum.join(" ")
  end

  defp oink([c | _] = word) when c in [?a, ?e, ?i, ?o, ?u] do
    word ++ [?a, ?y]
  end

  defp oink([c, d | _] = word) when c in [?x, ?y] and d not in [?a, ?e, ?i, ?o, ?u] do
    word ++ [?a, ?y]
  end

  defp oink([c, d | tail]) when c == ?q and d == ?u do
    oink(tail ++ [c, d])
  end

  defp oink([c | tail]) do
    oink(tail ++ [c])
  end
end
