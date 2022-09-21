defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    "sphinxofblackquartzjudgemyvow"
    |> String.split("")
    |> Enum.reduce_while(String.downcase(sentence), fn c, string ->
      if String.contains?(string, c) do
        {:cont, string}
      else
        {:halt, false}
      end
    end)
    |> Kernel.!=(false)
  end
end
