module Route exposing (Page(..), pageFromUrl, pageToString)

import Url
import Url.Parser as Parser exposing ((</>), Parser, int, map, oneOf, s, string, top)


type Page
    = Home
    | Timeout
    | SupportersPage
    | StoriesPage
    | StoryPage Int
    | PrivacyPage
    | InfoToHelpPage
    | InfoPage String


routeParser : Parser (Page -> a) a
routeParser =
    oneOf
        [ map Home top
        , map Timeout top
        , map SupportersPage (s "supporters")
        , map StoriesPage (s "stories")
        , map StoryPage (s "stories" </> int)
        , map PrivacyPage (s "privacy-policy")
        , map InfoToHelpPage (s "info-to-help")
        , map InfoPage (s "info-to-help" </> string)
        ]


pageFromUrl : Url.Url -> Maybe Page
pageFromUrl url =
    -- The fragment and path are the same for our purposes.
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse routeParser


pageToString : Page -> String
pageToString page =
    case page of
        Home ->
            "Home"

        Timeout ->
            "Timeout"


        SupportersPage ->
            "Supporters Page"

        StoriesPage ->
            "Stories Page"

        StoryPage number ->
            "Story Page " ++ String.fromInt number

        PrivacyPage ->
            "Privacy Page"

        InfoToHelpPage ->
            "Information to Help Page"

        InfoPage string ->
            "Information Page " ++ string
