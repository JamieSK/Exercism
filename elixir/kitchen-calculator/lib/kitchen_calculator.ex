defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 240}
  end

  def to_milliliter({:fluid_ounce, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 30}
  end

  def to_milliliter({:teaspoon, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 5}
  end

  def to_milliliter({:tablespoon, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 15}
  end

  def to_milliliter({:milliliter, _} = volume_pair) do
    volume_pair
  end

  def from_milliliter(volume_pair, unit = :cup) do
    {unit, get_volume(volume_pair) / 240}
  end

  def from_milliliter(volume_pair, unit = :fluid_ounce) do
    {unit, get_volume(volume_pair) / 30}
  end

  def from_milliliter(volume_pair, unit = :teaspoon) do
    {unit, get_volume(volume_pair) / 5}
  end

  def from_milliliter(volume_pair, unit = :tablespoon) do
    {unit, get_volume(volume_pair) / 15}
  end

  def from_milliliter(volume_pair, _unit = :milliliter) do
    volume_pair
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
