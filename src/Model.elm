module Model exposing (Model, init, pageSlug)

import Browser.Navigation as Navigation
import Messages exposing (Msg(..), delay, pageTimeoutSecs)
import Route exposing (Page(..), pageFromUrl, pageToString)
import Slug
import Url


type alias Model =
    { currentPage : Page
    , idlePage : Page
    , idleTimerCount : Int
    , navKey : Navigation.Key
    , url : Url.Url
    , doExit : Bool
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
    ( Model maybePage Home 0 navKey url False, delay pageTimeoutSecs (IdleTimeout maybePage -1) )


pageSlug : Page -> String
pageSlug page =
    case Slug.generate (pageToString page) of
        Just slug ->
            Slug.toString slug

        Nothing ->
            ""
