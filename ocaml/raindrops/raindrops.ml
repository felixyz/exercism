let sound n factor word = if n mod factor = 0 then word else ""

let raindrop n =
  let sounds =
    [(3, "Pling"); (5, "Plang"); (7, "Plong")]
    |> List.map (fun (factor, word) -> sound n factor word)
    |> List.fold_left ( ^ ) ""
  in
  if String.length sounds > 0 then sounds else Int.to_string n
