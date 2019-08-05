module Copy.Render exposing (toHtml, toString)

import Copy.BrandCopy exposing (brandCopy)
import Copy.Keys exposing (Copy(..), Key(..))
import Html exposing (Html, li, text, ul)
import Html.Attributes exposing (class)


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


toString : Key -> String
toString key =
    case brandCopy key of
        CopyText string ->
            string

        CopyList list ->
            ""
