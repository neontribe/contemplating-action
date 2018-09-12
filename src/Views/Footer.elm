-- Views/Footer.elm


module Views.Footer exposing (footerContent)

import Html exposing (Html, a, div, footer, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))


footerContent : Html Msg
footerContent =
    footer [ class "section section--footer text-center text-small" ]
        [ div [ class "footer--item" ]
            [ text "Find out about our "
            , a [ class "link link--plain", href "#/supporters" ]
                [ text "supporters" ]
            ]
        , div [ class "footer--item" ]
            [ text "Read our "
            , a [ class "link link--plain", href "#/privacy-policy" ]
                [ text "privacy policy" ]
            ]
        , div [ class "footer--item" ]
            [ text "© 2017 - "
            , a
                [ class "link link--plain"
                , href "http://www.neontribe.co.uk/"
                , onClick (ButtonPress "contact" "website" "neontribe-website-footer" True)
                ]
                [ text "neontribe.co.uk" ]
            ]
        ]
