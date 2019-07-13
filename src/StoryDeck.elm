module StoryDeck exposing (card, storyRelatedInfo, storyTeaser, storyTitle)

import Array
import Assets exposing (AssetPath(..), path)
import Html exposing (Html, a, blockquote, div, h3, img, p, text)
import Html.Attributes exposing (alt, class, href, src)
import Html.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
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


storyTeaser : Language -> Int -> Html Msg
storyTeaser language deckId =
    let
        t =
            translate
    in
    div [ class "card" ]
        [ a
            [ href ("#/stories/" ++ String.fromInt deckId)
            , onClick (ButtonPress "story" "view-single" (t English (storyTitle deckId)) False)
            ]
            [ img [ class "card--thumbnail", src (storyTeaserImgPath deckId), alt (t language (storyTeaserImgAltText deckId)) ] []
            ]
        , a
            [ class "link--unstyled"
            , href ("#/stories/" ++ String.fromInt deckId)
            , onClick (ButtonPress "story" "view-single" (t English (storyTitle deckId)) False)
            ]
            [ h3 [ class "title--small" ] [ text (t language (storyTitle deckId)) ]
            ]
        , blockquote [ class "card--quote" ]
            [ text (t language (getDeck deckId decks).teaser) ]
        , div [ class "text-right text-with-icon--right stories--more-link" ]
            [ a
                [ class "link"
                , href ("#/stories/" ++ String.fromInt deckId)
                , onClick (ButtonPress "story" "view-single" (t English (storyTitle deckId)) False)
                ]
                [ text (t language (StoriesTeaserMoreLink (t language (storyTitle deckId))))
                ]
            , a
                [ class "link--unstyled"
                , href ("#/stories/" ++ String.fromInt deckId)
                , onClick (ButtonPress "story" "view-single" (t English (storyTitle deckId)) False)
                ]
                [ getIcon "arrow-right" (Just "icon--alternate")
                ]
            ]
        ]


storyRelatedInfo : Language -> Int -> List (Html Msg)
storyRelatedInfo language deckId =
    List.map getInfoButtons (getRelatedInfoIds ( language, deckId ))


getInfoButtons : ( Language, Int ) -> Html Msg
getInfoButtons ( language, id ) =
    a
        [ href ("#/info-to-help/" ++ (getInfo language id).slug)
        , class "button button--alternate button--full-width"
        , onClick (ButtonPress "information" "view-single" (getInfo language id).slug True)
        ]
        [ text (getInfo language id).name ]


card : Language -> Int -> Int -> Html msg
card language deckId cardId =
    let
        t =
            translate language
    in
    div [ class "card story" ]
        [ h3 [ class "title--small title--alternate" ]
            [ text (t (StoryCardH3 cardId)) ]
        , blockquote [ class "card--quote quote" ]
            [ text (t (getCard deckId cardId).quoteText) ]
        , div [ class "story--illustration" ]
            [ img [ src (cardImgPath deckId cardId), alt (t (getCard deckId cardId).altText) ]
                []
            , cardMessage language deckId cardId
            ]
        ]


cardMessage : Language -> Int -> Int -> Html msg
cardMessage language deckId cardId =
    let
        maybeMessage =
            (getCard deckId cardId).messageText
    in
    case maybeMessage of
        -- Easiest to return an empty p here. Class in case we need to style.
        Nothing ->
            p [ class "no-message" ] []

        Just aMessage ->
            blockquote [ class "story--message quote" ] [ text (translate language aMessage) ]


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


