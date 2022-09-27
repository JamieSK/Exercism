defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    {number, ""}
    |> maybe_pling()
    |> maybe_plang()
    |> maybe_plong()
    |> maybe_digits()
    |> elem(1)
  end

  defp maybe_pling({number, string}) do
    {number, (if Integer.mod(number, 3) == 0, do: string <> "Pling", else: string)}
  end

  defp maybe_plang({number, string}) do
    {number, (if Integer.mod(number, 5) == 0, do: string <> "Plang", else: string)}
  end

  defp maybe_plong({number, string}) do
    {number, (if Integer.mod(number, 7) == 0, do: string <> "Plong", else: string)}
  end

  defp maybe_digits({number, string}) do
    {number, (if string == "", do: Integer.to_string(number), else: string)}
  end
end
