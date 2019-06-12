module Info exposing (Info, getInfo, getInfoBySlug, infoCard, infoPage)

import Html exposing (Html, a, article, div, h2, li, p, span, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Icon exposing (getIcon)
import List
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
      , name = "About the project"
      , slug = "about"
      , icon = "question-circle-o"
      , infoText =
            [ """In 2017, The Haven Wolverhampton, worked with Neontribe and women who had been through domestic abuse. We co-designed a web app to encourage other women in that situation to seek support and advice.
            We want to find out if the structure of that app could be used by different organisations. We believe
            that reassuring people that their fears and challenges are shared could help them take early steps on a journey of change such as contacting a support service. """
            ]
      }
    , { id = 2
      , name = "Bite size information"
      , slug = "bite-size-info"
      , icon = "info-circle"
      , infoText =
            [ """We include bite size information relating to a small number of fears and barriers that are likely to be stopping people from taking the next step. Keeping the
            language simple we aim to be open and honest, with a reassuring tone. We resist the temptation to provide all the information people might need. Our goal is to offer just enough to
            help people reach out to support services. Other websites have excellent longer content. """
            ]
      }
    , { id = 3
      , name = "Visual Storytelling"
      , slug = "visual-storytelling"
      , icon = "pencil"
      , infoText =
            [ """Many organisations struggle with the same problem with stories. We know stories can be powerful, we want to use them for many reasons.
            Unfortunately people don’t always like to spend time reading them online. We believe that visual storytelling can change this. Contemplating Action has a budget for
            artists, to test whether this 4 image story format can encourage more people to read them."""
            ]
      }
    , { id = 4
      , name = "What is the survey?"
      , slug = "survey"
      , icon = "check-square-o"
      , infoText =
            [ """We would like you to take our survey. We want to understand whether staff in organisations who work most closely with people seeking support think this approach
            could work. We’re interested in your instincts as well as any evidence you might share. It will help us decide where to take the project next."""
            ]
      }
    , { id = 5
      , name = "Can my organisation try this?"
      , slug = "try-this"
      , icon = "group"
      , infoText =
            [ """We’re actively looking for partner charities interested in experimenting with this visual storytelling format. So if you have a helpline, webchat, messaging service or even a face to face
            service, we could work together on whether an app could help people connect to those services. We have small amounts of funding to support charities getting involved. Please show your interest by taking the survey."""
            ]
      }
    , { id = 6
      , name = "Who is involved in this project?"
      , slug = "who-is-involved"
      , icon = "involved"
      , infoText =
            [ """This is a partnership between CAST - a charity driving social change through digital technology - and digital development agency Neontribe. It is one of a number of projects aimed at supporting civic and social organisations to grow confident in using digital tools to achieve their charitable objectives.
            It is possible thanks to The Haven, Wolverhampton sharing technology developed for and with the people they work with."""
            ]
      }
    ]
