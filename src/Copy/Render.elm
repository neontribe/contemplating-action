module Copy.Render exposing (toHtml, toString)

import Copy.BrandCopy exposing (brandCopy)
import Copy.Keys exposing (Copy(..), Key(..))
import Html exposing (Html, a, li, p, text, ul)
import Html.Attributes exposing (class, href)


toHtml : Key -> Html msg
toHtml key =
    case brandCopy key of
        CopyText string ->
            text string

        CopyList list ->
            let
                listClass =
                    case key of
                        PrivacyCompanyInfoList ->
                            "company-info"

                        _ ->
                            "il--disc"
            in
            ul [ class listClass ]
                (List.map (\item -> li [] [ text item ]) list)

        CopyWithLink textLink ->
            p []
                [ text (textLink.textBefore ++ " ")
                , a [ href textLink.destination ] [ text textLink.linkText ]
                , text (" " ++ textLink.textAfter)
                ]


toString : Key -> String
toString key =
    case brandCopy key of
        CopyText string ->
            string

        CopyList list ->
            ""

        CopyWithLink textLink ->
            textLink.textBefore ++ " " ++ textLink.linkText ++ " " ++ textLink.textAfter
