module ConsistentHashing.Replicas exposing
    ( Replicas
    , default
    , new
    , toInt
    , toSuffixedList
    )

import ConsistentHashing.Node as Node


type Replicas
    = Replicas Int


new : Int -> Replicas
new =
    Replicas


default : Replicas
default =
    Replicas 100


toInt : Replicas -> Int
toInt (Replicas value) =
    value


toSuffixedList : Node.Node -> Replicas -> List String
toSuffixedList node (Replicas value) =
    value
        |> List.range 0
        |> List.map String.fromInt
        |> List.map (\repNum -> String.concat [ Node.toString node, "_", repNum ])
