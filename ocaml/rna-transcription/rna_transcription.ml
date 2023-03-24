type dna = [`A | `C | `G | `T]
type rna = [`A | `C | `G | `U]

let to_rna dna =
  dna
  |> List.map (fun nucleotide ->
         match nucleotide with
         | `A -> `U
         | `C -> `G
         | `G -> `C
         | `T -> `A 
  )
