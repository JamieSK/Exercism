defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) do
    do_calc(input, 0)
  end

  defp do_calc(1, steps) do
    steps
  end

  defp do_calc(n, steps) when n > 0 and rem(n, 2) == 0 do
    do_calc(div(n, 2), steps + 1)
  end

  defp do_calc(n, steps) when n > 0 and rem(n, 2) != 0 do
    do_calc(3 * n + 1, steps + 1)
  end
end
