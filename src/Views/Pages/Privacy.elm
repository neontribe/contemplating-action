-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Copy.Keys exposing (Key(..))
import Copy.RenderCopy exposing (toHtml)
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
            , t PrivacyCompanyInfoList
            , h3 [] [ t PrivacyDataCollectH3 ]
            , p [] [ t PrivacyDataCollectP ]
            , t PrivacyDataCollectList
            , h3 [] [ t PrivacyInfoUsedH3 ]
            , p [] [ t PrivacyInfoUsedP ]
            , t PrivacyInfoUsedList
            , h3 [] [ t PrivacyInfoSharedH3 ]
            , p [] [ t PrivacyInfoSharedP1 ]
            , p [] [ t PrivacyInfoSharedP2 ]
            , t PrivacyInfoSharedList
            , h3 [] [ t PrivacyInfoStoredH3 ]
            , t PrivacyInfoStoredList
            , h3 [] [ t PrivacyRightsH3 ]
            , p [] [ t PrivacyRightsP ]
            , h3 [] [ t PrivacyCookiesH3 ]
            , p [] [ t PrivacyCookiesP1 ]
            , p [] [ t PrivacyCookiesP2 ]
            , t PrivacyCookiesList
            , h3 [] [ t PrivacyTermsH3 ]
            , p [] [ t PrivacyTermsP ]
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent
        ]
