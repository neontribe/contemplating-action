module Update exposing (update)

import Browser
import Browser.Navigation as Navigation
import Messages exposing (Msg(..), gaEvent, hidePage, updateAnalyticsEvent, updateAnalyticsPage)
import Model exposing (Model, pageSlug)
import Route exposing (Page(..), pageFromUrl)
import Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        --
        -- Action messages
        --
        ButtonPress category action label withPage ->
            if withPage then
                ( model
                , updateAnalyticsEvent (gaEvent category action (label ++ "_" ++ pageSlug model.currentPage))
                )

            else
                ( model
                , updateAnalyticsEvent (gaEvent category action label)
                )

        --
        -- Navigation messages
        --
        UrlChanged url ->
            let
                newPage =
                    pageFromUrl url
            in
            -- We use Home instead of 404.
            ( { model | url = url, currentPage = Maybe.withDefault Home newPage }
            , Cmd.none
            )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    -- pushUrl will add an entry to browser history.
                    -- use replaceUrl when we don't want a history entry.
                    let
                        page =
                            Maybe.withDefault Home (pageFromUrl url)
                    in
                    ( model
                    , Cmd.batch
                        -- pass a list of commands.
                        [ Navigation.pushUrl model.navKey (Url.toString url)
                        , updateAnalyticsPage (pageSlug page)
                        ]
                    )

                Browser.External href ->
                    ( model, Navigation.load href )

        Exit ->
            ( model
            , Cmd.batch
                -- Hide the page immediately with JavaScript
                [ hidePage Nothing
                , updateAnalyticsEvent (gaEvent "exit" "force" ("exit-button_" ++ pageSlug model.currentPage))

                -- Then redirect to Google
                , Navigation.load "https://google.com"
                ]
            )
