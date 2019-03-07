-- Views/Nav.elm


module Views.Nav exposing (view)

import Html exposing (Html, a, div, nav, span, text)
import Html.Attributes exposing (class, href, rel, target)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Views.Config exposing (email, helpline, helplineDisplay)


view : Model -> Html Msg
view _ =
    -- Contains Nav for phones - but text email and phone number for desktop and tablet.
    div [ class "nav-bar" ]
        [ div [ class "desktop-only" ]
            [ div [ class "nav-item--text-only" ]
                [ span [ class "nav-item-text" ] [ text "Call Us" ]
                , span [ class "nav-item-text" ] [ text helplineDisplay ]
                ]
            ]
        , nav []
            [ navItem "question-circle" "#/stories" "find-out-more" "view-list" "Find Out More" "Find Out More"
            , navItem "envelope" ("mailto:" ++ email) "contact" "email" "Email" email
            , span [ class "nav-item mobile-only" ]
                [ navItem "phone" ("tel:" ++ helpline) "contact" "call" "Call" helplineDisplay ]
            , span [ class "nav-item" ]
                [ a [ class "btn ", href "https://google.com", target "_blank", rel "noopener", onClick (Exit True) ]
                    [ getIcon "exit-door" (Just "nav-item-text nav-icon")
                    , span [ class " nav-item-text" ] [ text "Exit Site" ]
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
                , span [ class "desktop-only" ] [ text longLinkText ]
                ]
            ]
        ]
