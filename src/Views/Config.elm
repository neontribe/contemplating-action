module Views.Config exposing (appTitle, email, helpline, helplineDisplay)


appTitle : String
appTitle =
    "Pics, stories & info"


email : String
email =
    "katja@neontribe.co.uk"


helpline : String
helpline =
    "0000000000"


helplineDisplay : String
helplineDisplay =
    "0000" ++ "\x00A0" ++ "000" ++ "\x00A0" ++ "000"
