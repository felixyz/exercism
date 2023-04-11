open Base
module Int_map = Map.M (Int)

type school = string list Int_map.t

let empty_school = Map.empty (module Int)

let add name grade school = Map.add_multi school ~key:grade ~data:name

let grade grade school = Map.find_multi school grade

let sorted school = school |> Map.map ~f:(List.sort ~compare:String.compare)

let roster school = school |> sorted |> Map.data |> List.concat
