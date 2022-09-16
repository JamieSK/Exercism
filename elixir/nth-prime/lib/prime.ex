defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when is_integer(count) and count > 0 do
    2
    |> Stream.iterate(&(&1 + 1))
    |> Enum.flat_map_reduce({[], 0}, fn i, {primes, found} ->
      if found < count do
        if Enum.any?(primes, fn p -> rem(i, p) == 0 end) do
          {[], {primes, found}}
        else
          {[i], {[i | primes], found + 1}}
        end
      else
        {:halt, i - 1}
      end
    end)
    |> elem(1)
  end
end
