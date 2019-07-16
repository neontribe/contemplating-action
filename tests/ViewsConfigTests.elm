module ViewsConfigTests exposing (all)

import Expect
import Test exposing (Test, describe, test, todo)
import Views.Config exposing (appTitle, helpline, helplineDisplay)


all : Test
all =
    describe "Testing Config.elm returns the correct values"
        [ describe "Constants"
            [ test "App title" <|
                \() ->
                    appTitle |> Expect.equal "Pics, stories & info"
            , test "Helpline phone number" <|
                \() ->
                    helpline |> Expect.equal "0000000000"
            , test "Helpline phone number display" <|
                \() ->
                    helplineDisplay |> Expect.equal ("0000" ++ "\u{00A0}" ++ "000" ++ "\u{00A0}" ++ "000")
            ]
        ]
