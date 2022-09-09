defmodule NameBadge do
  def print(id, name, department) do
    if id do
      "[#{id}] - #{name} - #{String.upcase(if department, do: department, else: "owner")}"
    else
      "#{name} - #{String.upcase(if department, do: department, else: "owner")}"
    end
  end
end
