
let (--) i j = 
    let rec acc a b l = 
        if (b - a) > 0
        then a :: l |> acc (a + 1) b
        else l
    in acc i j []


let () = 
    List.filter (fun a -> a mod 5 == 0 ||  a mod 3 == 0) (1 -- 1000)
    |> List.fold_left (+) 0 |> Printf.printf "%d"
