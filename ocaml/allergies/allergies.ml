type allergen =
  | Eggs
  | Peanuts
  | Shellfish
  | Strawberries
  | Tomatoes
  | Chocolate
  | Pollen
  | Cats

let allergen_to_int = function
  | Eggs ->
      0b00000001
  | Peanuts ->
      0b00000010
  | Shellfish ->
      0b00000100
  | Strawberries ->
      0b00001000
  | Tomatoes ->
      0b00010000
  | Chocolate ->
      0b00100000
  | Pollen ->
      0b01000000
  | Cats ->
      0b10000000

let allergic_to score allergen =
  score land allergen_to_int allergen != 0

let allergies score =
  [Eggs; Peanuts; Shellfish; Strawberries; Tomatoes; Chocolate; Pollen; Cats]
  |> List.filter (fun a -> allergic_to score a)
