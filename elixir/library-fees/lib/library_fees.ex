defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(~T[12:00:00])
    |> Kernel.==(:lt)
  end

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(if before_noon?(checkout_datetime), do: 28, else: 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> neg_to_zero()
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)

    checkout_datetime
    |> return_date()
    |> days_late(return_datetime)
    |> Kernel.*(rate)
    |> half_if(monday?(return_datetime))
  end

  defp neg_to_zero(int) do
    if int < 0, do: 0, else: int
  end

  defp half_if(int, pred) do
    if pred, do: Integer.floor_div(int, 2), else: int
  end
end
