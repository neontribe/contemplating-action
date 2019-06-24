-- Views/Header.elm


module Views.Header exposing (view)

import Html exposing (Html, a, h1, header, text)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg)
import Model exposing (Model)
import Route exposing (Page(..))
import Views.Config exposing (appTitle)


view : Model -> Html Msg
view model =
    case model.currentPage of
        Home ->
            header [ class "section section--header text-center" ]
                [ h1 [] [ text appTitle ] ]

        -- Any other page
        _ ->
            header [ class "section section--header text-center" ]
                [ h1 [] [ a [ href "#" ] [ text appTitle ] ] ]
