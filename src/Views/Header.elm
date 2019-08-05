-- Views/Header.elm


module Views.Header exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.RenderCopy exposing (toHtml)
import Html exposing (Html, a, button, div, h1, header)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route exposing (Page(..))


view : Model -> Html Msg
view model =
    let
        t =
            toHtml
    in
    case model.currentPage of
        Home ->
            header []
                [ div [ class "section section--header text-center" ]
                    [ h1 [] [ t AppTitle ]
                    ]
                ]

        -- Any other page
        _ ->
            header []
                [ div [ class "section section--header text-center" ]
                    [ h1 [] [ a [ href "#" ] [ t AppTitle ] ]
                    ]
                ]
