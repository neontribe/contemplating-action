module Info exposing (Info, getInfo, getInfoBySlug, infoListItem, infoPage)

import Copy.Keys exposing (Key(..))
import Copy.Render exposing (toHtml, toString)
import Html exposing (Html, a, article, div, h2, li, p, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import List
import Messages exposing (Msg(..))


type alias Info =
    { id : Int
    , icon : Key
    , name : Key
    , slug : Key
    , infoText : Key
    }



-- Helpers


getInfo : Int -> Info
getInfo infoId =
    let
        foundInfo =
            List.head (List.filter (\i -> i.id == infoId) infoList)
    in
    case foundInfo of
        Just info ->
            info

        Nothing ->
            placeholderInfo


getInfoBySlug : String -> Info
getInfoBySlug slug =
    let
        foundInfo =
            List.head (List.filter (\i -> toString i.slug == slug) infoList)
    in
    case foundInfo of
        Just info ->
            info

        Nothing ->
            placeholderInfo



-- Views


infoListItem : Info -> Html Msg
infoListItem info =
    let
        t =
            toString
    in
    li []
        [ a
            [ class "card card--alternate info"
            , href ("#/info-to-help/" ++ t info.slug)

            -- Record page source because same event will register from click to info from a story page.
            , onClick (ButtonPress "information" "view-single" (t info.slug) True)
            ]
            [ getIcon (t info.icon) (Just "icon info--icon")
            , span [ class "info--text" ]
                [ span [ class "link link--stateless" ] [ text (t info.name) ] ]
            , span [] [ span [] [ getIcon "arrow-right" Nothing ] ]
            ]
        ]


infoPage : Info -> Html Msg
infoPage info =
    let
        t =
            toString
    in
    div [ class "section--vertical-fill-center" ]
        [ div [ class "section section--align-bottom" ]
            [ div [ class "card card--alternate card--with-icon card--info" ]
                [ div [ class "text-center" ]
                    [ getIcon (t info.icon) (Just "icon icon--large card--icon")
                    , article [ class "inset" ]
                        [ h2 [] [ text (t info.name) ]
                        , toHtml info.infoText
                        ]
                    ]
                ]
            , div [ class "section" ]
                [ div [ class "text-center" ]
                    [ a [ class "link", href "#/info-to-help", onClick (ButtonPress "information" "view-list" "more-info" True) ]
                        [ text (t InfoOtherInfoLink) ]
                    ]
                ]
            ]
        ]



-- Info records


placeholderInfo : Info
placeholderInfo =
    { id = 0
    , name = InfoNotFoundName
    , slug = InfoNotFoundSlug
    , icon = InfoNotFoundIcon
    , infoText = InfoNotFoundContent
    }


infoList : List Info
infoList =
    [ { id = 1
      , name = InfoOneName
      , slug = InfoOneSlug
      , icon = InfoOneIcon
      , infoText = InfoOneContent
      }
    , { id = 2
      , name = InfoTwoName
      , slug = InfoTwoSlug
      , icon = InfoTwoIcon
      , infoText = InfoTwoContent
      }
    , { id = 3
      , name = InfoThreeName
      , slug = InfoThreeSlug
      , icon = InfoThreeIcon
      , infoText = InfoThreeContent
      }
    , { id = 4
      , name = InfoFourName
      , slug = InfoFourSlug
      , icon = InfoFourIcon
      , infoText = InfoFourContent
      }
    , { id = 5
      , name = InfoFiveName
      , slug = InfoFiveSlug
      , icon = InfoFiveIcon
      , infoText = InfoFiveContent
      }
    , { id = 6
      , name = InfoSixName
      , slug = InfoSixSlug
      , icon = InfoSixIcon
      , infoText = InfoSixContent
      }
    ]
