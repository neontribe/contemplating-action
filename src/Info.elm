module Info exposing (Info, getInfo, getInfoBySlug, infoCard, infoPage)

import Html exposing (Html, a, article, div, h2, li, p, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Icon exposing (getIcon)
import List
import Messages exposing (Msg(..))


type alias Info =
    { id : Int
    , icon : String
    , name : String
    , slug : String
    , infoText : List String
    }



-- Helpers


getInfo : Language -> Int -> Info
getInfo language infoId =
    let
        foundInfo =
            List.head (List.filter (\i -> i.id == infoId) (infoList language))
    in
    case foundInfo of
        Just info ->
            info

        Nothing ->
            placeholderInfo language


getInfoBySlug : Language -> String -> Info
getInfoBySlug language infoSlug =
    let
        foundInfo =
            List.head (List.filter (\i -> i.slug == infoSlug) (infoList language))
    in
    case foundInfo of
        Just info ->
            info

        Nothing ->
            placeholderInfo language



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


infoPage : Language -> Info -> Html Msg
infoPage language info =
    let
        t =
            translate language
    in
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
                        [ text (t InfoOtherInfoLink) ]
                    ]
                ]
            ]
        ]


renderParas : List String -> List (Html msg)
renderParas paras =
    List.map (\t -> p [] [ text t ]) paras



-- Info records


placeholderInfo : Language -> Info
placeholderInfo language =
    let
        t =
            translate language
    in
    { id = 0
    , name = t InfoNotFoundName
    , slug = "not-found"
    , icon = "question"
    , infoText =
        [ t InfoNotFoundP1
        , t InfoNotFoundP2
        ]
    }


infoList : Language -> List Info
infoList language =
    let
        t =
            translate language
    in
    [ { id = 1
      , name = t InfoOneName
      , slug = t InfoOneSlug
      , icon = t InfoOneIcon
      , infoText = [ t InfoOneP1 ]
      }
    , { id = 2
      , name = t InfoTwoName
      , slug = t InfoTwoSlug
      , icon = t InfoTwoIcon
      , infoText = [ t InfoTwoP1 ]
      }
    , { id = 3
      , name = t InfoThreeName
      , slug = t InfoThreeSlug
      , icon = t InfoThreeIcon
      , infoText = [ t InfoThreeP1 ]
      }
    , { id = 4
      , name = t InfoFourName
      , slug = t InfoFourSlug
      , icon = t InfoFourIcon
      , infoText = [ t InfoFourP1 ]
      }
    , { id = 5
      , name = t InfoFiveName
      , slug = t InfoFiveSlug
      , icon = t InfoFiveIcon
      , infoText = [ t InfoFiveP1 ]
      }
    , { id = 6
      , name = t InfoSixName
      , slug = t InfoSixSlug
      , icon = t InfoSixIcon
      , infoText = [ t InfoSixP1 ]
      }
    ]
