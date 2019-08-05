module I18n.Translate exposing (Language(..), getString, translate)

import Html exposing (Html, li, text)
import I18n.En exposing (enStrings)
import I18n.Keys exposing (ListKey(..), StringKey(..))


type Language
    = English



getString : StringKey -> String
getString key =
    let
        translator =
            enStrings
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
