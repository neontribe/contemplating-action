port module Messages exposing (Msg(..), delay, gaEvent, hidePage, pageTimeoutSecs, updateAnalyticsEvent, updateAnalyticsPage)

import Browser
import Process
import Route exposing (Page)
import Task exposing (perform)
import Url


type
    Msg
    -- Action
    = ButtonPress String String String Bool
    | KeyPress String
    | MouseAction
      -- Navigation
    | UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
      -- Timeout
    | DoTimeout
    | Exit Bool
    | GoBack
    | IdleTimeout Page Int



-- js ports can only take one arg - so bundle event strings


type alias GaEvent =
    { category : String
    , action : String
    , label : String
    }


pageTimeoutSecs : Float
pageTimeoutSecs =
    3600


delay : Float -> msg -> Cmd msg
delay secs msg =
    Process.sleep (1000 * secs)
        |> Task.perform (\_ -> msg)


gaEvent : String -> String -> String -> GaEvent
gaEvent category action label =
    { category = category
    , action = action
    , label = label
    }


port updateAnalyticsPage : String -> Cmd msg


port updateAnalyticsEvent : GaEvent -> Cmd msg


port hidePage : Maybe String -> Cmd msg
