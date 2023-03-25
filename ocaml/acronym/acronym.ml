let is_letter = function 'A' .. 'Z' | 'a' .. 'z' -> true | _ -> false

let is_spacy = function ' ' | '-' -> true | _ -> false

let acronym txt =
  let pick_initial (possible, acc) chr =
    match possible && is_letter chr with
    | true ->
        (false, acc ^ Char.escaped chr)
    | false ->
        (possible || is_spacy chr, acc)
  in
  txt |> String.uppercase_ascii
  |> String.fold_left pick_initial (true, "")
  |> snd

(* open Str

   let acronym txt =
     let dash = Str.regexp "-"
     and other = Str.regexp {|[^A-Za-z ]|}
     and wspc = Str.regexp {|[ ]+|}
     in
     txt |> Str.global_replace dash " "
     |> Str.global_replace other ""
     |> Str.split wspc
     |> List.fold_left (fun a s -> a ^ String.get s 0) ""
*)
