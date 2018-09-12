module Subscriptions exposing (subscriptions)

import Messages exposing (Msg(..))
import Keyboard
import Model exposing (Model)
import Mouse


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Mouse.clicks MouseAction
        , Keyboard.downs KeyPress
        ]
