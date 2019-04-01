-- Views/Pages/Privacy.elm


module Views.Pages.Privacy exposing (privacyContent)

import Html exposing (Html, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Views.Footer exposing (footerContent)


privacyContent : Html Msg
privacyContent =
    div [ class "section" ]
        [ h2 [] [ text "Contemplating Action Privacy Policy and Cookies" ]
        , div []
            [ p []
                [ text """This policy relates to www.contemplatingaction.org.uk (“the Site”) which is owned by Neontribe ltd and related activity
                    """
                ]
            , ul [ class "company-info" ]
                [ li [] [ text "Neontribe ltd trading as Neontribe" ]
                , li [] [ text "Registered as a limited company in England & Wales" ]
                , li [] [ text "Business registration: 06165574" ]
                , li [] [ text "Registered office: 106 Lincoln St. Norwich, Norfolk, NR2 3LB." ]
                ]
            , h3 [] [ text "What information is collected?" ]
            , p []
                [ text """We collect the following information from people who use this website:
                """
                ]
            , ul [ class "ul--disc" ]
                [ li [] [ text "Email addresses of people who communicate with us via email" ]
                , li [] [ text "Information volunteered by people in the course of using of the website (predominantly survey responses)" ]
                , li [] [ text "Analytics and tracking data about people’s site usage" ]
                ]
            , h3 [] [ text "How is the information used?" ]
            , p []
                [ text "Neontribe uses the information you provide to:"
                ]
            , ul [ class "ul--disc" ]
                [ li [] [ text "Improve the usability of the Site" ]
                , li [] [ text "Help design future projects " ]
                , li [] [ text "Contribute to research about third sector use of digital" ]
                , li [] [ text "Send you any information you have requested relating to the Contemplating Action project " ]
                ]
            , p []
                [ text "If you chose to give us contact details we will only contact you in relation to these four things. You can also tell us if you no longer wish to receive information from Neontribe by replying to any email from us with the subject line Unsubscribe, or sending a message to info@neontribe.co.uk requesting to unsubscribe."
                ]
            , p []
                [ text "Information that is identifiable as relating to you (i.e. it has not been edited to make it anonymous) is not shared with or sold to other organizations for commercial purposes, other than under the following circumstances:"
                ]
            , ul [ class "ul--disc" ]
                [ li [] [ text "If it is necessary to share information in order to investigate, prevent, or take action regarding illegal activities, suspected fraud, situations involving potential threats to the physical safety of any person, violations of Terms of Service, or as otherwise required by law." ]
                , li [] [ text "If we transfer information about you if Neontribe is acquired by or merged with another organisation, other than an organisation established by us and controlled by us." ]
                , li [] [ text "You have explicitly chosen to have us share the information with CAST - the centre for acceleration of social technology whilst giving us the information - in which case it will be freely shared with them." ]
                ]
            , h3 [] [ text "Where is the information stored?" ]
            , ul [ class "ul--disc" ]
                [ li [] [ text "On our computers " ]
                , li [] [ text "On our survey provider Typeform’s servers ()" ]
                , li [] [ text "In google analytics and google drive ()" ]
                , li [] [ text "By our partner CAST on their servers if you have explicitly expressed the desire to share your information with them whilst using our site. ()" ]
                ]
            , h3 [] [ text "Your rights" ]
            , p []
                [ text """We guarantee to meet your rights in compliance with GDPR. Find out about those rights from the ICO: https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/individual-rights/ To exercise any of your rights, please contact us at hello@contemplatingaction.org.uk
                """
                ]
            , h3 [] [ text "Use of cookies" ]
            , p []
                [ text """Cookies are pieces of information that a website transfers to your hard drive. Most web browsers automatically accept cookies, but if you prefer, you can change your browser to prevent that and will still be able to use the site.
                """
                ]
            , p []
                [ text """Contemplating Action uses cookies to:
                """
                ]
            , ul [ class "ul--disc" ]
                [ li [] [ text "Monitor the number of visitors to our website" ]
                , li [] [ text "Monitor how users use our website, i.e. which pages they have accessed" ]
                , li [] [ text "To help improve our website" ]
                , li [] [ text "For more data on Cookies visit www.aboutcookies.org. In addition to detailing extensive information on cookies this site also provides explanations on how to disable cookies on your computer." ]
                ]
            , h3 [] [ text "Your acceptance of these terms" ]
            , p []
                [ text """By using this site, you consent to the collection and use of this information by Neontribe and to our privacy policy. Please send any questions, concerns or comments you have about these policies to info@neontribe.co.uk
                """
                ]
            ]

        -- footer should probably be outside content container but this is easiest for now.
        -- It is conditional on page. Could hide in the story pages with css? But not sure that's any better.
        , footerContent
        ]
