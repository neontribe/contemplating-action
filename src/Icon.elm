module Icon exposing (getIcon)

import Html exposing (Html, span)
import Html.Attributes exposing (class)
import Html.Attributes.Aria exposing (ariaHidden)


{-
   Pass a string to get an icon. Optionally pass an additional class - useful for matching style
   or hover state of adjacent elements.
-}


getIcon : String -> Maybe String -> Html span
getIcon name className =
    case className of
        Just aClass ->
            span [ class ("icon-" ++ name ++ " " ++ aClass), ariaHidden True ] []

        Nothing ->
            span [ class ("icon-" ++ name), ariaHidden True ] []
