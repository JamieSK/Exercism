defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case (x ** 2 + y ** 2) ** 0.5 do
      d when d <= 1 -> 10
      d when d <= 5 -> 5
      d when d <= 10 -> 1
      _ -> 0
    end
  end
end
