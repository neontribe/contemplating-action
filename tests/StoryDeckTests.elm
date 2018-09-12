module StoryDeckTests exposing (..)

import Test exposing (Test, describe, test, todo)
import Expect
import StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)


all : Test
all =
    describe "Story Deck Tests"
        [ describe "Getting Story Title"
            [ test "Index of 1" <|
                \() ->
                    storyTitle 1 |> Expect.equal "A story about rivers"
            , test "Index of 2" <|
                \() ->
                    storyTitle 2 |> Expect.equal "A story about trees"
            , test "Index of 3" <|
                \() ->
                    storyTitle 3 |> Expect.equal "A story about rocks"
            , test "Index of 4" <|
                \() ->
                    storyTitle 4 |> Expect.equal "Coming soon"
            , test "Index of 0" <|
                \() ->
                    storyTitle 0 |> Expect.equal "Coming soon"
            , test "Index of 500" <|
                \() ->
                    storyTitle 500 |> Expect.equal "Coming soon"
            ]
        , describe "Getting Story Teaser"
            [ todo "get a teaser"
            ]
        , describe "Getting Story Related Info"
            [ todo "get related info list"
            ]
        , describe "Getting a Card"
            [ todo "get a card"
            ]
        ]
