open Base

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
  match
    Result.all [check_nucleotides (String.to_list s); check_nucleotides [c]]
  with
  | Error bad ->
      Error bad
  | _ ->
      Ok
        (String.fold s ~init:0 ~f:(fun acc c2 ->
             if Char.equal c c2 then acc + 1 else acc ) )

let count_nucleotides s =
  String.fold_result s ~init:empty ~f:(fun acc chr ->
      Result.map (count_nucleotide s chr) ~f:(fun count ->
          Map.set acc ~key:chr ~data:count ) )
