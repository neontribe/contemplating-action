module StoryDeckTests exposing (all)

import Copy.Keys exposing (Key(..))
import Expect
import StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)
import Test exposing (Test, describe, test, todo)


all : Test
all =
    describe "Story Deck Tests"
        [ describe "Getting Story Title"
            [ test "Index of 1" <|
                \() ->
                    storyTitle 1 |> Expect.equal StoryOneTitle
            , test "Index of 2" <|
                \() ->
                    storyTitle 2 |> Expect.equal StoryTwoTitle
            , test "Index of 3" <|
                \() ->
                    storyTitle 3 |> Expect.equal StoryThreeTitle
            , test "Index of 4" <|
                \() ->
                    storyTitle 4 |> Expect.equal StoryFourTitle
            , test "Index of 5" <|
                \() ->
                    storyTitle 5 |> Expect.equal StoryNotFoundTitle
            , test "Index of 0" <|
                \() ->
                    storyTitle 0 |> Expect.equal StoryNotFoundTitle
            , test "Index of 500" <|
                \() ->
                    storyTitle 500 |> Expect.equal StoryNotFoundTitle
            ]
        ]
