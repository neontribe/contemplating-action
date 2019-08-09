module View exposing (view)

import Browser
import Html exposing (Html, div, main_, text)
import Html.Attributes exposing (class, id)
import Html.Attributes.Aria exposing (role)
import Messages exposing (Msg(..))
import Model exposing (Model, pageSlug)
import Route exposing (Page(..))
import Views.Content
import Views.Footer
import Views.Header
import Views.Nav


view : Model -> Browser.Document Msg
view model =
    { title = "Contemplating Action"
    , body =
        [ div [ id "page-wrapper", class ("page " ++ pageSlug model.currentPage) ]
            [ Views.Header.view model
            , Views.Nav.view model
            , main_ [ class "content", role "main" ]
                [ Views.Content.view model ]
            ]
        , renderFooter model.currentPage
        ]
    }


renderFooter : Page -> Html Msg
renderFooter page =
    case page of
        Home ->
            Views.Footer.footerContent

        SupportersPage ->
            Views.Footer.footerContent

        PrivacyPage ->
            Views.Footer.footerContent

        _ ->
            text " "
