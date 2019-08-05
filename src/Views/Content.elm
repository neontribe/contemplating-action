-- Views/Content.elm


module Views.Content exposing (view)

import Assets exposing (AssetPath(..), path)
import CallToAction exposing (CallToAction, CallToActionType(..), callToActionConstructor, callToActionNoDesktopButton)
import Copy.Keys exposing (Key(..))
import Copy.RenderCopy exposing (toString)
import Html exposing (Html, a, article, button, div, h2, iframe, img, p, section, span, text, ul)
import Html.Attributes exposing (alt, class, height, href, src)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Info exposing (getInfo, getInfoBySlug, infoCard, infoPage)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route exposing (Page(..))
import StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)
import Views.Footer exposing (footerContent)
import Views.Pages.Privacy exposing (privacyContent)
import Views.Pages.Supporters exposing (supportersContent)



-- Helper: Call to action button markup


callToActionButton : CallToAction -> String -> List (Html Msg)
callToActionButton callToAction aClass =
    [ if callToActionNoDesktopButton callToAction.action then
        div [ class "desktop-only" ]
            [ div []
                [ span []
                    [ getIcon callToAction.icon (Just "button--icon")
                    , span [] [ text callToAction.promptLong ]
                    ]
                , span []
                    [ text callToAction.displayHref ]
                ]
            ]

      else
        text ""
    , a
        [ class
            (if callToActionNoDesktopButton callToAction.action then
                "mobile-only button button--full-width " ++ aClass

             else
                "button button--full-width " ++ aClass
            )
        , href
            (if callToActionNoDesktopButton callToAction.action then
                "tel:" ++ callToAction.href

             else
                callToAction.href
            )
        , onClick (ButtonPress "call-to-action" callToAction.category "button" True)
        ]
        [ getIcon callToAction.icon (Just "button--icon")
        , span [] [ text callToAction.promptLong ]
        ]
    ]


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
                        (List.concat
                            [ callToActionButton (callToActionConstructor Survey (t CallToActionDestination) (t CallToActionDestinationDisplay)) "button--default-width--desktop"
                            , [ a
                                    [ class "button button--full-width button--default-width--desktop"
                                    , href ("mailto:" ++ t ContactLinkDestination)
                                    , onClick (ButtonPress "contact" "email" "email-button" True)
                                    ]
                                    [ getIcon (t IconCallToAction) (Just "button--icon")
                                    , span [] [ text "Email us" ]
                                    ]
                              ]
                            ]
                        )
                    ]
                , div [ class "section section--highlight" ]
                    [ div [ class "inset" ]
                        [ div [ class "text-center text-small" ]
                            [ p []
                                [ text (t HomeP2) ]
                            ]
                        ]
                    ]
                , footerContent
                ]

        SupportersPage ->
            supportersContent model.language

        StoriesPage ->
            div [ class "section--vertical-fill-center" ]
                [ div [ class "section section--lighter section--vertical-fill-center" ]
                    [ h2 [] [ text (t StoriesTitleH2) ]
                    , storyTeaser model.language 1
                    , storyTeaser model.language 2
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
                    , card model.language id 1
                    , card model.language id 2
                    , card model.language id 3
                    , card model.language id 4
                    ]
                , div [ class "section section--story-end" ]
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
                    , div [] (callToActionButton (callToActionConstructor Survey (t CallToActionDestination) (t CallToActionDestinationDisplay)) "")
                    ]
                ]

        PrivacyPage ->
            privacyContent

        InfoToHelpPage ->
            div [ class "section section--info section--vertical-fill-center" ]
                [ h2 [] [ text (t InfoTitleH2) ]
                , ul [ class "info--list" ]
                    [ infoCard model.language (getInfo 1)
                    , infoCard model.language (getInfo 2)
                    , infoCard model.language (getInfo 3)
                    , infoCard model.language (getInfo 4)
                    , infoCard model.language (getInfo 5)
                    , infoCard model.language (getInfo 6)
                    ]
                ]

        InfoPage slug ->
            infoPage model.language (getInfoBySlug model.language slug)
