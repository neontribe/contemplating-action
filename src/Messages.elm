port module Messages exposing (Msg(..), delay, gaEvent, hidePage, pageTimeoutSecs, updateAnalyticsEvent, updateAnalyticsPage)

import Keyboard
import Mouse
import Process
import Route exposing (Page)
import Task
import Time


type
    Msg
    -- Action
    = ButtonPress String String String Bool
    | KeyPress Keyboard.KeyCode
    | MouseAction Mouse.Position
      -- Navigation
    | NewUrl String
    | UrlChange (Maybe Page)
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
    Process.sleep (Time.second * secs)
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
