module StoryDeck exposing (card, getInfoButtons, storyRelatedInfo, storyTeaser, storyTitle)

import Array
import Assets exposing (AssetPath(..), path)
import Html exposing (Html, a, blockquote, div, h3, img, p, text)
import Html.Attributes exposing (alt, class, href, src)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import Info exposing (getInfo)
import List
import Messages exposing (Msg(ButtonPress))


type alias Deck =
    { id : Int
    , title : String
    , teaser : String
    , teaserImgPath : AssetPath
    , teaserImgAltText : String
    , relatedInfo : List Int
    , cards : List Card
    }


type alias Card =
    { imagePath : AssetPath
    , messageText : Maybe String
    , quoteText : String
    , altText : String
    }



-- Accessors for Story Deck content


storyTitle : Int -> String
storyTitle deckId =
    (getDeck deckId decks).title


storyTeaserImgPath : Int -> String
storyTeaserImgPath deckId =
    path (getDeck deckId decks).teaserImgPath


storyTeaserImgAltText : Int -> String
storyTeaserImgAltText deckId =
    (getDeck deckId decks).teaserImgAltText


storyTeaser : Int -> Html Msg
storyTeaser deckId =
    div [ class "card" ]
        [ a
            [ href ("#/stories/" ++ toString deckId)
            , onClick (ButtonPress "story" "view-single" (storyTitle deckId) False)
            ]
            [ img [ class "card--thumbnail", src (storyTeaserImgPath deckId), alt (storyTeaserImgAltText deckId) ] []
            ]
        , a
            [ class "link--unstyled"
            , href ("#/stories/" ++ toString deckId)
            , onClick (ButtonPress "story" "view-single" (storyTitle deckId) False)
            ]
            [ h3 [ class "title--small" ] [ text (storyTitle deckId) ]
            ]
        , blockquote [ class "card--quote" ]
            [ text (getDeck deckId decks).teaser ]
        , div [ class "text-right text-with-icon--right stories--more-link" ]
            [ a
                [ class "link"
                , href ("#/stories/" ++ toString deckId)
                , onClick (ButtonPress "story" "view-single" (storyTitle deckId) False)
                ]
                [ text ("See " ++ storyTitle deckId ++ "'s Story")
                ]
            , a
                [ class "link--unstyled"
                , href ("#/stories/" ++ toString deckId)
                , onClick (ButtonPress "story" "view-single" (storyTitle deckId) False)
                ]
                [ getIcon "arrow-right" (Just "icon--alternate")
                ]
            ]
        ]


storyRelatedInfo : Int -> List (Html Msg)
storyRelatedInfo deckId =
    List.map getInfoButtons (getRelatedInfo deckId)


getInfoButtons : Int -> Html Msg
getInfoButtons id =
    a
        [ href ("#/info-to-help/" ++ (getInfo id).slug)
        , class "button button--alternate button--full-width"
        , onClick (ButtonPress "information" "view-single" (getInfo id).slug True)
        ]
        [ text (getInfo id).name ]


card : Int -> Int -> Html msg
card deckId cardId =
    div [ class "card story" ]
        [ h3 [ class "title--small title--alternate" ]
            [ text ("Part " ++ toString cardId ++ " of 4") ]
        , blockquote [ class "card--quote quote" ]
            [ text (getCard deckId cardId).quoteText ]
        , div [ class "story--illustration" ]
            [ img [ src (cardImgPath deckId cardId), alt (getCard deckId cardId).altText ]
                []
            , cardMessage deckId cardId
            ]
        ]


cardMessage : Int -> Int -> Html msg
cardMessage deckId cardId =
    let
        message =
            (getCard deckId cardId).messageText
    in
        case message of
            -- Easiest to return an empty p here. Class in case we need to style.
            Nothing ->
                p [ class "no-message" ] []

            Just message ->
                blockquote [ class "story--message quote" ] [ text message ]


cardImgPath : Int -> Int -> String
cardImgPath deckId cardId =
    path (getCard deckId cardId).imagePath



-- Helpers to get card and deck records


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
            Just card ->
                card

            Nothing ->
                placeholderCard


getDeck : Int -> List Deck -> Deck
getDeck deckId decks =
    let
        foundDeck =
            List.head (List.filter (\i -> i.id == deckId) decks)
    in
        case foundDeck of
            Just deck ->
                deck

            Nothing ->
                placeholderDeck


getRelatedInfo : Int -> List Int
getRelatedInfo deckId =
    (getDeck deckId decks).relatedInfo



-- Story Deck records


placeholderDeck : Deck
placeholderDeck =
    { id = 0
    , title = "Coming soon"
    , teaser = "We're working on it"
    , teaserImgPath = AssetPath "story_images/thumb_placeholder.png"
    , teaserImgAltText = "Placeholder image"
    , relatedInfo = [ 1 ]
    , cards = [ placeholderCard ]
    }


placeholderCard : Card
placeholderCard =
    { quoteText = "Story coming soon."
    , imagePath = AssetPath "story_images/slide1.svg"
    , altText = "Placeholder image"
    , messageText = Just "Check back soon"
    }



-- Elm multi-line Strings add a space anywhere there's a carriage return without one


decks : List Deck
decks =
    [ { id = 1
      , title = "A story about rivers"
      , teaser = "The rivers run wide and deep."
      , teaserImgPath = AssetPath "story_images/thumb_placeholder.png"
      , teaserImgAltText = "Some text that describes the teaser image."
      , relatedInfo = [ 2, 5 ]
      , cards =
            [ { quoteText =
                    """Something inspiring about rivers.
                    """
              , imagePath = AssetPath "story_images/slide1.svg"
              , altText = "Some text that describes the image"
              , messageText = Nothing
              }
            , { quoteText =
                    """Something suprising about rivers.
                    """
              , imagePath = AssetPath "story_images/slide2.svg"
              , altText = "Some text that describes the image."
              , messageText = Just "Caption text."
              }
            , { quoteText =
                    """Something magical about rivers.
                    """
              , imagePath = AssetPath "story_images/slide3.svg"
              , altText = "Some text that describes the image."
              , messageText = Nothing
              }
            , { quoteText =
                    """Something interesting about rivers.
                    """
              , imagePath = AssetPath "story_images/slide4.svg"
              , altText = "Some text that describes the image."
              , messageText = Nothing
              }
            ]
      }
    , { id = 2
      , title = "A story about trees"
      , teaser = "The trees are not in a row."
      , teaserImgPath = AssetPath "story_images/thumb_placeholder.png"
      , teaserImgAltText = "Some text that describes the teaser image."
      , relatedInfo = [ 2, 5 ]
      , cards =
            [ { quoteText =
                    """Something inspiring about trees.
                    """
              , imagePath = AssetPath "story_images/slide1.svg"
              , altText = "Some text that describes the image"
              , messageText = Nothing
              }
            , { quoteText =
                    """Something suprising about trees.
                    """
              , imagePath = AssetPath "story_images/slide2.svg"
              , altText = "Some text that describes the image."
              , messageText = Just "Caption text."
              }
            , { quoteText =
                    """Something magical about trees.
                    """
              , imagePath = AssetPath "story_images/slide3.svg"
              , altText = "Some text that describes the image."
              , messageText = Nothing
              }
            , { quoteText =
                    """Something interesting about trees.
                    """
              , imagePath = AssetPath "story_images/slide4.svg"
              , altText = "Some text that describes the image."
              , messageText = Nothing
              }
            ]
      }
    ]
