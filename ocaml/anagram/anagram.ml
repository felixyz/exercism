open Base

let anagrams target candidates =
  let normalize str = str |> String.to_list |> List.sort ~compare:Char.compare in
  let tl = String.lowercase target in
  let tn = normalize tl in
  candidates
  |> List.filter ~f:(fun cand ->
         let cl = String.lowercase cand in
         let cn = normalize cl in
         (not Poly.(equal tl cl)) && Poly.(equal tn cn) )
