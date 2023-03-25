let is_letter chr =
  let c = Char.code chr in
  (c >= 65 && c <= 90) || (c >= 97 && c <= 122)

let is_spacy chr =
  let c = Char.code chr in
  c = 32 || c = 45

let acronym txt =
  let pick_initial (possible, acc) chr =
    match possible && is_letter chr with
    | true ->
        (false, acc ^ Char.escaped chr)
    | false ->
        (possible || is_spacy chr, acc)
  in
  String.fold_left pick_initial (true, "") txt |> snd |> String.uppercase_ascii

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
