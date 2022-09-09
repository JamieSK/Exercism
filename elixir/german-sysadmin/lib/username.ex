defmodule Username do
  def sanitize([]) do
    ''
  end

  def sanitize([head | tail]) do
    substitute(head) ++ sanitize(tail)
  end

  defp substitute(char) do
    case char do
      char when char >= ?a and char <= ?z -> [char]
      char when char == ?_ -> [char]
      char when char == ?ä -> [?a, ?e]
      char when char == ?ö -> [?o, ?e]
      char when char == ?ü -> [?u, ?e]
      char when char == ?ß -> [?s, ?s]
      _ -> []
    end
  end
end
