-- Views/Pages/Supporters.elm


module Views.Pages.Supporters exposing (supportersContent)

import Assets exposing (AssetPath(..), path)
import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml, toString)
import Html exposing (Html, div, h2, img, p)
import Html.Attributes exposing (alt, class, src)
import Messages exposing (Msg(..))


supportersContent : Html Msg
supportersContent =
    let
        t =
            toHtml
    in
    div [ class "section" ]
        [ div []
            [ h2 [] [ t SupportersTitleH2 ]
            , p [] [ t SupportersP1 ]
            , p [] [ t SupportersP2 ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo supporter--logo-landscape", src (path (AssetPath "supporters_logos/Castlogo.png")), alt "Cast Logo" ] []
                ]
            , p [] [ t SupportersP3 ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo", src (path (AssetPath "supporters_logos/comicrelief.svg")), alt (toString ComicReliefLogoAlt) ] []
                , img [ class "supporter--logo", src (path (AssetPath "supporters_logos/DCMSlogo.svg")), alt (toString DepartmentForCultureLogoAlt) ] []
                , img [ class "supporter--logo", src (path (AssetPath "supporters_logos/biglottery.svg")), alt (toString BigLotteryLogoAlt) ] []
                ]
            , p [] [ t SupportersP4 ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo", src (path (AssetPath "supporters_logos/neontribelogo.svg")), alt (toString NeontribeLogoAlt) ] []
                , img [ class "supporter--logo", src (path (AssetPath "supporters_logos/havenlogo.svg")), alt (toString HavenLogoAlt) ] []
                ]
            , p []
                [ t SupportersP5 ]
            ]
        ]
