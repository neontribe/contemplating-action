-- Views/Header.elm


module Views.Header exposing (view)

import Html exposing (Html, a, button, div, h1, header, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route exposing (Page(..))


view : Model -> Html Msg
view model =
    let
        t =
            translate model.language
    in
    case model.currentPage of
        Home ->
            header []
                [ div [ class "section section--header text-center" ]
                    [ h1 [] [ text (t AppTitle) ]
                    ]
                ]

        -- Any other page
        _ ->
            header []
                [ div [ class "section section--header text-center" ]
                    [ h1 [] [ a [ href "#" ] [ text (t AppTitle) ] ]
                    ]
                ]
