open Base

let anagrams target candidates =
  let normalize str =
    String.lowercase str |> String.to_list |> List.sort ~compare:Char.compare
  in
  let tl = String.lowercase target and tn = normalize target in
  candidates
  |> List.filter ~f:(fun cand -> String.lowercase cand |> Poly.(equal tl) |> not)
  |> List.filter ~f:(fun cand -> normalize cand |> Poly.(equal tn))
