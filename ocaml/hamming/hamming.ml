type nucleotide = A | C | G | T

let rec
  hamming_distance ns1 ns2 =
    let l1 = List.length ns1
    and l2 = List.length ns2 in

    match (l1, l2) with
    | (x, y) when x = y -> List.fold_left2 (fun a n1 n2 -> check_pair a n1 n2) 0 ns1 ns2 |> Result.ok
    | (0, _) -> Error("left strand must not be empty")
    | (_, 0) -> Error("right strand must not be empty")
    | _ -> Error("left and right strands must be of equal length")
    
and 
  check_pair (acc : int)  (n1 : nucleotide) (n2 : nucleotide) : int =
    match (n1 = n2) with
    | true -> acc
    | false -> acc + 1

