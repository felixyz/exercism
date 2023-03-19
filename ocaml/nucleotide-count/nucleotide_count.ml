open Base
open Result

let empty = Map.empty (module Char)

let has_char (lst : char list) (c : char) : bool =
  List.exists lst ~f:(fun elt -> Char.equal c elt)

let check_nucleotides (chars : char list) : (unit, char) Result.t =
  let ok = ['A'; 'C'; 'G'; 'T'] in
  match List.find chars ~f:(fun c -> not (has_char ok c)) with
  | Some c ->
      Error c
  | _ ->
      Ok ()

let count_nucleotide s c =
  check_nucleotides (String.to_list s)
  >>= fun () ->
  check_nucleotides [c]
  >>= fun () ->
  Ok (String.count s ~f:(Char.equal c))

let count_nucleotides s =
  String.fold_result s ~init:empty ~f:(fun acc chr ->
      Result.map (count_nucleotide s chr) ~f:(fun count ->
          Map.set acc ~key:chr ~data:count ) )
