defmodule Euler do

  def problem9 do
    pythagorean_triplet 498, 499, 500
  end

  def pythagorean_triplet(a, b, c) do
    cond do
      pow(a, 2) + pow(b, 2) == pow(c, 2) and a + b + c == 1000 ->
        a * b * c
      b == 0 -> pythagorean_triplet c - 3, c - 2, c - 1
      a == 0 -> pythagorean_triplet b - 2, b - 1, c
      true   -> pythagorean_triplet a - 1, b, c
    end
  end

  def pow(base, exp) do
    :math.pow base, exp
  end

  def problem16 do
    num = Kernel.trunc(:math.pow(2, 1000))

    Enum.reduce(Integer.digits(num, 10), 0, fn x, acc ->
      x + acc
    end)
  end

  def problem29 do
    for a <- 2..100,
        b <- 2..100 do
          :math.pow(a, b)
    end
    |> MapSet.new |> MapSet.size
  end
end
