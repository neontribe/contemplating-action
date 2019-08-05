module StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)

import Array
import Assets exposing (AssetPath(..), path)
import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml, toString)
import Html exposing (Html, a, blockquote, div, h3, img, p, text)
import Html.Attributes exposing (alt, class, href, src)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Info exposing (getInfo)
import List
import Messages exposing (Msg(..))


type alias Deck =
    { id : Int
    , title : Key
    , teaser : Key
    , teaserImgPath : AssetPath
    , teaserImgAltText : Key
    , relatedInfo : List Int
    , cards : List Card
    }


type alias Card =
    { imagePath : AssetPath
    , messageText : Maybe Key
    , quoteText : Key
    , altText : Key
    }



-- Accessors for Story Deck content


storyTitle : Int -> Key
storyTitle deckId =
    (getDeck deckId decks).title


storyTeaserImgPath : Int -> String
storyTeaserImgPath deckId =
    path (getDeck deckId decks).teaserImgPath


storyTeaserImgAltText : Int -> Key
storyTeaserImgAltText deckId =
    (getDeck deckId decks).teaserImgAltText


storyTeaser : Int -> Html Msg
storyTeaser deckId =
    let
        t =
            toString
    in
    div [ class "card" ]
        [ a
            [ href ("#/stories/" ++ String.fromInt deckId)
            , onClick (ButtonPress "story" "view-single" (t (storyTitle deckId)) False)
            ]
            [ img [ class "card--thumbnail", src (storyTeaserImgPath deckId), alt (t (storyTeaserImgAltText deckId)) ] []
            ]
        , a
            [ class "link--unstyled"
            , href ("#/stories/" ++ String.fromInt deckId)
            , onClick (ButtonPress "story" "view-single" (t (storyTitle deckId)) False)
            ]
            [ h3 [ class "title--small" ] [ text (t (storyTitle deckId)) ]
            ]
        , blockquote [ class "card--quote" ]
            [ text (t (getDeck deckId decks).teaser) ]
        , div [ class "text-right text-with-icon--right stories--more-link" ]
            [ a
                [ class "link"
                , href ("#/stories/" ++ String.fromInt deckId)
                , onClick (ButtonPress "story" "view-single" (t (storyTitle deckId)) False)
                ]
                [ text (t (StoriesTeaserMoreLink (t (storyTitle deckId))))
                ]
            , a
                [ class "link--unstyled"
                , href ("#/stories/" ++ String.fromInt deckId)
                , onClick (ButtonPress "story" "view-single" (t (storyTitle deckId)) False)
                ]
                [ getIcon "arrow-right" (Just "icon--alternate")
                ]
            ]
        ]


storyRelatedInfo : Int -> List (Html Msg)
storyRelatedInfo deckId =
    List.map getInfoButtons (getRelatedInfoIds deckId)


getInfoButtons : Int -> Html Msg
getInfoButtons id =
    let
        t =
            toString
    in
    a
        [ href ("#/info-to-help/" ++ t (getInfo id).slug)
        , class "button button--alternate button--full-width"
        , onClick (ButtonPress "information" "view-single" (t (getInfo id).slug) True)
        ]
        [ text (t (getInfo id).name) ]


card : Int -> Int -> Html msg
card deckId cardId =
    let
        t =
            toString
    in
    div [ class "card story" ]
        [ h3 [ class "title--small title--alternate" ]
            [ text (t (StoryCardH3 cardId)) ]
        , blockquote [ class "card--quote quote" ]
            [ text (t (getCard deckId cardId).quoteText) ]
        , div [ class "story--illustration" ]
            [ img [ src (cardImgPath deckId cardId), alt (t (getCard deckId cardId).altText) ]
                []
            , cardMessage deckId cardId
            ]
        ]


cardMessage : Int -> Int -> Html msg
cardMessage deckId cardId =
    let
        maybeMessage =
            (getCard deckId cardId).messageText
    in
    case maybeMessage of
        -- Easiest to return an empty p here. Class in case we need to style.
        Nothing ->
            p [ class "no-message" ] []

        Just aMessage ->
            blockquote [ class "story--message quote" ] [ toHtml aMessage ]


