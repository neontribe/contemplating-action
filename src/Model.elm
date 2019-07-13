module Model exposing (Model, init, pageSlug)

import Browser.Navigation as Navigation
import I18n.Translate exposing (Language(..))
import Messages exposing (Msg(..))
import Route exposing (Page(..), pageFromUrl, pageToString)
import Slug
import Url


type alias Model =
    { currentPage : Page
    , idlePage : Page
    , language : Language
    , navKey : Navigation.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Navigation.Key -> ( Model, Cmd Msg )
init _ url navKey =
    let
        maybePage =
            case pageFromUrl url of
                Nothing ->
                    -- 404 to home
                    Home

                Just aPage ->
                    aPage
    in
        ( Model maybePage Home English navKey url, Cmd.none )


pageSlug : Page -> String
pageSlug page =
    case Slug.generate (pageToString page) of
        Just slug ->
            Slug.toString slug

        Nothing ->
            ""
