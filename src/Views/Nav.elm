-- Views/Nav.elm


module Views.Nav exposing (view)

import CallToAction exposing (CallToActionType(..))
import Html exposing (Html, a, div, nav, span, text)
import Html.Attributes exposing (class, href, rel, target)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Views.Config exposing (callToAction, email)


view : Model -> Html Msg
view _ =
    -- Contains Nav for phones - but text email and phone number for desktop and tablet.
    div [ class "nav-bar" ]
        [ div [ class "desktop-only" ]
            [ callToActionNavItem callToAction.action ]
        , nav []
            [ navItem "question-circle-o" "#/stories" "find-out-more" "view-list" "Find Out More" "Find Out More"
            , navItem "envelope" ("mailto:" ++ email) "contact" "email" "Email" email
            , span [ class "nav-item mobile-only" ]
                [ callToActionNavItem callToAction.action
                , navItem "phone" ("tel:" ++ callToAction.href) "contact" "call" "Call" callToAction.promptShort
                ]
            , span [ class "nav-item" ]
                [ a [ class "btn ", href "https://google.com", target "_blank", rel "noopener", onClick (Exit True) ]
                    [ getIcon "exit-door" (Just "nav-item-text nav-icon")
                    , span [ class " nav-item-text nav-text-selector" ] [ text "Exit Site" ]
                    ]
                ]
            ]
        ]


{-| Call to action can be a phone number or a survey link
If it's a phone we only render as a button on small screens
-}
callToActionNavItem : CallToActionType -> Html Msg
callToActionNavItem action =
    case action of
        Phone ->
            div [ class "desktop-only" ]
                [ div [ class "nav-item--text-only" ]
                    [ span [ class "nav-item-text" ] [ text callToAction.promptLong ]
                    , span [ class "nav-item-text" ] [ text callToAction.displayHref ]
                    ]
                ]

        Survey ->
            div [] [ text "survey" ]


navItem : String -> String -> String -> String -> String -> String -> Html Msg
navItem icon link category action shortLinkText longLinkText =
    span [ class "nav-item" ]
        [ a [ href link, onClick (ButtonPress category action (action ++ "-nav") True) ]
            [ getIcon icon (Just "nav-item-text nav-icon")
            , span [ class "nav-item-text" ]
                [ span [ class "mobile-only" ] [ text shortLinkText ]
                , span [ class "desktop-only nav-text-selector" ] [ text longLinkText ]
                ]
            ]
        ]
