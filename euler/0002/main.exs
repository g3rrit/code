defmodule Main do
    def fib(a, b, max) do
        r = a + b
        if a >= max do
            []
        else
            [a | fib(b, r, max)]
        end
    end

    def main do
        List.foldl(fib(0, 1, 4000000), 0, fn(x, acc) ->
            if rem(x, 2) == 0 do
                acc + x
            else
                acc
            end
        end)
    end
end
