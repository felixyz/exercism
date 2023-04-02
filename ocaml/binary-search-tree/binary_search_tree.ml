open Base

type bst = Leaf | Node of bst * int * bst

let empty = Leaf

let value = function Node (_, v, _) -> Ok v | Leaf -> Error "Empty"

let left = function Node (l, _, _) -> Ok l | Leaf -> Error "Empty"

let right = function Node (_, _, r) -> Ok r | Leaf -> Error "Empty"

let rec insert n = function
  | Leaf ->
      Node (Leaf, n, Leaf)
  | Node (l, v, r) when n <= v ->
      Node (insert n l, v, r)
  | Node (l, v, r) ->
      Node (l, v, insert n r)

let rec to_list = function
  | Leaf ->
      []
  | Node (l, v, r) ->
      to_list l @ [v] @ to_list r
