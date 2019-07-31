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
                    (getInfo 1).name |> Expect.equal "About the project"
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).name |> Expect.equal "Bite size information"
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).name |> Expect.equal "Visual Storytelling"
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).name |> Expect.equal "What is the survey?"
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).name |> Expect.equal "Can my organisation try this?"
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).name |> Expect.equal "Not found"
            ]
        , describe "Info slug"
            [ test "Index of 1" <|
                \() ->
                    (getInfo 1).slug |> Expect.equal "about"
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).slug |> Expect.equal "bite-size-info"
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).slug |> Expect.equal "visual-storytelling"
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).slug |> Expect.equal "survey"
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).slug |> Expect.equal "try-this"
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
                    (getInfo 1).icon |> Expect.equal "question-circle-o"
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).icon |> Expect.equal "info-circle"
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).icon |> Expect.equal "pencil"
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).icon |> Expect.equal "check-square-o"
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).icon |> Expect.equal "group"
            , test "Index of 0" <|
                \() ->
                    (getInfo 0).icon |> Expect.equal "question"
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).icon |> Expect.equal "question"
            ]
        ]
