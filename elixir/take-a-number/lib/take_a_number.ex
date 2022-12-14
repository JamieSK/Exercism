defmodule TakeANumber do
  def start() do
    spawn(fn -> process(0) end)
  end

  defp process(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        process(state)
      {:take_a_number, sender_pid} ->
        state = state + 1
        send(sender_pid, state)
        process(state)
      :stop -> nil
      _ -> process(state)
    end
  end
end
