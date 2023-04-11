let is_pangram str =
  let set b = ( lor ) (1 lsl b) in
  str
  |> String.fold_left
       (fun a chr ->
         match chr with
         | 'A' .. 'Z' ->
             set (Char.code chr - 65) a
         | 'a' .. 'z' ->
             set (Char.code chr - 97) a
         | _ ->
             a )
       0
  |> ( = ) 0b11111111111111111111111111
