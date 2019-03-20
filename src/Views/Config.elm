module Views.Config exposing (appTitle, callToAction, email)

import CallToAction exposing (CallToAction, CallToActionType(..), callToActionConstructor)


appTitle : String
appTitle =
    "Contemplating Action"


email : String
email =
    "hello@contemplatingaction.org.uk"


callToAction : CallToAction
callToAction =
    callToActionConstructor Survey "https://mysurvey.example.com" ""
