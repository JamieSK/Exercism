defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\s\-_]+/)
    |> Stream.map(&String.first/1)
    |> Stream.map(&String.upcase/1)
    |> Enum.join()
  end
end
