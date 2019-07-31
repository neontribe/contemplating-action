module ViewsConfigTests exposing (all)

import Expect
import Test exposing (Test, describe, test, todo)
import Views.Config exposing (appTitle, email)


all : Test
all =
    describe "Testing Config.elm returns the correct values"
        [ describe "Constants"
            [ test "App title" <|
                \() ->
                    appTitle |> Expect.equal "Contemplating Action"
            , test "Email" <|
                \() ->
                    email |> Expect.equal "hello@contemplatingaction.org.uk"
            ]
        ]
