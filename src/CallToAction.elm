module CallToAction exposing (CallToAction, CallToActionType(..), callToActionButton, callToActionConstructor)

import Html exposing (Html, div, text)


type CallToActionType
    = Phone
    | Survey


type alias CallToAction =
    { action : CallToActionType
    , category : String
    , href : String
    , icon : String
    , displayHref : String
    , promptLong : String
    , promptShort : String
    }


callToActionConstructor : CallToActionType -> String -> String -> CallToAction
callToActionConstructor actionType href displayHref =
    case actionType of
        Phone ->
            { action = Phone
            , category = "phone"
            , href = "tel:" ++ href
            , icon = "phone"
            , displayHref = displayHref
            , promptLong = "Call Us"
            , promptShort = "Call"
            }

        Survey ->
            { action = Survey
            , category = "survey"
            , href = href
            , icon = "survey"
            , displayHref = displayHref
            , promptLong = "Take part in our Survey"
            , promptShort = "Survey"
            }


callToActionButton : CallToAction -> Html msg
callToActionButton cta =
    case cta.action of
        Phone ->
            div [] [ text "phone" ]

        Survey ->
            div [] [ text "survey" ]
