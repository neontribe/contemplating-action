module Assets exposing (AssetPath(..), path)


type AssetPath
    = AssetPath String


path : AssetPath -> String
path (AssetPath string) =
    string
