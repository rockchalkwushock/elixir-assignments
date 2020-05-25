defmodule FizzBuzz do
  @moduledoc """
  Module for executing the FizzBuzz problem in Elixir.
  """

  def execute(list) do
    loop_with_cond(list)
  end

  # Define our guard clauses.
  defguardp is_multiple_of_3(int) when rem(int, 3) === 0
  defguardp is_multiple_of_5(int) when rem(int, 5) === 0
  defguardp is_multiple_of_15(int) when rem(int, 15) === 0

  # Declare the loop function that will handle the
  # recursion of the list and return the correct values.

  # Terminating function.
  defp loop([]), do: "END"

  # Only executes on multipels of 15
  # This must come first in our declarations of loop/?
  # Order matters!!!
  defp loop([head|tail]) when is_multiple_of_15(head) do
    IO.puts("FIZZBUZZ")
    loop(tail)
  end

  # Only executes on multiples of 3.
  defp loop([head|tail]) when is_multiple_of_3(head) do
    IO.puts("FIZZ")
    loop(tail)
  end

  # Only executes on multiples of 5.
  defp loop([head|tail]) when is_multiple_of_5(head) do
    IO.puts("BUZZ")
    loop(tail)
  end

  # Executes on all other cases.
  defp loop([head|tail]) do
    IO.puts(head)
    loop(tail)
  end

  # Reimplements FizzBuzz problem with a cond check instead of gaurds.

  # Terminating function.
  defp loop_with_cond([]), do: "END"

  # We only need one more instance of the 'loop_with_cond' function
  # because we will use a 'cond' to check our state.
  defp loop_with_cond([head|tail]) do
    cond do
      # Multiples of 15.
      rem(head, 15) === 0 -> IO.puts("FIZBUZZ")
      # Multiples of 5.
      rem(head, 5) === 0 -> IO.puts("BUZZ")
      # Multiples of 3.
      rem(head, 3) === 0 -> IO.puts("FIZZ")
      # All other cases.
      head -> IO.puts(head)
    end
    # Perform recursive call.
    loop_with_cond(tail)
  end
end
