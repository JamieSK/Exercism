defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @seconds_in_year_on %{
    mercury: 0.2408467 * 31557600,
    venus: 0.61519726 * 31557600,
    earth: 31557600,
    mars: 1.8808158 * 31557600,
    jupiter: 11.862615 * 31557600,
    saturn: 29.447498 * 31557600,
    uranus: 84.016846 * 31557600,
    neptune: 164.79132 * 31557600
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    case Map.fetch(@seconds_in_year_on, planet) do
      :error -> {:error, "not a planet"}
      {:ok, year_length} -> {:ok, seconds / year_length}
    end
  end
end
