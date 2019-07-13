-- Views/Content.elm


module Views.Content exposing (view)

import Assets exposing (AssetPath(..), path)
import Html exposing (Html, a, article, button, div, h2, iframe, img, p, section, span, text, ul)
import Html.Attributes exposing (alt, class, height, href, src)
import Html.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Icon exposing (getIcon)
import Info exposing (getInfo, getInfoBySlug, infoCard, infoPage)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route exposing (Page(..))
import StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)
import Views.Footer exposing (footerContent)
import Views.Pages.Privacy exposing (privacyContent)
import Views.Pages.Supporters exposing (supportersContent)


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
        case model.currentPage of
            Home ->
                div [ class "section--vertical-fill-center" ]
                    [ section [ class "section section--highlight section--align-bottom" ]
                        [ h2 []
                            [ text (t HomeReadAboutH2) ]
                        , div [ class "button-group button-group--row" ]
                            [ a [ class "button button--alternate button--center button--default-width--desktop", href "#/stories" ]
                                [ getIcon "stories" (Just "button--icon")
                                , span [] [ text (t ContentLinkLong) ]
                                ]
                            ]
                        , img [ class "block", src (path (AssetPath "banner.png")), alt (t HomeBannerImageAlt) ] []
                        ]
                    , section [ class "section section--vertical-fill-center section--lighter" ]
                        [ h2 [] [ text (t HomeTalkToSomeoneH2) ]
                        , p []
                            [ text (t HomeP1) ]
                        , div [ class "button-group" ]
                            [ div [ class "desktop-only" ]
                                [ div []
                                    [ span []
                                        [ getIcon "phone" (Just "button--icon")
                                        , span [] [ text (t CallToActionLong ++ " ") ]
                                        ]
                                    , span [] [ text (t CallToActionDestinationDisplay) ]
                                    ]
                                ]
                            , a
                                [ class "mobile-only button button--full-width button--default-width--desktop"
                                , href ("tel:" ++ t CallToActionDestination)
                                , onClick (ButtonPress "contact" "call" "call-button" True)
                                ]
                                [ getIcon "call" (Just "button--icon")
                                , span [] [ text (t CallToActionLong) ]
                                ]
                            , a
                                [ class "button button--full-width button--default-width--desktop"
                                , href "#/chat"
                                , onClick (ButtonPress "contact" "chat" "chat-button" True)
                                ]
                                [ getIcon "chat" (Just "button--icon")
                                , span [] [ text (t ContactLinkLong) ]
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
                    , footerContent model.language
                    ]

            SupportersPage ->
                supportersContent model.language

            StoriesPage ->
                div [ class "section--vertical-fill-center" ]
                    [ div [ class "section section--darker section--vertical-fill-center" ]
                        [ h2 [] [ text (t StoriesTitleH2) ]
                        , storyTeaser model.language 7
                        , storyTeaser model.language 1
                        , storyTeaser model.language 2
                        , storyTeaser model.language 3
                        , storyTeaser model.language 4
                        , storyTeaser model.language 5
                        , storyTeaser model.language 6
                        ]
                    , div [ class "section section--highlight" ]
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
                    [ div [ class "section section--darker section--vertical-fill-center" ]
                        [ h2 []
                            [ text (t (storyTitle id)) ]
                        , card model.language id 1
                        , card model.language id 2
                        , card model.language id 3
                        , card model.language id 4
                        ]
                    , div [ class "section section--highlight section--story-end" ]
                        [ p [ class "story--related" ] [ text (t StoryCardStartJourneyPrompt) ]
                        , div [ class "button-group story--related" ] (storyRelatedInfo model.language id)
                        , div [ class "button-group story--related" ]
                            [ a
                                [ href "#/info-to-help/"
                                , class "button button--alternate button--full-width"
                                , onClick (ButtonPress "information" "view-list" "more-info" True)
                                ]
                                [ text (t InfoLikeOtherInfoLink) ]
                            ]
                        , div [ class "desktop-only" ]
                            [ div [ class "text-center" ]
                                [ span []
                                    [ getIcon "call" (Just "button--icon")
                                    , span [] [ text (t CallToActionLong ++ " ") ]
                                    ]
                                , span [] [ text (t CallToActionDestinationDisplay) ]
                                ]
                            ]
                        , a
                            [ class "mobile-only button button--alternate button--full-width"
                            , href ("tel:" ++ t CallToActionDestination)
                            , onClick (ButtonPress "contact" "call" "call-button" True)
                            ]
                            [ getIcon "call" (Just "button--icon")
                            , span [] [ text (t CallToActionLong) ]
                            ]
                        ]
                    ]

            PrivacyPage ->
                privacyContent model.language

            InfoToHelpPage ->
                div [ class "section section--info section--vertical-fill-center" ]
                    [ h2 [] [ text (t InfoTitleH2) ]
                    , ul [ class "info--list" ]
                        [ infoCard (getInfo model.language 1)
                        , infoCard (getInfo model.language 2)
                        , infoCard (getInfo model.language 3)
                        , infoCard (getInfo model.language 4)
                        , infoCard (getInfo model.language 5)
                        , infoCard (getInfo model.language 6)
                        ]
                    ]

            InfoPage slug ->
                infoPage model.language (getInfoBySlug model.language slug)
