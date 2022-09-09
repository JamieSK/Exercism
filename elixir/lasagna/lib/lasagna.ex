defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven() do
    40
  end

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(in_oven_for) do
    Lasagna.expected_minutes_in_oven() - in_oven_for
  end

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(layers) do
    2 * layers
  end

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(layers, in_oven_for) do
    Lasagna.preparation_time_in_minutes(layers) + in_oven_for
  end

  # Please define the 'alarm/0' function
  def alarm() do
    "Ding!"
  end
end
