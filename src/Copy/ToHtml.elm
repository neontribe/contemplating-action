module Copy.ToHtml exposing (renderCopy)

import Copy.BrandCopy exposing (brandCopy)
import Copy.Keys exposing (Copy(..), Key(..))
import Html exposing (Html, li, text, ul)
import Html.Attributes exposing (class)


renderCopy : Key -> Html msg
renderCopy key =
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
