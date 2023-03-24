let first_n n = List.init (n + 1) Fun.id

let sum = List.fold_left ( + ) 0

let square n = n * n

let square_of_sum n = first_n n |> sum |> square

let sum_of_squares n = List.map square (first_n n) |> sum

let difference_of_squares n = square_of_sum n - sum_of_squares n
