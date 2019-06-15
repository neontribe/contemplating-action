module Main exposing (main)

import Browser
import Browser.Events exposing (onClick, onKeyDown)
import Json.Decode as D
import Messages exposing (Msg(..))
import Model exposing (Model)
import Update
import View


main : Program () Model Msg
main =
    Browser.application
        { init = Model.init
        , view = View.view
        , update = Update.update
        , subscriptions = subscriptions
        , onUrlRequest = Messages.LinkClicked
        , onUrlChange = Messages.UrlChanged
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ onKeyDown (D.map KeyPress keyDecoder)
        , onClick (D.succeed MouseAction)
        ]


keyDecoder : D.Decoder String
keyDecoder =
    D.field "key" D.string
