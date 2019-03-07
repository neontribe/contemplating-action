-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Html exposing (Html, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


privacyContent : Html Msg
privacyContent =
    div [ class "section" ]
        [ h2 [] [ text "Privacy Policy and Cookies" ]
        , div []
            [ p []
                [ text """
                    """
                ]
            , h3 [] [ text "What data do we collect?" ]
            , p []
                [ text """
                """
                ]
            , h3 [] [ text "How is the information used?" ]
            , p []
                [ text ""
                ]
            , ul [ class "ul--disc" ]
                [ li [] [ text "" ]
                , li [] [ text "" ]
                , li [] [ text "" ]
                ]
            , h3 [] [ text "Who is the information shared with?" ]
            , p []
                [ text """
                """
                ]
            , p []
                [ text """
                """
                ]
            , h3 [] [ text "Use of cookies" ]
            , p []
                [ text """
                """
                ]
            , h3 [] [ text "Your acceptance of these terms" ]
            , p []
                [ text """
                """
                ]
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent
        ]
