defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, _, b) when b < 2, do: {:error, "output base must be >= 2"}
  def convert(_, b, _) when b < 2, do: {:error, "input base must be >= 2"}
  def convert(_, b, _) when b < 2, do: {:error, "input base must be >= 2"}
  def convert(digits, input_base, output_base) do
    case digits
        |> to_number(input_base)
        |> from_number(output_base) do
      {:error, any} -> {:error, any}
      list -> {:ok, list}
    end
  end

  defp to_number(list, input_base) do
    list
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce_while(0, fn {val, exponent}, acc ->
      if val < 0 or val >= input_base do
        {:halt, {:error, "all digits must be >= 0 and < input base"}}
      else
        {:cont, acc + (val * input_base ** exponent)}
      end
    end)
  end

  defp from_number(0, _), do: [0]
  defp from_number({:error, any}, _), do: {:error, any}
  defp from_number(number, output_base) do
    max_digits(number, output_base)..0//-1
    |> Enum.reduce({number, []}, fn exponent, {remainder, list} ->
        case {div(remainder, output_base ** exponent), length(list)} do
          {0, 0} -> {remainder, list}
          {0, _} -> {remainder, [0 | list]}
          {m, _} -> {remainder - (m * output_base ** exponent), [m | list]}
        end
      end)
    |> elem(1)
    |> Enum.reverse()
  end

  defp max_digits(number, base) do
    floor((:math.log(number) / :math.log(base)) + 1)
  end
end
