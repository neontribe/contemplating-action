-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Html exposing (Html, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (class)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


privacyContent : Language -> Html Msg
privacyContent language =
    let
        t =
            translate language
    in
    div [ class "section section--lighter" ]
        [ h2 [] [ text (t PrivacyTitleH2) ]
        , div []
            [ p []
                [ text (t PrivacyIntroP)
                ]
            , ul [ class "company-info" ]
                [ li [] [ text (t PrivacyCompanyInfoLi1) ]
                , li [] [ text (t PrivacyCompanyInfoLi2) ]
                , li [] [ text (t PrivacyCompanyInfoLi3) ]
                , li [] [ text (t PrivacyCompanyInfoLi4) ]
                ]
            , h3 [] [ text (t PrivacyDataCollectH3) ]
            , p []
                [ text (t PrivacyDataCollectP)
                ]
            , ul [ class "ul--disc" ]
                [ li [] [ text (t PrivacyDataCollectLi1) ]
                , li [] [ text (t PrivacyDataCollectLi2) ]
                , li [] [ text (t PrivacyDataCollectLi3) ]
                ]
            , h3 [] [ text (t PrivacyInfoUsedH3) ]
            , p []
                [ text (t PrivacyInfoUsedP) ]
            , ul [ class "ul--disc" ]
                [ li [] [ text (t PrivacyInfoUsedLi1) ]
                , li [] [ text (t PrivacyInfoUsedLi2) ]
                , li [] [ text (t PrivacyInfoUsedLi3) ]
                , li [] [ text (t PrivacyInfoUsedLi4) ]
                ]
            , h3 [] [ text (t PrivacyInfoSharedH3) ]
            , p []
                [ text (t PrivacyInfoSharedP1) ]
            , p []
                [ text (t PrivacyInfoSharedP2) ]
            , ul [ class "ul--disc" ]
                [ li [] [ text (t PrivacyInfoSharedLi1) ]
                , li [] [ text (t PrivacyInfoSharedLi2) ]
                , li [] [ text (t PrivacyInfoSharedLi3) ]
                ]
            , h3 [] [ text (t PrivacyInfoStoredH3) ]
            , ul [ class "ul--disc" ]
                [ li [] [ text (t PrivacyInfoStoredLi1) ]
                , li [] [ text (t PrivacyInfoStoredLi2) ]
                , li [] [ text (t PrivacyInfoStoredLi3) ]
                , li [] [ text (t PrivacyInfoStoredLi4) ]
                ]
            , h3 [] [ text (t PrivacyRightsH3) ]
            , p [] [ text (t PrivacyRightsP) ]
            , h3 [] [ text (t PrivacyCookiesH3) ]
            , p []
                [ text (t PrivacyCookiesP1) ]
            , p []
                [ text (t PrivacyCookiesP2) ]
            , ul [ class "ul--disc" ]
                [ li [] [ text (t PrivacyCookiesLi1) ]
                , li [] [ text (t PrivacyCookiesLi2) ]
                , li [] [ text (t PrivacyCookiesLi3) ]
                , li []
                    [ text (t PrivacyCookiesLi4) ]
                ]
            , h3 [] [ text (t PrivacyTermsH3) ]
            , p []
                [ text (t PrivacyTermsP) ]
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent language
        ]
