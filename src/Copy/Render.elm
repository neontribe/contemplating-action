module Copy.Render exposing (toHtml, toString)

import Copy.BrandCopy exposing (brandCopy)
import Copy.Keys exposing (Copy(..), Key(..))
import Html exposing (Html, a, li, p, text, ul)
import Html.Attributes exposing (class, href)


copyToHtml : Copy -> Html msg
copyToHtml copy =
    case copy of
        CopyText string ->
            text string

        CopyList list ->
            ul [ class "ul--disc" ]
                (List.map (\item -> li [] [ copyToHtml item ]) list)

        CopyWithLink textLink ->
            p []
                [ text (textLink.textBefore ++ " ")
                , a [ class "link link--plain", href textLink.destination ] [ text textLink.linkText ]
                , text (" " ++ textLink.textAfter)
                ]


toHtml : Key -> Html msg
toHtml key =
    copyToHtml (brandCopy key)


toString : Key -> String
toString key =
    case brandCopy key of
        CopyText string ->
            string

        CopyList list ->
            ""

        CopyWithLink textLink ->
            textLink.textBefore ++ " " ++ textLink.linkText ++ " " ++ textLink.textAfter
