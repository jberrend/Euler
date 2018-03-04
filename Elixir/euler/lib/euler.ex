defmodule Euler do
  @moduledoc """
  Documentation for Euler.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Euler.hello
      :world

  """
  def problem16 do
    num = Kernel.trunc(:math.pow(2, 1000))

    Enum.reduce(Integer.digits(num, 10), 0, fn x, acc ->
      x + acc
    end)
  end
end
