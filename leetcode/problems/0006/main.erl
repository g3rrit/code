-module(main).
-export([convert/2]).

append_elem([], _, _) -> [];
append_elem([Mat | Tail], 0, X) -> [lists:append(Mat, [X]) | Tail];
append_elem([Mat | Tail], I, X) -> [Mat | append_elem(Tail, I - 1, X)].

-spec convert(S :: unicode:unicode_binary(), NumRows :: integer()) -> unicode:unicode_binary().
convert(S, NumRows) ->
    Sl = binary_to_list(S),
    P = fun(C, {Mat, Delta, I}) -> 
        NewI = (I + Delta) rem NumRows,
        {
            append_elem(Mat, I, C),
            if
                (NewI == 0) or (NewI == NumRows - 1) -> Delta * (-1);
                true -> Delta 
            end,
            NewI
        }
    end,
    {Mat, _, _} = lists:foldl(P, {lists:duplicate(NumRows, []), 1, 0}, Sl),
    list_to_binary(lists:flatten(Mat)).
