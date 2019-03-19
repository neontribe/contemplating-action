module Views.Config exposing (Display(..), appTitle, callToAction, email)

import CallToAction exposing (CallToAction, CallToActionType(..), callToActionConstructor)


type Display
    = Desktop
    | Mobile


appTitle : String
appTitle =
    "Contemplating Action"


email : String
email =
    "hello@contemplatingaction.org.uk"


callToAction : CallToAction
callToAction =
    callToActionConstructor Survey "https://mysurvey.example.com" ""
