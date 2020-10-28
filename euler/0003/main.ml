let rec pow a = function
    | 0 -> 1
    | 1 -> a
    | n -> let b = pow a (n / 2) in
            b * b * (if n mod 2 = 0 then 1 else a)

let rec gcd a b =
    if b = 0 then a else gcd b (a mod b)

let factors n =
    let rec acc f n c = 
        if c > n then f else
        if List.exists (fun a -> c mod a == 0) f then acc f n (c + 1) else
        if n mod c == 0 then acc (c :: f) (n / c) (2) else acc f n (c + 1)
    in acc [] n 2

let largest n : int option =
    let g x = (pow x 2) + 1 mod n in
    let rec acc x y = 
        let x = g x in
        let y = g y |> g in
        let d = gcd (x - y |> abs) n in
        if d == 1 then acc x y else
        if d == n then None else Some d
    in acc 2 2

let () = factors 600851475143 |> List.hd |> Printf.printf "%d\n"