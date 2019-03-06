-- Views/Pages/Supporters.elm


module Views.Pages.Supporters exposing (supportersContent)

import Assets exposing (AssetPath(..), path)
import Html exposing (Html, div, h2, img, p, text)
import Html.Attributes exposing (alt, class, href, src)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


supportersContent : Html Msg
supportersContent =
    div [ class " section section--lighter" ]
        [ div []
            [ h2 [] [ text "Our Supporters" ]
            , p [] [ text "We are grateful to all the partners that have made this project possible." ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo", src (path (AssetPath "supporters_logos/Castlogo.png")), alt "Cast Logo" ] []
                ]
            , p [] [ text "Contemplating Action is a partnership with CAST - Centre for Acceleration of Social Technology." ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo", src (path (AssetPath "supporters_logos/comicrelief.svg")), alt "Comic Relief" ] []
                , img [ class "supporter--logo", src (path (AssetPath "supporters_logos/DCMSlogo.svg")), alt "Department for Culture Media & Sport" ] []
                , img [ class "supporter--logo", src (path (AssetPath "supporters_logos/biglottery.svg")), alt "Big Lottery Fund" ] []
                ]
            , p [] [ text "The initial You Matter app which inspired Contemplating Action was part of Tech vs Abuse. This grant was funded through a joint funding initiative between the Tampon Tax Fund, a partnership between HM Government and Comic Relief, and the Big Lottery Fund." ]
            , div [ class "supporter--logo-group" ]
                [ img [ class "supporter--logo", src (path (AssetPath "supporters_logos/neontribelogo.svg")), alt "Neontribe" ] []
                , img [ class "supporter--logo", src (path (AssetPath "supporters_logos/havenlogo.svg")), alt "The Haven Wolverhampton" ] []
                ]
            , p [] [ text "This website has been developed by Neontribe and The Haven, together with women who have been victims of domestic abuse. The Haven is a Wolverhampton based charity which supports women and dependent children who are vulnerable to domestic violence, homelessness and abuse." ]
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent
        ]
