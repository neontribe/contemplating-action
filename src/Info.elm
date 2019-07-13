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
      , name = t InfoCallName
      , slug = "helpline"
      , icon = "call"
      , infoText =
            [ t (InfoCallP1 (t CallToActionDestinationDisplay))
            , t InfoCallP2
            ]
      }
    , { id = 2
      , name = t InfoImmigrationName
      , slug = "worried-about-immigration"
      , icon = "id-card"
      , infoText =
            [ t (InfoImmigrationP1 (t CallToActionDestinationDisplay))
            ]
      }
    , { id = 3
      , name = t InfoLeavingName
      , slug = "thinking-about-leaving"
      , icon = "leaving"
      , infoText =
            [ t InfoLeavingP1
            , t InfoLeavingP2
            , t (InfoLeavingP3 (t CallToActionDestinationDisplay))
            ]
      }
    , { id = 4
      , name = t InfoSocialServicesName
      , slug = "social-services"
      , icon = "children"
      , infoText =
            [ t InfoSocialServicesP1
            , t InfoSocialServicesP2
            , t InfoSocialServicesP3
            ]
      }
    , { id = 5
      , name = t InfoMoneyName
      , slug = "worried-about-money"
      , icon = "pound"
      , infoText =
            [ t InfoMoneyP1
            , t (InfoMoneyP2 (t CallToActionDestinationDisplay))
            ]
      }
    , { id = 6
      , name = t InfoPoliceName
      , slug = "talking-to-police"
      , icon = "police"
      , infoText =
            [ t InfoPoliceP1
            , t InfoPoliceP2
            , t InfoPoliceP3
            ]
      }
    ]
