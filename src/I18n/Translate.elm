module I18n.Translate exposing (Language(..), getString, renderList, translate)

import Html exposing (Html, li, text)
import I18n.En exposing (enLists, enStrings)
import I18n.Keys exposing (ListKey(..), StringKey(..))


type Language
    = English


renderList : ListKey -> List (Html msg)
renderList key =
    let listItems = enLists
    in List.map (\item -> li [] [ text "list" ]) (listItems key)

getString : StringKey -> String
getString key =
    let
        translator = enStrings
    in
    translator key

translate : Language -> StringKey -> String
translate language key =
    let
        translator =
            case language of
                English ->
                    enStrings
    in
    translator key
