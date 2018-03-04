defmodule Benchmark do
    def time f do
        result = f |> :timer.tc |> elem(0) |> Kernel./(1000)
        Float.to_string(result) <> " ms"
    end
end