-- Views/Content.elm


module Views.Content exposing (view)

import Assets exposing (AssetPath(..), path)
import Copy.Keys exposing (CallToActionType(..), Key(..))
import Copy.Render exposing (toHtmlWithContext, toString)
import Html exposing (Html, a, article, div, h2, img, p, section, span, text, ul)
import Html.Attributes exposing (alt, class, href, src)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Info exposing (getInfo, getInfoBySlug, infoListItem, infoPage)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route exposing (Page(..))
import StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)
import Views.Pages.Privacy exposing (privacyContent)
import Views.Pages.Supporters exposing (supportersContent)


view : Model -> Html Msg
view model =
    let
        t =
            toString
    in
    case model.currentPage of
        Home ->
            div [ class "section--vertical-fill-center" ]
                [ section [ class "section section--lighter section--align-bottom" ]
                    [ h2 []
                        [ text (t HomeReadAboutH2) ]
                    , div [ class "button-group button-group--row" ]
                        [ a [ class "button button--alternate button--center button--default-width--desktop", href "#/stories" ]
                            [ getIcon (t IconStories) (Just "button--icon")
                            , span [] [ text (t ContentLinkLong) ]
                            ]
                        ]
                    , img [ class "block", src (path (AssetPath "banner.png")), alt (t HomeBannerImageAlt) ] []
                    ]
                , section [ class "section section--vertical-fill-center" ]
                    [ h2 [] [ text (t HomeTalkToSomeoneH2) ]
                    , p []
                        [ text (t HomeP1) ]
                    , p [] [ a [ class "link link--plain", href (t HomeLinkDestination) ] [ text (t HomeLinkDisplay) ] ]
                    , div [ class "button-group" ]
                        [ toHtmlWithContext CallToActionOne (Just "button--default-width--desktop")
                        , a
                            [ class "button button--full-width button--default-width--desktop"
                            , href ("mailto:" ++ t ContactLinkDestination)
                            , onClick (ButtonPress "contact" "email" "email-button" True)
                            ]
                            [ getIcon "envelope" (Just "button--icon")
                            , span [] [ text "Email us" ]
                            ]
                        ]
                    ]
                , div [ class "section section--highlight" ]
                    [ div [ class "inset" ]
                        [ div [ class "text-center text-small" ]
                            [ p []
                                [ text (t HomeP2) ]
                            ]
                        ]
                    ]
                ]

        SupportersPage ->
            supportersContent

        StoriesPage ->
            div [ class "section--vertical-fill-center" ]
                [ div [ class "section section--lighter section--vertical-fill-center" ]
                    [ h2 [] [ text (t StoriesTitleH2) ]
                    , storyTeaser 1
                    , storyTeaser 2
                    , storyTeaser 3
                    ]
                , div [ class "section section--lighter" ]
                    [ div [ class "text-center" ]
                        [ a
                            [ class "button button--alternate button--full-width button--default-width--desktop"
                            , href "#/info-to-help"
                            , onClick (ButtonPress "information" "view-list" "more-info" True)
                            ]
                            [ text (t InfoLikeMoreInfoLink) ]
                        ]
                    ]
                ]

        StoryPage id ->
            article [ class "section--vertical-fill-center" ]
                [ div [ class "section section--lighter section--vertical-fill-center" ]
                    [ h2 []
                        [ text (t (storyTitle id)) ]
                    , card id 1
                    , card id 2
                    , card id 3
                    , card id 4
                    ]
                , div [ class "section section--story-end" ]
                    [ p [ class "story--related" ] [ text (t StoryCardStartJourneyPrompt) ]
                    , div [ class "button-group story--related" ] (storyRelatedInfo id)
                    , div [ class "button-group story--related" ]
                        [ a
                            [ href "#/info-to-help/"
                            , class "button button--alternate button--full-width"
                            , onClick (ButtonPress "information" "view-list" "more-info" True)
                            ]
                            [ text (t InfoLikeOtherInfoLink) ]
                        ]
                    , div [] [ toHtmlWithContext CallToActionOne (Just "button") ]
                    ]
                ]

        PrivacyPage ->
            privacyContent

        InfoToHelpPage ->
            div [ class "section section--info section--vertical-fill-center" ]
                [ h2 [] [ text (t InfoTitleH2) ]
                , ul [ class "info--list" ]
                    [ infoListItem (getInfo 1)
                    , infoListItem (getInfo 2)
                    , infoListItem (getInfo 3)
                    , infoListItem (getInfo 4)
                    , infoListItem (getInfo 5)
                    , infoListItem (getInfo 6)
                    ]
                ]

        InfoPage slug ->
            infoPage (getInfoBySlug slug)
