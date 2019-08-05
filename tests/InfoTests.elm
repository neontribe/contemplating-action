module InfoTests exposing (all)

import Expect
import I18n.Keys exposing (StringKey(..))
import Info exposing (getInfo)
import Test exposing (Test, describe, test, todo)


all : Test
all =
    describe "Testing Info.elm returns the correct name, icon and page slug"
        [ describe "Info name"
            [ test "Index of 1" <|
                \() ->
                    (getInfo 1).name |> Expect.equal InfoOneName
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).name |> Expect.equal InfoTwoName
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).name |> Expect.equal InfoThreeName
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).name |> Expect.equal InfoFourName
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).name |> Expect.equal InfoFiveName
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).name |> Expect.equal InfoNotFoundName
            ]
        , describe "Info slug"
            [ test "Index of 1" <|
                \() ->
                    (getInfo 1).slug |> Expect.equal InfoOneSlug
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).slug |> Expect.equal InfoTwoSlug
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).slug |> Expect.equal InfoThreeSlug
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).slug |> Expect.equal InfoFourSlug
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).slug |> Expect.equal InfoFiveSlug
            , test "Index of 0" <|
                \() ->
                    (getInfo 0).slug |> Expect.equal InfoNotFoundSlug
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).slug |> Expect.equal InfoNotFoundSlug
            ]
        , describe "Info icon"
            [ test "Index of 1" <|
                \() ->
                    (getInfo 1).icon |> Expect.equal InfoOneIcon
            , test "Index of 2" <|
                \() ->
                    (getInfo 2).icon |> Expect.equal InfoTwoIcon
            , test "Index of 3" <|
                \() ->
                    (getInfo 3).icon |> Expect.equal InfoThreeIcon
            , test "Index of 4" <|
                \() ->
                    (getInfo 4).icon |> Expect.equal InfoFourIcon
            , test "Index of 5" <|
                \() ->
                    (getInfo 5).icon |> Expect.equal InfoFiveIcon
            , test "Index of 0" <|
                \() ->
                    (getInfo 0).icon |> Expect.equal InfoNotFoundIcon
            , test "Index of 500" <|
                \() ->
                    (getInfo 500).icon |> Expect.equal InfoNotFoundIcon
            ]
        ]
