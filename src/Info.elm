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
      , name = "Bite size information"
      , slug = "bitesize-information"
      , icon = "call"
      , infoText =
            [ """We include bite size information relating to a small number of fears and barriers that are likely to be stopping people from taking the 
            next step. Keeping the language simple we aim to be open and honest, with a reassuring tone. We resist the temptation to provide all the 
            information people might need. Our goal is to offer just enough to help people reach out to support services. Other websites have excellent 
            longer content."""
            ]
      }
    , { id = 2
      , name = "Illustrations"
      , slug = "illustrations"
      , icon = "call"
      , infoText =
            [ """Many organisations struggle with the same problem with stories. People often say that they want to hear stories from other people who
             have been through the same problems as them, but when the organisation provides stories, no one looks at them. We believe that visual 
             storytelling can change this. We are testing whether the 4 image format engages people in a way that other storytelling might not do."""
            ]
      }
    , { id = 3
      , name = "What is the survey?"
      , slug = "what-is-the-survey"
      , icon = "call"
      , infoText =
            [ """The survey is research with key staff in organisations that run helplines or web chats or text services. We want to know whether those 
            staff who work most closely with people seeking support think this approach could work. We also want to know what concerns or hopes they 
            might have, if they were to try creating an app like this within their organisation."""
            ]
      }
    , { id = 4
      , name = "Can my organisation try this?"
      , slug = "try-this"
      , icon = "call"
      , infoText =
            [ """We are currently working with 3 charities as well as The Haven, Wolverhampton whose app inspired the project. We are testing two things. 
            Firstly, can we get people from social media or other locations into the app. Secondly, if we do, does it encourage people to seek support.  
            When this trial is complete in the summer we will be looking for more organisations to work with. Please take the survey if you are interested."""
            ]
      }
    , { id = 5
      , name = "What does taking part cost?"
      , slug = "cost"
      , icon = "call"
      , infoText =
            [ """At the moment, we have a budget to support the charities working with us and pay for new stories and illustrations that work for them. 
            We expect that all stages of testing whether this approach is useful will be free for any charities taking part. The testing is designed 
            to help us decide whether a free or low cost tool allowing charities to create their own content using this structure would be useful."""
            ]
      }
    , { id = 6
      , name = "Who is involved in this project?"
      , slug = "who-is-involved"
      , icon = "call"
      , infoText =
            [ """This is a partnership between CAST - a charity driving social change through digital technology - and digital development agency 
            Neontribe. It is one of a number of projects aimed at supporting civic and social organisations to grow confident in using digital tools 
            to achieve their charitable objectives.  It is possible thanks to The Haven, Wolverhampton sharing technology developed for the people 
            they work with."""
            ]
      }
    ]
