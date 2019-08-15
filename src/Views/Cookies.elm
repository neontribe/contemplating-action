-- Views/Cookies.elm


module Views.Cookies exposing (cookieContent)

import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toString)
import Html exposing (Html, button, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Model exposing (Model)


cookieContent : Model -> Html Msg
cookieContent model =
    let
        t =
            toString
    in
    case model.consent of
        0 ->
            div [ class "section section--highlight section--cookie" ]
                [ p [] [ text (t CookieDescription) ]
                , div [ class "button-group--cookie" ]
                    [ button [ class "button button--cookie", onClick (Consent 1) ] [ text (t CookieAccept) ]
                    , button [ class "button button--cookie", onClick (Consent 2) ] [ text (t CookieDecline) ]
                    ]
                ]

        _ ->
            text ""
