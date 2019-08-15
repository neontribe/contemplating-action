-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml)
import Html exposing (Html, address, div, h2, h3, p, text)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))


privacyContent : Html Msg
privacyContent =
    let
        t =
            toHtml
    in
    div [ class "section" ]
        [ h2 [] [ t PrivacyTitleH2 ]
        , div []
            [ p [] [ t PrivacyIntroP ]
            , if t PrivacyCompanyAddress /= text "" then
                address [ class "company-info" ] [ t PrivacyCompanyAddress ]

              else
                text ""
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
            , p [] [ t PrivacySectionFourP1 ]
            , t PrivacySectionFourList
            , p [] [ t PrivacySectionFourP2 ]
            , h3 [] [ t PrivacySectionFiveH3 ]
            , p [] [ t PrivacySectionFiveP ]
            , t PrivacySectionFiveList
            , h3 [] [ t PrivacySectionSixH3 ]
            , p [] [ t PrivacySectionSixP1 ]
            , p [] [ t PrivacySectionSixP2 ]
            , p [] [ t PrivacySectionSixP3 ]
            , p [] [ t PrivacySectionSixP4 ]
            , t PrivacySectionSixList
            , h3 [] [ t PrivacySectionSevenH3 ]
            , p [] [ t PrivacySectionSevenP ]
            , t PrivacySectionSevenList
            ]
        ]
