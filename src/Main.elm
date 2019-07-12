module Main exposing (main)

import Browser
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
    Sub.none
