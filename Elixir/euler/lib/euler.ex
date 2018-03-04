defmodule Euler do
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
