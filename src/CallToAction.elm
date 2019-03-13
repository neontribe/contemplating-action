module CallToAction exposing (CallToAction, CallToActionType(..), callToActionConstructor)


type CallToActionType
    = Phone
    | Survey


type alias CallToAction =
    { action : CallToActionType
    , href : String
    , displayHref : String
    , promptLong : String
    , promptShort : String
    }


callToActionConstructor : CallToActionType -> String -> String -> CallToAction
callToActionConstructor actionType href displayHref =
    case actionType of
        Phone ->
            { action = Phone
            , href = "tel:" ++ href
            , displayHref = displayHref
            , promptLong = "Call Us"
            , promptShort = "Call"
            }

        Survey ->
            { action = Survey
            , href = href
            , displayHref = displayHref
            , promptLong = "Take part in our Survey"
            , promptShort = "Survey"
            }
