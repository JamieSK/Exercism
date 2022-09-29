defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.to_charlist()
    |> Enum.chunk_by(&(&1))
    |> Enum.reduce("", fn chars, acc ->
      acc <> (chars |> List.to_string() |> then(&(count(&1) <> String.first(&1))))
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.split(~r/\d*[^\d]{1}/, include_captures: true, trim: true)
    |> Enum.reduce("", fn s, acc ->
      acc <> case s do
        <<char::binary-size(1)>> -> char
        <<digit::binary-size(1), char::binary-size(1)>> -> String.duplicate(char, String.to_integer(digit))
        <<digit::binary-size(2), char::binary-size(1)>> -> String.duplicate(char, String.to_integer(digit))
      end
    end)
  end

  defp count(string) do
    case String.length(string) do
      l when l == 1 -> ""
      l -> Integer.to_string(l) 
    end
  end
end
