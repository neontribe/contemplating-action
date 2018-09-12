module Info exposing (Info, getInfo, getInfoBySlug, infoCard, infoPage)

import Icon exposing (getIcon)
import List
import Html exposing (Html, a, article, div, h2, li, p, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Messages exposing (Msg(ButtonPress))


type alias Info =
    { id : Int
    , icon : String
    , name : String
    , slug : String
    , infoText : List String
    }



-- Helpers


getInfo : Int -> Info
getInfo infoId =
    let
        foundInfo =
            List.head (List.filter (\i -> i.id == infoId) info)
    in
        case foundInfo of
            Just info ->
                info

            Nothing ->
                placeholderInfo


getInfoBySlug : String -> Info
getInfoBySlug infoSlug =
    let
        foundInfo =
            List.head (List.filter (\i -> i.slug == infoSlug) info)
    in
        case foundInfo of
            Just info ->
                info

            Nothing ->
                placeholderInfo



-- Views


infoCard : Info -> Html Msg
infoCard info =
    li []
        [ a
            [ class "card card--alternate info"
            , href ("#/info-to-help/" ++ info.slug)

            -- Record page source because same event will register from click to info from a story page.
            , onClick (ButtonPress "information" "view-single" info.slug True)
            ]
            [ getIcon info.icon (Just "icon info--icon")
            , span [ class "info--text" ]
                [ span [ class "link link--stateless" ] [ text info.name ] ]
            , span [] [ span [] [ getIcon "arrow-right" Nothing ] ]
            ]
        ]


infoPage : Info -> Html Msg
infoPage info =
    div [ class "section--vertical-fill-center" ]
        [ div [ class "section section--align-bottom" ]
            [ div [ class "card card--alternate card--with-icon" ]
                [ div [ class "text-center" ]
                    [ getIcon info.icon (Just "icon icon--large card--icon")
                    , article [ class "inset" ]
                        [ h2 [] [ text info.name ]
                        , div [] (renderParas info.infoText)
                        ]
                    ]
                ]
            , div [ class "section" ]
                [ div [ class "text-center" ]
                    [ a [ class "link", href "#/info-to-help", onClick (ButtonPress "information" "view-list" "more-info" True) ]
                        [ text "Other information to help you" ]
                    ]
                ]
            ]
        ]


renderParas : List String -> List (Html msg)
renderParas paras =
    List.map (\t -> p [] [ text t ]) paras



-- Info records


placeholderInfo : Info
placeholderInfo =
    { id = 0
    , name = "Not found"
    , slug = "not-found"
    , icon = "question"
    , infoText =
        [ "We can't find a page with that title, sorry."
        , "Please use the 'Other information to help you' page to see if we have the topic you are looking for."
        ]
    }


info : List Info
info =
    [ { id = 1
      , name = "What happens if I call?"
      , slug = "call-someone"
      , icon = "call"
      , infoText =
            [ "Call any time of day, whenever you need to talk."
            ]
      }
    , { id = 2
      , name = "What happens if I write?"
      , slug = "write-to-someone"
      , icon = "call"
      , infoText =
            [ "Write any time of day, whenever you have something to say."
            ]
      }
    , { id = 3
      , name = "What happens if I find a special rock?"
      , slug = "show-someone"
      , icon = "call"
      , infoText =
            [ "Find out more about it."
            ]
      }
    , { id = 4
      , name = "What happens if I break a branch off the tree?"
      , slug = "broken-limbs"
      , icon = "call"
      , infoText =
            [ "Try to make something useful out of it, like a walking stick."
            ]
      }
    ]