cardImgPath : Int -> Int -> String
cardImgPath deckId cardId =
    path (getCard deckId cardId).imagePath


getCard : Int -> Int -> Card
getCard deckId cardId =
    let
        -- foundCard = Array.get (cardId - 1) (Array.fromList (getDeck deckId decks).cards)
        -- Piped version of ^^ in case it's easier to follow.
        foundCard =
            getDeck deckId decks
                |> .cards
                |> Array.fromList
                |> Array.get (cardId - 1)
    in
    case foundCard of
        Just aCard ->
            aCard

        Nothing ->
            placeholderCard


getDeck : Int -> List Deck -> Deck
getDeck deckId deckList =
    let
        foundDeck =
            List.head (List.filter (\i -> i.id == deckId) deckList)
    in
    case foundDeck of
        Just deck ->
            deck

        Nothing ->
            placeholderDeck


getRelatedInfoIds : Int -> List Int
getRelatedInfoIds deckId =
    List.map (\n -> n) (getDeck deckId decks).relatedInfo



-- Story Deck records


placeholderDeck : Deck
placeholderDeck =
    { id = 0
    , title = StoryNotFoundTitle
    , teaser = StoryNotFoundTeaser
    , teaserImgPath = AssetPath "story_images/thumb_placeholder.png"
    , teaserImgAltText = StoryNotFoundImageAlt
    , relatedInfo = [ 1 ]
    , cards = [ placeholderCard ]
    }


placeholderCard : Card
placeholderCard =
    { quoteText = StoryNotFoundQuote
    , imagePath = AssetPath "story_images/slide1.svg"
    , altText = StoryNotFoundImageAlt
    , messageText = Just StoryNotFoundMessage
    }



-- Elm multi-line Strings add a space anywhere there's a carriage return without one


decks : List Deck
decks =
    [ { id = 1
      , title = StoryOneTitle
      , teaser = StoryOneTeaser
      , teaserImgPath = AssetPath "story_images/ourproject-image1.jpg"
      , teaserImgAltText = StoryOneTeaserImageAlt
      , relatedInfo = [ 3, 6 ]
      , cards =
            [ { quoteText = StoryOne1Quote
              , imagePath = AssetPath "story_images/ourproject-image1.jpg"
              , altText = StoryOne1ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryOne2Quote
              , imagePath = AssetPath "story_images/ourproject-image2.jpg"
              , altText = StoryOne2ImageAlt
              , messageText = Just StoryOne2Message
              }
            , { quoteText = StoryOne3Quote
              , imagePath = AssetPath "story_images/ourproject-image3.jpg"
              , altText = StoryOne3ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryOne4Quote
              , imagePath = AssetPath "story_images/ourproject-image4.jpg"
              , altText = StoryOne4ImageAlt
              , messageText = Just StoryOne4Message
              }
            ]
      }
    , { id = 2
      , title = StoryTwoTitle
      , teaser = StoryTwoTeaser
      , teaserImgPath = AssetPath "story_images/ama_1.jpg"
      , teaserImgAltText = StoryTwoTeaserImageAlt
      , relatedInfo = [ 2, 5 ]
      , cards =
            [ { quoteText = StoryTwo1Quote
              , imagePath = AssetPath "story_images/ama_1.jpg"
              , altText = StoryTwo1ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryTwo2Quote
              , imagePath = AssetPath "story_images/ama_2.jpg"
              , altText = StoryTwo2ImageAlt
              , messageText = Just StoryTwo2Message
              }
            , { quoteText = StoryTwo3Quote
              , imagePath = AssetPath "story_images/ama_3.jpg"
              , altText = StoryTwo3ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryTwo4Quote
              , imagePath = AssetPath "story_images/ama_4.jpg"
              , altText = StoryTwo4ImageAlt
              , messageText = Nothing
              }
            ]
      }
    ]
