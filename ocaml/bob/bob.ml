type sentence_analytics =
  {question: bool; utterance: bool; all_caps: bool; all_blanks: bool}

let response_for say =
  let init =
    {question= false; utterance= false; all_caps= true; all_blanks= true}
  and blanks = ['\n'; '\r'; '\t'; ' '] in
  say
  |> String.fold_left
       (fun a chr ->
         match chr with
         | '?' ->
             {a with question= true; all_blanks= false}
         | 'A' .. 'Z' ->
             {a with utterance= true; question= false; all_blanks= false}
         | 'a' .. 'z' ->
             { question= false
             ; utterance= true
             ; all_blanks= false
             ; all_caps= false }
         | c when List.mem c blanks ->
             a
         | _ ->
             {a with question= false; all_blanks= false} )
       init
  |> function
  | {all_blanks= true; _} ->
      "Fine. Be that way!"
  | {utterance= true; all_caps= true; question= true; _} ->
      "Calm down, I know what I'm doing!"
  | {utterance= true; all_caps= true; question= false; _} ->
      "Whoa, chill out!"
  | {question= true; _} ->
      "Sure."
  | _ ->
      "Whatever."
