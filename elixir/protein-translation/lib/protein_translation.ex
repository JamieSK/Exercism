defmodule ProteinTranslation do
  @codon_to_protein %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    rna
    |> String.splitter("", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.reduce_while({:ok, []}, fn codon, {state, acc} ->
        codon
        |> Enum.join()
        |> of_codon()
        |> case do
            {:ok, "STOP"} -> {:halt, {state, acc}}
            {:ok, protein} -> {:cont, {state, acc ++ [protein]}}
            {:error, _} -> {:halt, {:error, "invalid RNA"}}
          end
      end)
  end

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case Map.get(
      @codon_to_protein,
      codon,
      "ERROR"
    ) do
      "ERROR" -> {:error, "invalid codon"}
      protein -> {:ok, protein}
    end
  end
end
