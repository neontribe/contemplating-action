module Info exposing (Info, getInfo, getInfoBySlug, infoCard, infoPage)

import Html exposing (Html, a, article, div, h2, li, p, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import I18n.Keys exposing (StringKey(..))
import I18n.Translate exposing (Language(..), translate)
import Icon exposing (getIcon)
import List
import Messages exposing (Msg(..))


type alias Info =
    { id : Int
    , icon : StringKey
    , name : StringKey
    , slug : StringKey
    , infoText : List StringKey
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


getInfoBySlug : Language -> String -> Info
getInfoBySlug language slug =
    let
        foundInfo =
            List.head (List.filter (\i -> translate language i.slug == slug) infoList)
    in
    case foundInfo of
        Just info ->
            info

        Nothing ->
            placeholderInfo



-- Views


infoCard : Language -> Info -> Html Msg
infoCard language info =
    let
        t =
            translate language
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
                    [ getIcon (t info.icon) (Just "icon icon--large card--icon")
                    , article [ class "inset" ]
                        [ h2 [] [ text (t info.name) ]
                        , div [] (renderParas language info.infoText)
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


renderParas : Language -> List StringKey -> List (Html msg)
renderParas language paras =
    let
        t =
            translate language
    in
    List.map (\key -> p [] [ text (t key) ]) paras



-- Info records


placeholderInfo : Info
placeholderInfo =
    { id = 0
    , name = InfoNotFoundName
    , slug = InfoNotFoundSlug
    , icon = InfoNotFoundIcon
    , infoText =
        [ InfoNotFoundP1
        , InfoNotFoundP2
        ]
    }


infoList : List Info
infoList =
    [ { id = 1
      , name = InfoOneName
      , slug = InfoOneSlug
      , icon = InfoOneIcon
      , infoText = [ InfoOneP1 ]
      }
    , { id = 2
      , name = InfoTwoName
      , slug = InfoTwoSlug
      , icon = InfoTwoIcon
      , infoText = [ InfoTwoP1 ]
      }
    , { id = 3
      , name = InfoThreeName
      , slug = InfoThreeSlug
      , icon = InfoThreeIcon
      , infoText = [ InfoThreeP1 ]
      }
    , { id = 4
      , name = InfoFourName
      , slug = InfoFourSlug
      , icon = InfoFourIcon
      , infoText = [ InfoFourP1 ]
      }
    , { id = 5
      , name = InfoFiveName
      , slug = InfoFiveSlug
      , icon = InfoFiveIcon
      , infoText = [ InfoFiveP1 ]
      }
    , { id = 6
      , name = InfoSixName
      , slug = InfoSixSlug
      , icon = InfoSixIcon
      , infoText = [ InfoSixP1 ]
      }
    ]