getRelatedInfoIds : ( Language, Int ) -> List ( Language, Int )
getRelatedInfoIds ( language, deckId ) =
    List.map (\n -> ( language, n )) (getDeck deckId decks).relatedInfo



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
    [ { id = 7
      , title = StoryMelissaTitle
      , teaser = StoryMelissaTeaser
      , teaserImgPath = AssetPath "story_images/melissa/melissa_thumbnail.jpg"
      , teaserImgAltText = StoryMelissaTeaserImageAlt
      , relatedInfo = [ 3, 6 ]
      , cards =
            [ { quoteText = StoryMelissa1Quote
              , imagePath = AssetPath "story_images/melissa/melissa_1.jpg"
              , altText = StoryMelissa1ImageAlt
              , messageText = Just StoryMelissa1Message
              }
            , { quoteText = StoryMelissa2Quote
              , imagePath = AssetPath "story_images/melissa/melissa_2.jpg"
              , altText = StoryMelissa2ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryMelissa3Quote
              , imagePath = AssetPath "story_images/melissa/melissa_3.jpg"
              , altText = StoryMelissa3ImageAlt
              , messageText = Just StoryMelissa3Message
              }
            , { quoteText = StoryMelissa4Quote
              , imagePath = AssetPath "story_images/melissa/melissa_4.jpg"
              , altText = StoryMelissa4ImageAlt
              , messageText = Just StoryMelissa4Message
              }
            ]
      }
    , { id = 1
      , title = StoryAmaTitle
      , teaser = StoryAmaTeaser
      , teaserImgPath = AssetPath "story_images/ama/ama_thumbnail.jpg"
      , teaserImgAltText = StoryAmaTeaserImageAlt
      , relatedInfo = [ 2, 5 ]
      , cards =
            [ { quoteText = StoryAma1Quote
              , imagePath = AssetPath "story_images/ama/ama_1.jpg"
              , altText = StoryAma1ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryAma2Quote
              , imagePath = AssetPath "story_images/ama/ama_2.jpg"
              , altText = StoryAma2ImageAlt
              , messageText = Just StoryAma2Message
              }
            , { quoteText = StoryAma3Quote
              , imagePath = AssetPath "story_images/ama/ama_3.jpg"
              , altText = StoryAma3ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryAma4Quote
              , imagePath = AssetPath "story_images/ama/ama_4.jpg"
              , altText = StoryAma4ImageAlt
              , messageText = Nothing
              }
            ]
      }
    , { id = 2
      , title = StoryRebeccaTitle
      , teaser = StoryRebeccaTeaser
      , teaserImgPath = AssetPath "story_images/rebecca/rebecca_thumbnail.jpg"
      , teaserImgAltText = StoryRebeccaTeaserImageAlt
      , relatedInfo = [ 6 ]
      , cards =
            [ { quoteText = StoryRebecca1Quote
              , imagePath = AssetPath "story_images/rebecca/rebecca_1.jpg"
              , altText = StoryRebecca1ImageAlt
              , messageText = Just StoryRebecca1Message
              }
            , { quoteText = StoryRebecca2Quote
              , imagePath = AssetPath "story_images/rebecca/rebecca_2.jpg"
              , altText = StoryRebecca2ImageAlt
              , messageText = Just StoryRebecca2Message
              }
            , { quoteText = StoryRebecca3Quote
              , imagePath = AssetPath "story_images/rebecca/rebecca_3.jpg"
              , altText = StoryRebecca3ImageAlt
              , messageText = Just StoryRebecca3Message
              }
            , { quoteText = StoryRebecca4Quote
              , imagePath = AssetPath "story_images/rebecca/rebecca_4.jpg"
              , altText = StoryRebecca4ImageAlt
              , messageText = Nothing
              }
            ]
      }
    , { id = 3
      , title = StoryTinaTitle
      , teaser = StoryTinaTeaser
      , teaserImgPath = AssetPath "story_images/tina/tina_thumbnail.jpg"
      , teaserImgAltText = StoryTinaTeaserImageAlt
      , relatedInfo = [ 6, 3 ]
      , cards =
            [ { quoteText = StoryTina1Quote
              , imagePath = AssetPath "story_images/tina/tina_1.jpg"
              , altText = StoryTina1ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryTina2Quote
              , imagePath = AssetPath "story_images/tina/tina_2.jpg"
              , altText = StoryTina2ImageAlt
              , messageText = Just StoryTina2Message
              }
            , { quoteText = StoryTina3Quote
              , imagePath = AssetPath "story_images/tina/tina_3.jpg"
              , altText = StoryTina3ImageAlt
              , messageText = Just StoryTina3Message
              }
            , { quoteText = StoryTina4Quote
              , imagePath = AssetPath "story_images/tina/tina_4.jpg"
              , altText = StoryTina4ImageAlt
              , messageText = Just StoryTina4Message
              }
            ]
      }
    , { id = 4
      , title = StoryHeleneTitle
      , teaser = StoryHeleneTeaser
      , teaserImgPath = AssetPath "story_images/helene/helene_thumbnail.png"
      , teaserImgAltText = StoryHeleneTeaserImageAlt
      , relatedInfo = [ 5 ]
      , cards =
            [ { quoteText = StoryHelene1Quote
              , imagePath = AssetPath "story_images/helene/helene_1.jpg"
              , altText = StoryHelene1ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryHelene2Quote
              , imagePath = AssetPath "story_images/helene/helene_2.jpg"
              , altText = StoryHelene2ImageAlt
              , messageText = Just StoryHelene2Message
              }
            , { quoteText = StoryHelene3Quote
              , imagePath = AssetPath "story_images/helene/helene_3.jpg"
              , altText = StoryHelene3ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryHelene4Quote
              , imagePath = AssetPath "story_images/helene/helene_4.jpg"
              , altText = StoryHelene4ImageAlt
              , messageText = Nothing
              }
            ]
      }
    , { id = 5
      , title = StoryEmmaTitle
      , teaser = StoryEmmaTeaser
      , teaserImgPath = AssetPath "story_images/emma/emma_thumbnail.jpg"
      , teaserImgAltText = StoryEmmaTeaserImageAlt
      , relatedInfo = [ 6, 4 ]
      , cards =
            [ { quoteText = StoryEmma1Quote
              , imagePath = AssetPath "story_images/emma/emma_1.jpg"
              , altText = StoryEmma1ImageAlt
              , messageText = Just StoryEmma1Message
              }
            , { quoteText = StoryEmma2Quote
              , imagePath = AssetPath "story_images/emma/emma_2.jpg"
              , altText = StoryEmma2ImageAlt
              , messageText = Just StoryEmma2Message
              }
            , { quoteText = StoryEmma3Quote
              , imagePath = AssetPath "story_images/emma/emma_3.jpg"
              , altText = StoryEmma3ImageAlt
              , messageText = Just StoryEmma3Message
              }
            , { quoteText = StoryEmma4Quote
              , imagePath = AssetPath "story_images/emma/emma_4.jpg"
              , altText = StoryEmma4ImageAlt
              , messageText = Nothing
              }
            ]
      }
    , { id = 6
      , title = StoryAmirahTitle
      , teaser = StoryAmirahTeaser
      , teaserImgPath = AssetPath "story_images/amirah/amirah_thumbnail.jpg"
      , teaserImgAltText = StoryAmirahTeaserImageAlt
      , relatedInfo = [ 1, 3 ]
      , cards =
            [ { quoteText = StoryAmirah1Quote
              , imagePath = AssetPath "story_images/amirah/amirah_1.jpg"
              , altText = StoryAmirah1ImageAlt
              , messageText = Nothing
              }
            , { quoteText = StoryAmirah2Quote
              , imagePath = AssetPath "story_images/amirah/amirah_2.jpg"
              , altText = StoryAmirah2ImageAlt
              , messageText = Just StoryAmirah2Message
              }
            , { quoteText = StoryAmirah3Quote
              , imagePath = AssetPath "story_images/amirah/amirah_3.jpg"
              , altText = StoryAmirah3ImageAlt
              , messageText = Just StoryAmirah3Message
              }
            , { quoteText = StoryAmirah4Quote
              , imagePath = AssetPath "story_images/amirah/amirah_4.jpg"
              , altText = StoryAmirah4ImageAlt
              , messageText = Nothing
              }
            ]
      }
    ]
