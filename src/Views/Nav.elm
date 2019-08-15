-- Views/Nav.elm


module Views.Nav exposing (navItem, view)

import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtmlWithContext, toString)
import Html exposing (Html, a, div, nav, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Messages exposing (Msg(..))


view : Html Msg
view =
    let
        t =
            toString
    in
    -- Contains Nav for phones - but text email and phone number for desktop and tablet.
    -- Not sure why the desktop and mobile menu items need to be in different orders.
    div [ class "nav-bar" ]
        [ nav []
            [ div [ class "desktop-only" ]
                [ toHtmlWithContext CallToActionOne (Just "desktop-nav") ]
            , navItem (t IconStories) "#/stories" "find-out-more" "view-list" (t ContentLinkShort) (t ContentLinkMedium)
            , div [ class "desktop-only" ]
                [ toHtmlWithContext CallToActionTwo (Just "desktop-nav") ]
            , span [ class "nav-item mobile-only" ]
                [ toHtmlWithContext CallToActionOne (Just "mobile-nav")
                , toHtmlWithContext CallToActionTwo (Just "mobile-nav")
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
