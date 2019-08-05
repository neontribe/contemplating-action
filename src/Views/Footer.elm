-- Views/Footer.elm


module Views.Footer exposing (footerContent)

import Copy.Keys exposing (Key(..))
import Copy.RenderCopy exposing (toHtml)
import Html exposing (Html, a, div, footer, text)
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
        [ div [ class "footer--item" ]
            [ t FooterSupportersText
            , text " "
            , a [ class "link link--plain", href "#/supporters" ]
                [ t FooterSupportersLink ]
            ]
        , div [ class "footer--item" ]
            [ t FooterPrivacyText
            , text " "
            , a [ class "link link--plain", href "#/privacy-policy" ]
                [ t FooterPrivacyLink ]
            ]
        , div [ class "footer--item" ]
            [ text "© 2019 - "
            , a
                [ class "link link--plain"
                , href "http://www.neontribe.co.uk/"
                , onClick (ButtonPress "contact" "website" "neontribe-website-footer" True)
                ]
                [ t FooterCopyrightLink ]
            ]
        , div [ class "footer--item" ]
            [ t FooterRegisteredText ]
        ]
