defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(dot, frame_number, opts) :: dot

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, _) do
    if rem(frame_number, 4) == 0 do
      %DancingDots.Dot{dot | opacity: dot.opacity / 2}
    else
      dot
    end
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init([velocity: velocity] = opts) when is_number(velocity), do: {:ok, opts}
  @impl DancingDots.Animation
  def init([velocity: velocity]), do: {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
  @impl DancingDots.Animation
  def init(_), do: {:error, "The :velocity option is required, and its value must be a number. Got: nil"}

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, [velocity: velocity]) do
    %DancingDots.Dot{dot | radius: dot.radius + ((frame_number - 1) * velocity)}
  end
end
