-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml)
import Html exposing (Html, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


privacyContent : Html Msg
privacyContent =
    let
        t =
            toHtml
    in
    div [ class "section section--lighter" ]
        [ h2 [] [ t PrivacyTitleH2 ]
        , div []
            [ p [] [ t PrivacyIntroP ]
            , t PrivacyCompanyAddress
            , h3 [] [ t PrivacySectionOneH3 ]
            , p [] [ t PrivacySectionOneP ]
            , t PrivacySectionOneList
            , h3 [] [ t PrivacySectionTwoH3 ]
            , p [] [ t PrivacySectionTwoP ]
            , t PrivacySectionTwoList
            , h3 [] [ t PrivacySectionThreeH3 ]
            , p [] [ t PrivacySectionThreeP1 ]
            , p [] [ t PrivacySectionThreeP2 ]
            , t PrivacySectionThreeList
            , h3 [] [ t PrivacySectionFourH3 ]
            , p [] [ t PrivacySectionFourP ]
            , t PrivacySectionFourList
            , h3 [] [ t PrivacySectionFiveH3 ]
            , p [] [ t PrivacySectionFiveP ]
            , t PrivacySectionFiveList
            , h3 [] [ t PrivacySectionSixH3 ]
            , p [] [ t PrivacySectionSixP1 ]
            , p [] [ t PrivacySectionSixP2 ]
            , t PrivacySectionSixList
            , h3 [] [ t PrivacySectionSevenH3 ]
            , p [] [ t PrivacySectionSevenP ]
            , t PrivacySectionSevenList
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent
        ]
