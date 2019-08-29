-- Views/Footer.elm


module Views.Footer exposing (footerContent)

import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml)
import Html exposing (Html, a, footer, li, text, ul)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))


footerContent : Html Msg
footerContent =
    let
        t =
            toHtml
    in
    footer [ class "section section--footer text-center text-small" ]
        [ ul []
            [ li [ class "footer--item" ]
                [ t FooterSupportersText
                , text " "
                , a [ class "link link--plain", href "#/supporters" ]
                    [ t FooterSupportersLink ]
                ]
            , li [ class "footer--item" ]
                [ t FooterPrivacyText
                , text " "
                , a [ class "link link--plain", href "#/privacy-policy" ]
                    [ t FooterPrivacyLink ]
                ]
            , li [ class "footer--item" ]
                [ text "© 2019 - "
                , t FooterCopyrightLink
                ]
            , li [ class "footer--item" ]
                [ t FooterRegisteredText ]
            ]
        ]
