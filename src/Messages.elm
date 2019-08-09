port module Messages exposing (Msg(..), gaEvent, hidePage, updateAnalyticsEvent, updateAnalyticsPage)

import Browser
import Url


type
    Msg
    -- Action
    = ButtonPress String String String Bool
      -- Navigation
    | UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | Exit
    | Consent Int



-- js ports can only take one arg - so bundle event strings


type alias GaEvent =
    { category : String
    , action : String
    , label : String
    }


gaEvent : String -> String -> String -> GaEvent
gaEvent category action label =
    { category = category
    , action = action
    , label = label
    }


port updateAnalyticsPage : String -> Cmd msg


port updateAnalyticsEvent : GaEvent -> Cmd msg


port hidePage : Maybe String -> Cmd msg
