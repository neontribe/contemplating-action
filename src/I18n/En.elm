module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        SiteTitle ->
            "Contemplating Action"

        AppTitle ->
            "Contemplating Action"

        CallToActionDestination ->
            "https://contemplating-action.typeform.com/to/zUOTYA"

        CallToActionDestinationDisplay ->
            ""

        CallToActionLong ->
            "Take part in our survey"

        CallToActionShort ->
            "Survey"

        ContentLinkLong ->
            "Find out more"

        ContentLinkMedium ->
            "Find Out More"

        ContentLinkShort ->
            "Find Out More"

        ContactLinkLong ->
            "hello@contemplatingaction.org.uk"

        ContactLinkShort ->
            "Email"

        ContactLinkDestination ->
            "mailto:hello@contemplatingaction.org.uk"

        ExitSite ->
            "Exit Site"

        IconCallToAction ->
            "check-square-o"

        IconStories ->
            "question-circle-o"

        IconContact ->
            "envelope"

        IconExit ->
            "exit-door"

        HomeReadAboutH2 ->
            "A project exploring how to encourage people to seek support. Can visual stories help change lives?"

        HomeBannerImageAlt ->
            "A description of banner image."

        HomeTalkToSomeoneH2 ->
            "Breaking down fears and barriers."

        HomeP1 ->
            "This is a demonstration version of a web app we believe could be used by different organisations to encourage people to use a helpline or web chat or text service. We believe that reassuring people that their fears and challenges are shared will help them take early steps on a journey of change. In a live app the information in this section would be additional information about the organisation and it’s support services for people who did not follow the direct link to the stories."

        HomeLinkDisplay ->
            "Read in depth about this project"

        HomeLinkDestination ->
            "https://neontribe.co.uk/contemplating-action"

        HomeP2 ->
            "This space is used to give a reminder about what to do in a crisis or high risk situation when the app is not the right support."

        -- Privacy Page
        PrivacyTitleH2 ->
            "Contemplating Action Privacy Policy and Cookies"

        PrivacyIntroP ->
            "This policy relates to www.contemplatingaction.org.uk (“the Site”) which is owned by Neontribe ltd and related activity "

        PrivacyCompanyInfoLi1 ->
            "Neontribe ltd trading as Neontribe"

        PrivacyCompanyInfoLi2 ->
            "Registered as a limited company in England & Wales"

        PrivacyCompanyInfoLi3 ->
            "Business registration: 06165574"

        PrivacyCompanyInfoLi4 ->
            "Registered office: 106 Lincoln St. Norwich, Norfolk, NR2 3LB."

        PrivacyDataCollectH3 ->
            "What information is collected?"

        PrivacyDataCollectP ->
            "We collect the following information from people who use this website:"

        PrivacyDataCollectLi1 ->
            "Email addresses of people who communicate with us via email"

        PrivacyDataCollectLi2 ->
            "Information volunteered by people in the course of using of the website (predominantly survey responses)"

        PrivacyDataCollectLi3 ->
            "Analytics and tracking data about people’s site usage"

        PrivacyInfoUsedH3 ->
            "How is the information used?"

        PrivacyInfoUsedP ->
            "Neontribe uses the information you provide to:"

        PrivacyInfoUsedLi1 ->
            "Improve the usability of the Site"

        PrivacyInfoUsedLi2 ->
            "Help design future projects "

        PrivacyInfoUsedLi3 ->
            "Contribute to research about third sector use of digital"

        PrivacyInfoUsedLi4 ->
            "Send you any information you have requested relating to the Contemplating Action project"

        PrivacyInfoSharedH3 ->
            ""

        PrivacyInfoSharedP1 ->
            "If you chose to give us contact details we will only contact you in relation to these four things. You can also tell us if you no longer wish to receive information from Neontribe by replying to any email from us with the subject line Unsubscribe, or sending a message to info@neontribe.co.uk requesting to unsubscribe."

        PrivacyInfoSharedP2 ->
            "Information that is identifiable as relating to you (i.e. it has not been edited to make it anonymous) is not shared with or sold to other organizations for commercial purposes, other than under the following circumstances:"

        PrivacyInfoSharedLi1 ->
            "If it is necessary to share information in order to investigate, prevent, or take action regarding illegal activities, suspected fraud, situations involving potential threats to the physical safety of any person, violations of Terms of Service, or as otherwise required by law."

        PrivacyInfoSharedLi2 ->
            "If we transfer information about you if Neontribe is acquired by or merged with another organisation, other than an organisation established by us and controlled by us."

        PrivacyInfoSharedLi3 ->
            "You have explicitly chosen to have us share the information with CAST - the centre for acceleration of social technology whilst giving us the information - in which case it will be freely shared with them."

        PrivacyInfoStoredH3 ->
            "Where is the information stored?"

        PrivacyInfoStoredLi1 ->
            "On our computers"

        PrivacyInfoStoredLi2 ->
            "On our survey provider Typeform’s servers. For more information see Typeform's privacy policy."

        PrivacyInfoStoredLi3 ->
            "In Google Analytics. For more information see Google's privacy policy."

        PrivacyInfoStoredLi4 ->
            "By our partner CAST on their servers if you have explicitly expressed the desire to share your information with them whilst using our site. For more information see CAST's privacy policy."

        PrivacyRightsH3 ->
            "Your rights"

        PrivacyRightsP ->
            "We guarantee to meet your rights in compliance with GDPR. Find out about those rights from the ICO GDPR indvidual rights guide. To exercise any of your rights, please contact us at hello@contemplatingaction.org.uk"

        PrivacyCookiesH3 ->
            "Use of cookies"

        PrivacyCookiesP1 ->
            "Cookies are pieces of information that a website transfers to your hard drive. Most web browsers automatically accept cookies, but if you prefer, you can change your browser to prevent that and will still be able to use the site. "

        PrivacyCookiesP2 ->
            "Contemplating Action uses cookies to:"

        PrivacyCookiesLi1 ->
            "Monitor the number of visitors to our website"

        PrivacyCookiesLi2 ->
            "Monitor how users use our website, i.e. which pages they have accessed"

        PrivacyCookiesLi3 ->
            "To help improve our website"

        PrivacyCookiesLi4 ->
            "For more data on Cookies visit www.aboutcookies.org. In addition to detailing extensive information on cookies this site also provides explanations on how to disable cookies on your computer."

        PrivacyTermsH3 ->
            "Your acceptance of these terms"

        PrivacyTermsP ->
            "By using this site, you consent to the collection and use of this information by Neontribe and to our privacy policy. Please send any questions, concerns or comments you have about these policies to info@neontribe.co.uk "

        -- Supporters Page
        SupportersTitleH2 ->
            "Our Supporters"

        SupportersP1 ->
            "This page, available in the landing page footer, allows organisations to thank their partners."

        SupportersP2 ->
            "We are grateful to all the partners that have made this project possible."

        CastLogoAlt ->
            "CAST"

        ComicReliefLogoAlt ->
            "Comic Relief"

        DepartmentForCultureLogoAlt ->
            "Department for Culture Media & Sport"

        BigLotteryLogoAlt ->
            "Big Lottery Fund"

        SupportersP3 ->
            "Contemplating Action is a partnership with CAST - Centre for Acceleration of Social Technology."

        SupportersP4 ->
            "The initial You Matter app which inspired Contemplating Action was part of Tech vs Abuse. This grant was funded through a joint funding initiative between the Tampon Tax Fund, a partnership between HM Government and Comic Relief, and the Big Lottery Fund."

        NeontribeLogoAlt ->
            "Neontribe"

        HavenLogoAlt ->
            "The Haven Wolverhampton"

        SupportersP5 ->
            "This website has been developed by Neontribe and The Haven, together with women who have been victims of domestic abuse. The Haven is a Wolverhampton based charity which supports women and dependent children who are vulnerable to domestic violence, homelessness and abuse."

        FooterSupportersText ->
            "Find out about our"

        FooterSupportersLink ->
            "supporters"

        FooterPrivacyText ->
            "Read our"

        FooterPrivacyLink ->
            "privacy policy"

        FooterRegisteredText ->
            ""

        FooterCopyrightLink ->
            "neontribe.co.uk"

        InfoTitleH2 ->
            "Information to help you"

        InfoLikeMoreInfoLink ->
            "I'd like some more information"

        InfoLikeOtherInfoLink ->
            "I'd like some other information"

        InfoOtherInfoLink ->
            "Other information to help you"

        InfoNotFoundName ->
            "Not found"

        InfoNotFoundP1 ->
            "We can't find a page with that title, sorry."

        InfoNotFoundP2 ->
            "Please use the 'Other information to help you' page to see if we have the topic you are looking for."

        InfoCallName ->
            "xXx"

        InfoCallP1 displayNumber ->
            "xXx"

        InfoCallP2 ->
            "xXx"

        InfoImmigrationName ->
            "xXx"

        InfoImmigrationP1 displayNumber ->
            "xXx"

        InfoLeavingName ->
            "xXx"

        InfoLeavingP1 ->
            "xXx"

        InfoLeavingP2 ->
            "xXx"

        InfoLeavingP3 displayNumber ->
            "xXx"

        InfoSocialServicesName ->
            "xXx"

        InfoSocialServicesP1 ->
            "xXx"

        InfoSocialServicesP2 ->
            "xXx"

        InfoSocialServicesP3 ->
            "xXx"

        InfoMoneyName ->
            "xXx"

        InfoMoneyP1 ->
            "xXx"

        InfoMoneyP2 displayNumber ->
            "xXx"

        InfoPoliceName ->
            "xXx"

        InfoPoliceP1 ->
            "xXx"

        InfoPoliceP2 ->
            "xXx"

        InfoPoliceP3 ->
            "xXx"

        StoriesTitleH2 ->
            "Stories"

        StoriesTeaserMoreLink title ->
            "See " ++ title ++ "'s Story"

        StoryCardH3 cardId ->
            "Part " ++ String.fromInt cardId ++ " of 4"

        StoryCardStartJourneyPrompt ->
            "Every story is different. Let us help you discover yours."

        StoryNotFoundTitle ->
            "Not found Title"

        StoryNotFoundTeaser ->
            "Not found teaser"

        StoryNotFoundQuote ->
            "Not Found Quote"

        StoryNotFoundImageAlt ->
            "Not found Image"

        StoryNotFoundMessage ->
            "Not found Message"

        StoryOneTitle ->
            "Our Project"

        StoryOneTeaser ->
            "This shows you how we believe shaping stories from real people can work so that they help people feel ready to take action"

        StoryOneTeaserImageAlt ->
            "A man kneeling on the floor of a dark room with his head in his hands"

        StoryOne1Quote ->
            "The story starts with some background. It gives us key pieces of information that make this person’s story clear and relatable. It tends to deal with facts about the situation they were in rather than their feelings. It is always a situation that clearly needed to change."

        StoryOne1ImageAlt ->
            "A man is kneeling on the floor of a dark room with his head in his hands"

        StoryOne2Quote ->
            "Next the story moves on a little. It does one of two things. Either it tells us about a specific incident that began a drive to change things, or it explores the person’s fears and other things that were holding them back. This section focuses on emotions and helps us connect with the person’s story."

        StoryOne2ImageAlt ->
            "The man looks up a long staircase with a locked door at the top"

        StoryOne2Message ->
            "This bar is used to give a little extra insight into how the person was feeling."

        StoryOne3Quote ->
            "Here the story starts to change for the better. The person becomes able to take a positive step and get some support. The story tells us a little about what happened, how they managed to take the step and how they felt."

        StoryOne3ImageAlt ->
            "The man starts climbing the stairs to reach a hand holding out a key."

        StoryOne4Quote ->
            "The final section of the story is about hope. It shows that taking a chance can be a positive choice. However it doesn’t suggest that the person’s life is now perfect. It is designed to encourage others to believe they could make a move to a more hopeful place too. It takes care not to sound out of reach."

        StoryOne4ImageAlt ->
            "The door is open and the lock is on the floor. The man is outside in a bright and sunny environment holding onto the key."

        StoryOne4Message ->
            "sometimes the story highlights a worry that remains, and how the person is coping with it"

        StoryTwoTitle ->
            "The Haven"

        StoryTwoTeaser ->
            "This is one of the six stories created for The Haven’s app. The story uses Two’s words but the names have been changed, and the story has been shaped to help others."

        StoryTwoTeaserImageAlt ->
            "A pregnant woman wrapped in chains"

        StoryTwo1Quote ->
            """I was born in Senegal and had lived in Spain as well as the UK and I couldn’t
            speak English. My husband became abusive after I got pregnant with our first
            child. For years I suffered so many different things."""

        StoryTwo1ImageAlt ->
            "A pregnant woman wrapped in chains"

        StoryTwo2Quote ->
            """I wanted to leave, but my husband told me without him I would be sent back to
            Africa. I was completely dependent on my husband, I did not see any way out of
            my situation."""

        StoryTwo2ImageAlt ->
            "A pregnant woman chained to her husband"

        StoryTwo2Message ->
            "I did not know my rights in the UK and had no money but soon I discovered I had choices."

        StoryTwo3Quote ->
            """One day I broke down at my health care class. My teacher was so supportive. She
            told me about The Haven and they found me a support worker who spoke Spanish. They
            talked to social services for me and found me an immigration solicitor."""

        StoryTwo3ImageAlt ->
            "A woman crying at a desk"

        StoryTwo4Quote ->
            """I have a house now, with my children, and away from my abusive husband. My
            solicitor is helping me with immigration documents and divorce papers. For the
            first time in a long time I can sleep and look forward to the future."""

        StoryTwo4ImageAlt ->
            "A smiling woman with two children"
