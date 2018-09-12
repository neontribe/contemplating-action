module Route exposing (Page(..), route)

import UrlParser as Url exposing ((</>), s, int, string, top)


type Page
    = Home
    | Timeout
    | SupportersPage
    | StoriesPage
    | StoryPage Int
    | PrivacyPage
    | InfoToHelpPage
    | InfoPage String


route : Url.Parser (Page -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map Timeout top
        , Url.map SupportersPage (s "supporters")
        , Url.map StoriesPage (s "stories")
        , Url.map StoryPage (s "stories" </> int)
        , Url.map PrivacyPage (s "privacy-policy")
        , Url.map InfoToHelpPage (s "info-to-help")
        , Url.map InfoPage (s "info-to-help" </> string)
        ]
