let is_pangram str =
  let set bit = ( lor ) (1 lsl bit)
  and all_found = ( = ) 0b11111111111111111111111111 in
  let rec aux bits seq =
    if all_found bits then true
    else
      match Seq.uncons seq with
      | None ->
          false
      | Some (chr, tl) -> (
        match chr with
        | 'A' .. 'Z' ->
            aux (set (Char.code chr - 65) bits) tl
        | 'a' .. 'z' ->
            aux (set (Char.code chr - 97) bits) tl
        | _ ->
            aux bits tl )
  in
  String.to_seq str |> aux 0
