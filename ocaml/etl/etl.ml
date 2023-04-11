let transform old =
  old
  |> List.fold_left
       (fun a (points, letters) ->
         a @ List.map (fun chr -> (Char.lowercase_ascii chr, points)) letters )
       []
  |> List.sort (fun (c1, _) (c2, _) -> Char.compare c1 c2)
