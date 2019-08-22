module CallToAction exposing (callToActionButton, callToActionNavItem)

-- Potential to move all of this into Copy.Render

import Copy.Keys exposing (CallToActionRecord, CallToActionType(..))
import Html exposing (Html, a, div, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Messages exposing (Msg(..))


callToActionButton : CallToActionRecord -> String -> Html Msg
callToActionButton callToAction aClass =
    if callToActionNoDesktopButton callToAction.action then
        div [ class "cta-text" ]
            [ span []
                [ getIcon callToAction.icon (Just "button--icon")
                , span [] [ text callToAction.promptLong ]
                ]
            , span []
                [ text callToAction.displayHref ]
            ]

    else
        a
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


callToActionNoDesktopButton : CallToActionType -> Bool
callToActionNoDesktopButton actionType =
    if actionType == DesktopDisplayOnly then
        True

    else
        False


callToActionNavItem : CallToActionRecord -> Html Msg
callToActionNavItem cta =
    case cta.action of
        DesktopDisplayOnly ->
            div [ class "nav-item" ]
                [ a [ href cta.href, onClick (ButtonPress "call-to-action" cta.category (cta.category ++ "-nav") True), class "mobile-only" ]
                    [ getIcon cta.icon (Just "nav-item-text nav-icon")
                    , span [ class "nav-item-text" ]
                        [ span [ class "mobile-only" ] [ text cta.promptShort ]
                        ]
                    ]
                , div [ class "nav-item--text-only desktop-only" ]
                    [ span [ class "nav-item-text" ] [ text cta.promptLong ]
                    , span [ class "nav-item-text" ] [ text cta.displayHref ]
                    ]
                ]

        DesktopInteractive ->
            div [ class "nav-item" ]
                [ a [ href cta.href, onClick (ButtonPress "call-to-action" cta.category (cta.category ++ "-nav") True) ]
                    [ getIcon cta.icon (Just "nav-item-text nav-icon")
                    , span [ class "nav-item-text" ]
                        [ span [ class "mobile-only" ] [ text cta.promptShort ]

                        -- Note: cta.promptLong not rendered for phone number in Haven instance
                        , span [ class "desktop-only" ] [ text cta.promptLong ]
                        ]
                    ]
                ]
