let transform old =
  old
  |> List.concat_map (fun (points, letters) ->
         letters |> List.rev_map (fun chr -> (Char.lowercase_ascii chr, points)) )
  |> List.sort (fun (c1, _) (c2, _) -> Char.compare c1 c2)
