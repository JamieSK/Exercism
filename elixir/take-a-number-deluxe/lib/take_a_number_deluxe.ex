defmodule TakeANumberDeluxe do
  use GenServer

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    GenServer.call(machine, :state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    case GenServer.call(machine, :queue_new_number) do
      num when is_number(num) -> {:ok, num}
      err -> {:error, err}
    end
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    case GenServer.call(machine, {:serve_next_queued_number, priority_number}) do
      num when is_number(num) -> {:ok, num}
      err -> {:error, err}
    end
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.cast(machine, :reset_state)
  end

  @impl GenServer
  def init(args) do
    case TakeANumberDeluxe.State.new(
          Keyword.get(args, :min_number),
          Keyword.get(args, :max_number),
          Keyword.get(args, :auto_shutdown_timeout, :infinity)) do
      {:ok, state} -> {:ok, state, state.auto_shutdown_timeout}
      {:error, err} -> {:stop, err}
    end
  end

  @impl GenServer
  def handle_call(message, _, state) do
    case message do
      :state -> {:reply, state, state, state.auto_shutdown_timeout}
      :queue_new_number -> 
        case TakeANumberDeluxe.State.queue_new_number(state) do
          {:ok, new_number, new_state} -> {:reply, new_number, new_state, state.auto_shutdown_timeout}
          {:error, error} -> {:reply, error, state, state.auto_shutdown_timeout}
        end
      {:serve_next_queued_number, priority_number} ->
        case TakeANumberDeluxe.State.serve_next_queued_number(state, priority_number) do
          {:ok, next_number, new_state} -> {:reply, next_number, new_state, state.auto_shutdown_timeout}
          {:error, error} -> {:reply, error, state, state.auto_shutdown_timeout}
        end
    end
  end

  @impl GenServer
  def handle_cast(_message, state) do
    case TakeANumberDeluxe.State.new(state.min_number, state.max_number, state.auto_shutdown_timeout) do
      {:ok, new_state} -> {:noreply, new_state, state.auto_shutdown_timeout}
      {:error, _err} -> {:noreply, state, state.auto_shutdown_timeout}
    end
  end

  @impl GenServer
  def handle_info(message, state) do
    case message do
      :timeout -> {:stop, :normal, state}
      _ -> {:noreply, state, state.auto_shutdown_timeout}
    end
  end
end
