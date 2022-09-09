defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part(ast, acc) do
    case ast do
      {op, _, [{name_atom, _, args} | _]} when op in [:def, :defp] and name_atom != :when ->
        name = Atom.to_string(name_atom)
        arity = length(args || [])
        {ast, [String.slice(name, 0, arity) | acc]}
      {op, _, [{_, _, [{name_atom, _, args} | _]} | _]} when op in [:def, :defp] ->
        name = Atom.to_string(name_atom)
        arity = length(args || [])
        {ast, [String.slice(name, 0, arity) | acc]}
      _ -> {ast, acc}
    end
  end

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> Macro.prewalk([], &decode_secret_message_part/2)
    |> elem(1)
    |> Enum.reverse()
    |> Enum.join()
  end
end
