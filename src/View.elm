module View exposing (view)

import Browser
import Html exposing (div)
import Html.Attributes exposing (class, id)
import Html.Attributes.Aria exposing (role)
import Messages exposing (Msg)
import Model exposing (Model, pageSlug)
import Views.Content
import Views.Header
import Views.Nav


view : Model -> Browser.Document Msg
view model =
    { title = "Contemplating Action"
    , body =
        [ div [ id "page-wrapper", class ("page " ++ pageSlug model.currentPage) ]
            [ Views.Header.view model
            , Views.Nav.view model
            , div [ class "content", role "main" ]
                [ Views.Content.view model ]
            ]
        ]
    }
