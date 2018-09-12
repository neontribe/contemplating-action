module Main exposing (main)

import Messages exposing (Msg(UrlChange))
import Model exposing (Model)
import Navigation
import Route exposing (route)
import Subscriptions
import Update
import UrlParser exposing (parseHash)
import View


main : Program Never Model Msg
main =
    Navigation.program locChange
        { init = Model.init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }


locChange : Navigation.Location -> Msg
locChange location =
    parseHash route location
        |> UrlChange
