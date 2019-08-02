-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Html exposing (Html, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (class)
import I18n.Keys exposing (ListKey(..), StringKey(..))
import I18n.Translate exposing (getString, renderList, translate)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


privacyContent : Html Msg
privacyContent =
    let
        t =
            getString
    in
    div [ class "section section--lighter" ]
        [ h2 [] [ text (t PrivacyTitleH2) ]
        , div []
            [ p []
                [ text (t PrivacyIntroP)
                ]
            , ul [ class "company-info" ]
                (renderList PrivacyCompanyInfoList)
            , h3 [] [ text (t PrivacyDataCollectH3) ]
            , p []
                [ text (t PrivacyDataCollectP)
                ]
            , ul [ class "ul--disc" ]
                (renderList PrivacyDataCollectList)
            , h3 [] [ text (t PrivacyInfoUsedH3) ]
            , p []
                [ text (t PrivacyInfoUsedP) ]
            , ul [ class "ul--disc" ]
                (renderList PrivacyInfoUsedList)
            , h3 [] [ text (t PrivacyInfoSharedH3) ]
            , p []
                [ text (t PrivacyInfoSharedP1) ]
            , p []
                [ text (t PrivacyInfoSharedP2) ]
            , ul [ class "ul--disc" ]
                (renderList PrivacyInfoSharedList)
            , h3 [] [ text (t PrivacyInfoStoredH3) ]
            , ul [ class "ul--disc" ]
                (renderList PrivacyInfoStoredList)
            , h3 [] [ text (t PrivacyRightsH3) ]
            , p [] [ text (t PrivacyRightsP) ]
            , h3 [] [ text (t PrivacyCookiesH3) ]
            , p []
                [ text (t PrivacyCookiesP1) ]
            , p []
                [ text (t PrivacyCookiesP2) ]
            , ul [ class "ul--disc" ]
                (renderList PrivacyCookiesList)
            , h3 [] [ text (t PrivacyTermsH3) ]
            , p []
                [ text (t PrivacyTermsP) ]
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent
        ]
