module CallToAction exposing (callToActionButton)

import Copy.Keys exposing (CallToActionRecord, CallToActionType(..))
import Html exposing (Html, a, div, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Messages exposing (Msg(..))


callToActionButton : CallToActionRecord -> String -> List (Html Msg)
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


callToActionNoDesktopButton : CallToActionType -> Bool
callToActionNoDesktopButton actionType =
    if actionType == Phone then
        True

    else
        False
