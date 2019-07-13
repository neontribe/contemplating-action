-- Views/Nav.elm


module Views.Nav exposing (view)

import Html exposing (Html, a, div, nav, span, text)
import Html.Attributes exposing (class, href, id, rel, target)
import Html.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (translate)
import Icon exposing (getIcon)
import Messages exposing (Msg(..))
import Model exposing (Model)


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
        -- Contains Nav for phones - but text email and phone number for desktop and tablet.
        div [ class "nav-bar" ]
            [ div [ class "desktop-only" ]
                [ div [ class "nav-item--text-only" ]
                    [ span [ class "nav-item-text" ] [ text (t CallToActionLong) ]
                    , span [ class "nav-item-text" ] [ text (t CallToActionDestinationDisplay) ]
                    ]
                ]
            , nav []
                [ navItem "" "stories" "#/stories" "story" "view-list" (t ContentLinkShort) (t ContentLinkMedium)
                , navItem "nav-button" "chat" (t ContactLinkDestination) "contact" "chat" (t ContactLinkShort) (t ContactLinkLong)
                , span [ class "nav-item mobile-only" ]
                    [ navItem "" "call" ("tel:" ++ t CallToActionDestination) "contact" "call" (t CallToActionShort) (t CallToActionLong) ]
                , span [ class "nav-item" ]
                    [ a [ class "btn ", href "https://google.com", target "_blank", rel "noopener", onClick (Exit) ]
                        [ getIcon "exit" (Just "nav-item-text nav-icon")
                        , span [ class " nav-item-text" ] [ text (t ExitSite) ]
                        ]
                    ]
                ]
            ]


navItem : String -> String -> String -> String -> String -> String -> String -> Html Msg
navItem itemId icon link category action shortLinkText longLinkText =
    span [ class "nav-item" ]
        [ a [ href link, id itemId, onClick (ButtonPress category action (action ++ "-nav") True) ]
            [ getIcon icon (Just "nav-item-text nav-icon")
            , span [ class "nav-item-text" ]
                [ span [ class "mobile-only" ] [ text shortLinkText ]

                -- Note: longLinkText not rendered for phone number in Haven instance
                , span [ class "desktop-only" ] [ text longLinkText ]
                ]
            ]
        ]
