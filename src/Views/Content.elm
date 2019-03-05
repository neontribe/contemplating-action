-- Views/Content.elm


module Views.Content exposing (view)

import Assets exposing (AssetPath(..), path)
import Html exposing (Html, a, article, button, div, h2, img, p, section, span, text, ul)
import Html.Attributes exposing (alt, class, href, src)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Info exposing (getInfo, getInfoBySlug, infoCard, infoPage)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route exposing (Page(..))
import StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)
import Views.Config exposing (email, helpline, helplineDisplay)
import Views.Footer exposing (footerContent)
import Views.Pages.Privacy exposing (privacyContent)
import Views.Pages.Supporters exposing (supportersContent)


view : Model -> Html Msg
view model =
    case model.currentPage of
        Home ->
            div [ class "section--vertical-fill-center" ]
                [ section [ class "section section--highlight section--align-bottom" ]
                    [ h2 []
                        [ text "Read some stories and find out more information" ]
                    , div [ class "button-group button-group--row" ]
                        [ a [ class "button button--alternate button--center button--default-width--desktop", href "#/stories" ]
                            [ getIcon "stories" (Just "button--icon")
                            , span [] [ text "Show me the stories" ]
                            ]
                        ]
                    , img [ class "block", src (path (AssetPath "banner.png")), alt "A description of banner image." ] []
                    ]
                , section [ class "section section--vertical-fill-center section--lighter" ]
                    [ h2 [] [ text "Call to action here." ]
                    , p []
                        [ text """Short description of services.
                        """
                        ]
                    , div [ class "button-group" ]
                        [ div [ class "desktop-only" ]
                            [ div []
                                [ span []
                                    [ getIcon "phone" (Just "button--icon")
                                    , span [] [ text "Call Us" ]
                                    ]
                                , span [] [ text helplineDisplay ]
                                ]
                            ]
                        , a
                            [ class "mobile-only button button--full-width button--default-width--desktop"
                            , href ("tel:" ++ helpline)
                            , onClick (ButtonPress "contact" "call" "call-button" True)
                            ]
                            [ getIcon "call" (Just "button--icon")
                            , span [] [ text "Call Us" ]
                            ]
                        , a
                            [ class "button button--full-width button--default-width--desktop"
                            , href ("mailto:" ++ email)
                            , onClick (ButtonPress "contact" "email" "email-button" True)
                            ]
                            [ getIcon "email" (Just "button--icon")
                            , span [] [ text "Email Us" ]
                            ]
                        ]
                    ]
                , div [ class "section section--highlight" ]
                    [ div [ class "inset" ]
                        [ div [ class "text-center text-small" ]
                            [ p []
                                [ text "A bit more information. The small print." ]
                            ]
                        ]
                    ]
                , footerContent
                ]

        Timeout ->
            div [ class "section" ]
                [ h2 [] [ text "This app will close in 15 seconds. Do you want to keep reading?" ]
                , div []
                    [ button [ onClick GoBack, class "button button--default-width--desktop" ] [ text "Keep reading" ]
                    , p [ class "text-small" ] [ text "So that no-one else can see you have been using this app, it closes automatically when it thinks you have stopped reading." ]
                    ]
                ]

        SupportersPage ->
            supportersContent

        StoriesPage ->
            div [ class "section--vertical-fill-center" ]
                [ div [ class "section section--darker section--vertical-fill-center" ]
                    [ h2 [] [ text "Stories" ]
                    , storyTeaser 1
                    , storyTeaser 2
                    ]
                , div [ class "section section--highlight" ]
                    [ div [ class "text-center" ]
                        [ a
                            [ class "button button--alternate button--full-width button--default-width--desktop"
                            , href "#/info-to-help"
                            , onClick (ButtonPress "information" "view-list" "more-info" True)
                            ]
                            [ text "I'd like some more information" ]
                        ]
                    ]
                ]

        StoryPage id ->
            article [ class "section--vertical-fill-center" ]
                [ div [ class "section section--darker section--vertical-fill-center" ]
                    [ h2 []
                        [ text (storyTitle id) ]
                    , card id 1
                    , card id 2
                    , card id 3
                    , card id 4
                    ]
                , div [ class "section section--highlight section--story-end" ]
                    [ p [ class "story--related" ] [ text "Every story is different. Let us help you discover yours." ]
                    , div [ class "button-group story--related" ] (storyRelatedInfo id)
                    , div [ class "button-group story--related" ]
                        [ a
                            [ href "#/info-to-help/"
                            , class "button button--alternate button--full-width"
                            , onClick (ButtonPress "information" "view-list" "more-info" True)
                            ]
                            [ text "I'd like some other information" ]
                        ]
                    , div [ class "desktop-only" ]
                        [ div [ class "text-center" ]
                            [ span []
                                [ getIcon "call" (Just "button--icon")
                                , span [] [ text "Call Us" ]
                                ]
                            , span [] [ text helplineDisplay ]
                            ]
                        ]
                    , a
                        [ class "mobile-only button button--alternate button--full-width"
                        , href ("tel:" ++ helpline)
                        , onClick (ButtonPress "contact" "call" "call-button" True)
                        ]
                        [ getIcon "call" (Just "button--icon")
                        , span [] [ text "Call Us" ]
                        ]
                    ]
                ]

        PrivacyPage ->
            privacyContent

        InfoToHelpPage ->
            div [ class "section section--info section--vertical-fill-center" ]
                [ h2 [] [ text "Information to help you" ]
                , ul [ class "info--list" ]
                    [ infoCard (getInfo 1)
                    , infoCard (getInfo 2)
                    , infoCard (getInfo 3)
                    , infoCard (getInfo 4)
                    , infoCard (getInfo 5)
                    , infoCard (getInfo 6)
                    ]
                ]

        InfoPage slug ->
            infoPage (getInfoBySlug slug)
