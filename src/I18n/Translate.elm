module I18n.Translate exposing (Language(..), translate)

import I18n.En exposing (enStrings)
import I18n.Keys exposing (Key(..))


type Language
    = English


translate : Language -> Key -> String
translate language key =
    let
        translator =
            case language of
                English ->
                    enStrings
    in
        translator key
