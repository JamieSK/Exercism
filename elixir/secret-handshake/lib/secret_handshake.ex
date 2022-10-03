defmodule SecretHandshake do
  import Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    instructions = Enum.reduce(%{
      1 => "wink",
      2 => "double blink",
      4 => "close your eyes",
      8 => "jump"
    }, [], fn {num, instruction}, acc ->
      if (num &&& code) == num do
        [instruction | acc]
      else
        acc
      end
    end)

    if (16 &&& code) == 16 do
      instructions
    else
      Enum.reverse(instructions)
    end
  end
end
