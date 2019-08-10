-- Views/Cookies.elm


module Views.Cookies exposing (cookieContent)

import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml)
import Html exposing (Html, a, button, div, footer, p, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Model exposing (Model)


cookieContent : Model -> Html Msg
cookieContent model =
    let
        t =
            toHtml
    in
    case model.consent of
        0 ->
            div [ class "section section--highlight" ]
                [ p [] [ text "Can we use first and third party cookies to help us understand our audience?" ]
                , button [ class "button", onClick (Consent 1) ] [ text "Yes please" ]
                , button [ class "button", onClick (Consent 2) ] [ text "No thanks" ]
                ]

        _ ->
            text ""
