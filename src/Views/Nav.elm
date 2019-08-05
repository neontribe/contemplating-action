-- Views/Nav.elm


module Views.Nav exposing (view)

import CallToAction exposing (CallToAction, CallToActionType(..), callToActionConstructor)
import Copy.Keys exposing (Key(..))
import Copy.RenderCopy exposing (toString)
import Html exposing (Html, a, div, nav, span, text)
import Html.Attributes exposing (class, href, id, rel, target)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Messages exposing (Msg(..))
import Model exposing (Model)


view : Model -> Html Msg
view model =
    let
        t =
            toString
    in
    -- Contains Nav for phones - but text email and phone number for desktop and tablet.
    div [ class "nav-bar" ]
        [ div [ class "desktop-only" ]
            [ callToActionNavItemDesktop (callToActionConstructor Survey (t CallToActionDestination) (t CallToActionDestinationDisplay)) ]
        , nav []
            [ navItem (t IconStories) "#/stories" "find-out-more" "view-list" (t ContentLinkShort) (t ContentLinkMedium)
            , navItem (t IconContact) (t ContactLinkDestination) "contact" "email" (t ContactLinkShort) (t ContactLinkLong)
            , span [ class "nav-item mobile-only" ]
                [ callToActionNavItemMobile (callToActionConstructor Survey (t CallToActionDestination) (t CallToActionDestinationDisplay)) ]
            , span [ class "nav-item" ]
                [ a [ class "btn ", href "https://google.com", target "_blank", rel "noopener", onClick Exit ]
                    [ getIcon (t IconExit) (Just "nav-item-text nav-icon")
                    , span [ class " nav-item-text" ] [ text (t ExitSite) ]
                    ]
                ]
            ]
        ]


navItem : String -> String -> String -> String -> String -> String -> Html Msg
navItem icon link category action shortLinkText longLinkText =
    span [ class "nav-item" ]
        [ a [ href link, onClick (ButtonPress category action (action ++ "-nav") True) ]
            [ getIcon icon (Just "nav-item-text nav-icon")
            , span [ class "nav-item-text" ]
                [ span [ class "mobile-only" ] [ text shortLinkText ]

                -- Note: longLinkText not rendered for phone number in Haven instance
                , span [ class "desktop-only" ] [ text longLinkText ]
                ]
            ]
        ]


callToActionNavItemDesktop : CallToAction -> Html Msg
callToActionNavItemDesktop cta =
    case cta.action of
        Phone ->
            div [ class "nav-item--text-only" ]
                [ span [ class "nav-item-text" ] [ text cta.promptLong ]
                , span [ class "nav-item-text" ] [ text cta.displayHref ]
                ]

        Survey ->
            navItem cta.icon cta.href "call-to-action" cta.category cta.promptShort cta.promptLong


{-| Call to action can be a phone number or a survey link
If it's a phone we only render as a button on small screens
-}
callToActionNavItemMobile : CallToAction -> Html Msg
callToActionNavItemMobile cta =
    case cta.action of
        Phone ->
            navItem cta.icon ("tel:" ++ cta.href) "call-to-action" cta.category cta.promptShort cta.promptLong

        Survey ->
            navItem cta.icon cta.href "call-to-action" cta.category cta.promptShort cta.promptLong
