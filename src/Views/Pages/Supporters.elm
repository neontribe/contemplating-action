-- Views/Pages/Supporters.elm


module Views.Pages.Supporters exposing (supportersContent)

import Assets exposing (AssetPath(..), path)
import Html exposing (Html, div, h2, img, p, text)
import Html.Attributes exposing (alt, class, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language, translate)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


supportersContent : Language -> Html Msg
supportersContent language =
    let
        t =
            translate language
    in
    div [ class " section section--lighter" ]
        [ div []
            [ h2 [] [ text (t SupportersTitleH2) ]
            , p [] [ text (t SupportersP1) ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo", src (path (AssetPath "funded_by_comic_relief_logo.svg")), alt (t ComicReliefLogoAlt) ] []
                , img [ class "supporter--logo", src (path (AssetPath "DCMS_logo.svg")), alt (t DepartmentForCultureLogoAlt) ] []
                , img [ class "supporter--logo", src (path (AssetPath "big_lottery_fund_logo.svg")), alt (t BigLotteryLogoAlt) ] []
                ]
            , p []
                [ text (t SupportersP2) ]
            , p [] [ text (t SupportersP3) ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo", src (path (AssetPath "neontribe_logo.svg")), alt (t NeontribeLogoAlt) ] []
                , img [ class "supporter--logo", src (path (AssetPath "haven_logo.svg")), alt (t HavenLogoAlt) ] []
                ]
            , p []
                [ text (t SupportersP4) ]
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent language
        ]
