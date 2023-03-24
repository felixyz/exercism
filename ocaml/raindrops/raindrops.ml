let raindrop n =
  let sounds =
    [ (3, "Pling"); (5, "Plang"); (7, "Plong") ]
    |> List.filter (fun (fact, _) -> n mod fact = 0)
    |> List.map snd
    |> List.fold_left ( ^ ) ""
  in
  if String.length sounds > 0 then sounds else Int.to_string n
