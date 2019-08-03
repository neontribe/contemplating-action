module Copy.ToHtml exposing (renderList, renderString)

import Copy.BrandCopy exposing (brandCopy, enLists)
import Copy.Keys exposing (Key(..), ListKey(..))
import Html exposing (Html, li, text)


renderList : ListKey -> List (Html msg)
renderList key =
    let
        listItems =
            enLists
    in
    List.map (\item -> li [] [ text item ]) (listItems key)


renderString : Key -> List (Html msg)
renderString key =
    let
        copy =
            brandCopy
    in
    [ text (copy key) ]
