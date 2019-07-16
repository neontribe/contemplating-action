module InfoTests exposing (all)

import Expect
import Info exposing (getInfo)
import Test exposing (Test, describe, test, todo)


all : Test
all =
    describe "Testing Info.elm returns the correct name, icon and page slug"
        [ describe "Info name"
            [ test "Index of 1" <|
                \() ->
                    (getInfo 1).name |> Expect.equal "What happens if I call?"
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).name |> Expect.equal "What happens if I write?"
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).name |> Expect.equal "What happens if I find a special rock?"
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).name |> Expect.equal "What happens if I break a branch off the tree?"
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).name |> Expect.equal "Not found"
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).name |> Expect.equal "Not found"
            ]
        , describe "Info slug"
            [ test "Index of 1" <|
                \() ->
                    (getInfo 1).slug |> Expect.equal "call-someone"
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).slug |> Expect.equal "write-to-someone"
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).slug |> Expect.equal "show-someone"
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).slug |> Expect.equal "broken-limbs"
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).slug |> Expect.equal "not-found"
            , test "Index of 0" <|
                \() ->
                    (getInfo 0).slug |> Expect.equal "not-found"
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).slug |> Expect.equal "not-found"
            ]
        , describe "Info icon"
            [ test "Index of 1" <|
                \() ->
                    (getInfo 1).icon |> Expect.equal "call"
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).icon |> Expect.equal "call"
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).icon |> Expect.equal "call"
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).icon |> Expect.equal "call"
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).icon |> Expect.equal "question"
            , test "Index of 0" <|
                \() ->
                    (getInfo 0).icon |> Expect.equal "question"
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).icon |> Expect.equal "question"
            ]
        ]
