-- Views/Nav.elm


module Views.Nav exposing (view)

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
    nav [ class "nav-bar" ]
        [ toHtmlWithContext CallToActionOne (Just "nav")
        , toHtmlWithContext CallToActionTwo (Just "nav")
        , toHtmlWithContext CallToActionThree (Just "nav")
        ]
