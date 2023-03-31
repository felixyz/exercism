let raindrop n =
  match
    [(3, "Pling"); (5, "Plang"); (7, "Plong")]
    |> List.filter_map (fun (fact, sound) ->
           match n mod fact with 0 -> Some sound | _ -> None )
    |> String.concat ""
  with
  | "" ->
      Int.to_string n
  | sounds ->
      sounds
