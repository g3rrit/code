

let string_rev str =
    let rec aux idx = match idx with
        | 0 -> Char.escaped (str.[0])
        | _ -> (Char.escaped str.[idx]) ^ (aux (idx-1)) in
    aux ((String.length str)-1)

let is_palindrom (a : string) : bool = 
    let b = string_rev a in
    if String.compare a b == 0 then true else false

let find_palindrom = 
    let rec aux (a, b) n = 
        if n > 999 then 0 else 
        if is_palindrom (string_of_int ((999 - a) * (999 - b))) then (999 - a) * (999 - b) else
        if a >= n then aux (0,n + 1)  (n + 1) else aux (a + 1, b - 1) n in
    aux (0, 0) 0

let () = find_palindrom |> Printf.printf "%d\n"