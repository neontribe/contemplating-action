module Update exposing (update)

import Browser
import Browser.Navigation as Navigation
import Messages exposing (Msg(..), delay, gaEvent, hidePage, pageTimeoutSecs, updateAnalyticsEvent, updateAnalyticsPage)
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

        KeyPress _ ->
            ( { model | idleTimerCount = model.idleTimerCount + 1 }
            , delay pageTimeoutSecs (IdleTimeout model.currentPage model.idleTimerCount)
            )

        MouseAction ->
            ( { model | idleTimerCount = model.idleTimerCount + 1 }
            , delay pageTimeoutSecs (IdleTimeout model.currentPage model.idleTimerCount)
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
                    -- Increment the idle timer triggered count
                    -- so we can rely on latest timer active.
                    ( { model | idleTimerCount = model.idleTimerCount + 1 }
                    , Cmd.batch
                        -- pass a list of commands.
                        [ Navigation.pushUrl model.navKey (Url.toString url)
                        , updateAnalyticsPage (pageSlug page)

                        -- When the page changes, we need to kickoff a timer.
                        , delay pageTimeoutSecs (IdleTimeout page model.idleTimerCount)
                        ]
                    )

                Browser.External href ->
                    ( model, Navigation.load href )

        --
        -- Timeout messages
        --
        DoTimeout ->
            -- The most recent idle Timer hit the time limit - kick off the Exit process.
            ( { model | currentPage = Timeout, doExit = True }
            , Cmd.batch
                [ updateAnalyticsPage ("timeout-warning_" ++ pageSlug model.idlePage)
                , updateAnalyticsEvent (gaEvent "exit" "auto" ("warning_" ++ pageSlug model.idlePage))
                , delay 15 (Exit False)
                ]
            )

        Exit force ->
            if force then
                let
                    cmds =
                        if model.doExit then
                            [ updateAnalyticsEvent (gaEvent "exit" "auto" ("timed-out_" ++ pageSlug model.idlePage))
                            , Navigation.load "https://google.com"
                            ]

                        else
                            [ Cmd.none ]
                in
                ( model, Cmd.batch cmds )

            else
                ( model
                , Cmd.batch
                    -- Hide the page immediately with JavaScript
                    [ hidePage Nothing
                    , updateAnalyticsEvent (gaEvent "exit" "force" ("exit-button_" ++ pageSlug model.currentPage))

                    -- Then redirect to Google
                    , Navigation.load "https://google.com"
                    ]
                )

        GoBack ->
            -- We pressed go back to stop the timeout.
            -- Go back to the page we came from, stop exit, restart idle timer.
            ( { model | currentPage = model.idlePage, doExit = False, idleTimerCount = model.idleTimerCount + 1 }
            , Cmd.batch
                [ updateAnalyticsPage "go-back-triggered"
                , updateAnalyticsEvent (gaEvent "exit" "cancel" ("keep-reading_" ++ pageSlug model.idlePage))
                , delay pageTimeoutSecs (IdleTimeout model.idlePage model.idleTimerCount)
                ]
            )

        IdleTimeout page idleTimerCount ->
            ( { model | idlePage = page }
            , -- Only load the timeout screen if this is the most recent idle timer.
              if model.idleTimerCount == (idleTimerCount + 1) then
                delay 0 DoTimeout

              else
                Cmd.none
            )
