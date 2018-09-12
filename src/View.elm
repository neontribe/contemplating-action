module View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Html.Attributes.Aria exposing (role)
import Messages exposing (Msg)
import Model exposing (Model, pageSlug)
import Views.Content
import Views.Header
import Views.Nav


view : Model -> Html Msg
view model =
    div [ class ("page " ++ pageSlug model.currentPage) ]
        [ Views.Header.view model
        , Views.Nav.view model
        , div [ class "content", role "main" ]
            [ Views.Content.view model ]
        ]
