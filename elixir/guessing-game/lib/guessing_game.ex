defmodule GuessingGame do
  def compare(_secret_number, guess \\ :no_guess)
  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end

  def compare(secret_number, guess) when secret_number - 1 == guess do
    "So close"
  end

  def compare(secret_number, guess) when secret_number + 1 == guess do
    "So close"
  end

  def compare(_secret_number, guess) when :no_guess == guess do
    "Make a guess"
  end

  def compare(secret_number, guess) when secret_number < guess do
    "Too high"
  end

  def compare(secret_number, guess) when secret_number > guess do
    "Too low"
  end
end
