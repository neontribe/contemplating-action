module Copy.ToHtml exposing (renderCopy)

import Copy.BrandCopy exposing (brandCopy)
import Copy.Keys exposing (Copy(..), Key(..))
import Html exposing (Html, li, text)


renderCopy : Key -> List (Html msg)
renderCopy key =
    case brandCopy key of
        Copy string ->
            [ text string ]

        CopyList list ->
            List.map (\item -> li [] [ text item ]) list
