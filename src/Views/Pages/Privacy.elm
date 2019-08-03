-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Copy.Keys exposing (Key(..))
import Copy.ToHtml exposing (renderCopy)
import Html exposing (Html, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


privacyContent : Html Msg
privacyContent =
    let
        t =
            renderCopy
    in
    div [ class "section section--lighter" ]
        [ h2 [] (t PrivacyTitleH2)
        , div []
            [ p [] (t PrivacyIntroP)
            , ul [ class "company-info" ]
                (t PrivacyCompanyInfoList)
            , h3 [] (t PrivacyDataCollectH3)
            , p [] (t PrivacyDataCollectP)
            , ul [ class "ul--disc" ]
                (t PrivacyDataCollectList)
            , h3 [] (t PrivacyInfoUsedH3)
            , p [] (t PrivacyInfoUsedP)
            , ul [ class "ul--disc" ]
                (t PrivacyInfoUsedList)
            , h3 [] (t PrivacyInfoSharedH3)
            , p [] (t PrivacyInfoSharedP1)
            , p [] (t PrivacyInfoSharedP2)
            , ul [ class "ul--disc" ]
                (t PrivacyInfoSharedList)
            , h3 [] (t PrivacyInfoStoredH3)
            , ul [ class "ul--disc" ]
                (t PrivacyInfoStoredList)
            , h3 [] (t PrivacyRightsH3)
            , p [] (t PrivacyRightsP)
            , h3 [] (t PrivacyCookiesH3)
            , p [] (t PrivacyCookiesP1)
            , p [] (t PrivacyCookiesP2)
            , ul [ class "ul--disc" ]
                (t PrivacyCookiesList)
            , h3 [] (t PrivacyTermsH3)
            , p [] (t PrivacyTermsP)
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent
        ]
