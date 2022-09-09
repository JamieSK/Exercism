# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []) do
    Agent.start(fn -> %{next_id: 0, plots: []} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, & &1.plots)
  end

  def register(pid, register_to) do
    new_plot = %Plot{plot_id: Agent.get(pid, & &1.next_id), registered_to: register_to}
    case Agent.update(pid, &(%{next_id: &1.next_id + 1, plots: &1.plots ++ [new_plot]})) do
      :ok -> new_plot
      _ -> nil
    end    
  end

  def release(pid, plot_id) do
    Agent.update(pid, &(Map.update!(&1, :plots, fn ps -> Enum.reject(ps, fn p -> p.plot_id == plot_id end) end)))
  end

  def get_registration(pid, plot_id) do
    pid
    |> list_registrations()
    |> Enum.find({:not_found, "plot is unregistered"}, fn p -> p.plot_id == plot_id end)
  end
end
