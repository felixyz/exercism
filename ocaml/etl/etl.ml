let transform old =
  old
  |> List.fold_left
       (fun a (points, letters) ->
         List.rev_map (fun chr -> (Char.lowercase_ascii chr, points)) letters
         |> List.rev_append a )
       []
  |> List.sort (fun (c1, _) (c2, _) -> Char.compare c1 c2)
