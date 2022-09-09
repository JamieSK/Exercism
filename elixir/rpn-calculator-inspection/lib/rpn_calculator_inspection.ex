defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    %{input: input, pid: spawn_link(fn -> calculator.(input) end)}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    Map.put(results, input, receive do
        {:EXIT, ^pid, :normal} -> :ok
        {:EXIT, ^pid, _} -> :error
      after
        100 -> :timeout
      end)
  end

  def reliability_check(calculator, inputs) do
    old_flag = Process.flag(:trap_exit, true)
    inputs
    |> Enum.reduce([], fn i, acc -> acc ++ [start_reliability_check(calculator, i)] end)
    |> Enum.reduce(%{}, &await_reliability_check_result/2)
    |> tap(fn _a -> Process.flag(:trap_exit, old_flag) end)
  end

  def correctness_check(calculator, inputs) do
    inputs
    |> Enum.map(fn i -> Task.async(fn -> calculator.(i) end) end)
    |> Enum.map(fn t -> Task.await(t, 100) end)
  end
end
