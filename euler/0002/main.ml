
let fib_f =
    let a = ref 0
    and b = ref 1
    in fun () -> let r = !a + !b in 
        a := !b
        ; b := r
        ; r

let fib =
    let rec acc =
        fib_f :: acc
    in (fun () -> 0) :: (fun () -> 1) :: acc

let () =
    let rec acc v (x :: xs) =
        let xx = x () 
        in if xx <= 4000000 
           then acc (v + (if xx mod 2 == 0 then xx else 0)) xs
           else v
    in acc 0 fib |> Printf.printf "%d"
    

