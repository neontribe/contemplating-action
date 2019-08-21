module StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)

import Array
import Assets exposing (AssetPath(..), path)
import Copy.BrandCopy exposing (relatedInfo)
import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml, toString)
import Html exposing (Html, a, blockquote, div, h3, img, p, span, text)
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
    , messageText : Key
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
    a
        [ class "card link--unstyled", href ("#/stories/" ++ String.fromInt deckId), onClick (ButtonPress "story" "view-single" (t (storyTitle deckId)) False) ]
        [ img [ class "card--thumbnail", src (storyTeaserImgPath deckId), alt (t (storyTeaserImgAltText deckId)) ] []
        , h3 [ class "title--small" ] [ text (t (storyTitle deckId)) ]
        , blockquote [ class "card--quote" ]
            [ text (t (getDeck deckId decks).teaser) ]
        , div [ class "text-right text-with-icon--right stories--more-link" ]
            [ span
                [ class "link" ]
                [ text (t (StoriesTeaserMoreLink (t (storyTitle deckId))))
                ]
            , span [] [ getIcon "arrow-right" (Just "icon--alternate") ]
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


card : Int -> Int -> Html Msg
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


cardMessage : Int -> Int -> Html Msg
cardMessage deckId cardId =
    let
        theMessage =
            (getCard deckId cardId).messageText
    in
    if toString theMessage == "" then
        -- Easiest to return an empty p here. Class in case we need to style.
        p [ class "no-message" ] []

    else
        blockquote [ class "story--message quote" ] [ toHtml theMessage ]


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
    , imagePath = AssetPath "story_images/placeholder.png"
    , altText = StoryNotFoundImageAlt
    , messageText = StoryNotFoundMessage
    }



-- Elm multi-line Strings add a space anywhere there's a carriage return without one


decks : List Deck
decks =
    [ { id = 1
      , title = StoryOneTitle
      , teaser = StoryOneTeaser
      , teaserImgPath = AssetPath "story_images/story1-thumbnail.jpg"
      , teaserImgAltText = StoryOneTeaserImageAlt
      , relatedInfo = relatedInfo 1
      , cards =
            [ { quoteText = StoryOne1Quote
              , imagePath = AssetPath "story_images/story1-image1.jpg"
              , altText = StoryOne1ImageAlt
              , messageText = StoryOne1Message
              }
            , { quoteText = StoryOne2Quote
              , imagePath = AssetPath "story_images/story1-image2.jpg"
              , altText = StoryOne2ImageAlt
              , messageText = StoryOne2Message
              }
            , { quoteText = StoryOne3Quote
              , imagePath = AssetPath "story_images/story1-image3.jpg"
              , altText = StoryOne3ImageAlt
              , messageText = StoryOne3Message
              }
            , { quoteText = StoryOne4Quote
              , imagePath = AssetPath "story_images/story1-image4.jpg"
              , altText = StoryOne4ImageAlt
              , messageText = StoryOne4Message
              }
            ]
      }
    , { id = 2
      , title = StoryTwoTitle
      , teaser = StoryTwoTeaser
      , teaserImgPath = AssetPath "story_images/story2-thumbnail.jpg"
      , teaserImgAltText = StoryTwoTeaserImageAlt
      , relatedInfo = relatedInfo 2
      , cards =
            [ { quoteText = StoryTwo1Quote
              , imagePath = AssetPath "story_images/story2-image1.jpg"
              , altText = StoryTwo1ImageAlt
              , messageText = StoryTwo1Message
              }
            , { quoteText = StoryTwo2Quote
              , imagePath = AssetPath "story_images/story2-image2.jpg"
              , altText = StoryTwo2ImageAlt
              , messageText = StoryTwo2Message
              }
            , { quoteText = StoryTwo3Quote
              , imagePath = AssetPath "story_images/story2-image3.jpg"
              , altText = StoryTwo3ImageAlt
              , messageText = StoryTwo3Message
              }
            , { quoteText = StoryTwo4Quote
              , imagePath = AssetPath "story_images/story2-image4.jpg"
              , altText = StoryTwo4ImageAlt
              , messageText = StoryTwo4Message
              }
            ]
      }
    , { id = 3
      , title = StoryThreeTitle
      , teaser = StoryThreeTeaser
      , teaserImgPath = AssetPath "story_images/story3-thumbnail.jpg"
      , teaserImgAltText = StoryThreeTeaserImageAlt
      , relatedInfo = relatedInfo 3
      , cards =
            [ { quoteText = StoryThree1Quote
              , imagePath = AssetPath "story_images/story3-image1.jpg"
              , altText = StoryThree1ImageAlt
              , messageText = StoryThree1Message
              }
            , { quoteText = StoryThree2Quote
              , imagePath = AssetPath "story_images/story3-image2.jpg"
              , altText = StoryThree2ImageAlt
              , messageText = StoryThree2Message
              }
            , { quoteText = StoryThree3Quote
              , imagePath = AssetPath "story_images/story3-image3.jpg"
              , altText = StoryThree3ImageAlt
              , messageText = StoryThree3Message
              }
            , { quoteText = StoryThree4Quote
              , imagePath = AssetPath "story_images/story3-image4.jpg"
              , altText = StoryThree4ImageAlt
              , messageText = StoryThree4Message
              }
            ]
      }
    ]
