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
      , title = "Our Project"
      , teaser = "This shows you how we believe shaping stories from real people can work so that they help people feel ready to take action"
      , teaserImgPath = AssetPath "story_images/ourproject-image1.jpg"
      , teaserImgAltText = "A man kneeling on the floor of a dark room with his head in his hands"
      , relatedInfo = [ 1, 3 ]
      , cards =
            [ { quoteText =
                    """The story starts with some background. It gives us key pieces of information that make this person’s story clear and
                    relatable. It tends to deal with facts about the situation they were in rather than their feelings. It is always a situation
                    that clearly needed to change.
                    """
              , imagePath = AssetPath "story_images/ourproject-image1.jpg"
              , altText = "A man is kneeling on the floor of a dark room with his head in his hands"
              , messageText = Nothing
              }
            , { quoteText =
                    """Next the story moves on a little. It does one of two things. Either it tells us about a specific incident that began a
                    drive to change things, or it explores the person’s fears and other things that were holding them back. This section focuses
                    on emotions and helps us connect with the person’s story.
                    """
              , imagePath = AssetPath "story_images/ourproject-image2.jpg"
              , altText = "The man looks up a long staircase with a locked door at the top"
              , messageText = Just "This bar is used to give a little extra insight into how the person was feeling."
              }
            , { quoteText =
                    """Here the story starts to change for the better. The person becomes able to take a positive step and get some support.
                    The story tells us a little about what happened, how they managed to take the step and how they felt.
                    """
              , imagePath = AssetPath "story_images/ourproject-image3.jpg"
              , altText = "The man starts climbing the stairs to reach a hand holding out a key."
              , messageText = Nothing
              }
            , { quoteText =
                    """The final section of the story is about hope. It show that making a chance can be a positive choice. However it doesn’t
                    suggest that the person’s life is now perfect. It is designed to encourage others to believe they could make a move to a more
                    hopeful place too. It takes care not to sound out of reach.
                    """
              , imagePath = AssetPath "story_images/ourproject-image4.jpg"
              , altText = "The door is open and the lock is on the floor. The man is outside in a bright and sunny environment holding onto the key."
              , messageText = Just "sometimes the story highlights a worry that remains, and how the person is coping with it"
              }
            ]
      }
    , { id = 2
      , title = "The Haven"
      , teaser = "This is one of the six stories created for The Haven’s app. The story uses Ama’s words but the names have been changed, and the story has been shaped to help others."
      , teaserImgPath = AssetPath "story_images/ama_1.jpg"
      , teaserImgAltText = "A pregnant woman wrapped in chains"
      , relatedInfo = [ 1, 3 ]
      , cards =
            [ { quoteText =
                    """I was born in Senegal and had lived in Spain as well as the UK and I couldn’t speak English. My husband became abusive
                    after I got pregnant with our first child. For years I suffered so many different things
                    """
              , imagePath = AssetPath "story_images/ama_1.jpg"
              , altText = "A pregnant woman wrapped in chains"
              , messageText = Nothing
              }
            , { quoteText =
                    """I wanted to leave, but my husband told me without him I would be sent back to Africa. I was completely dependent on my
                    husband, I did not see any way out of my situation.
                    """
              , imagePath = AssetPath "story_images/ama_2.jpg"
              , altText = "A pregnant woman chained to her husband"
              , messageText = Just "I did not know my rights in the UK and had no money but soon I discovered I had choices."
              }
            , { quoteText =
                    """One day I broke down at my health care class. My teacher was so supportive. She told me about The Haven and they found me a
                    support worker who spoke Spanish. They talked to social services for me and found me an immigration solicitor.
                    """
              , imagePath = AssetPath "story_images/ama_3.jpg"
              , altText = "A woman crying at a desk"
              , messageText = Nothing
              }
            , { quoteText =
                    """I have a house now, with my children, and away from my abusive husband. My solicitor is helping me with immigration documents and divorce papers.
                    For the first time in a long time I can sleep and look forward to the future.
                    """
              , imagePath = AssetPath "story_images/ama_4.jpg"
              , altText = "A smiling woman with two children"
              , messageText = Nothing
              }
            ]
      }
    ]
