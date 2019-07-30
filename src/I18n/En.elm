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
            "xXx"

        InfoLikeMoreInfoLink ->
            "xXx"

        InfoLikeOtherInfoLink ->
            "xXx"

        InfoOtherInfoLink ->
            "xXx"

        InfoNotFoundName ->
            "xXx"

        InfoNotFoundP1 ->
            "xXx"

        InfoNotFoundP2 ->
            "xXx"

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
            "xXx"

        StoriesTeaserMoreLink title ->
            "xXx"

        StoryCardH3 cardId ->
            "xXx"

        StoryCardStartJourneyPrompt ->
            "xXx"

        StoryNotFoundTitle ->
            "xXx"

        StoryNotFoundTeaser ->
            "xXx"

        StoryNotFoundQuote ->
            "xXx"

        StoryNotFoundImageAlt ->
            "xXx"

        StoryNotFoundMessage ->
            "xXx"

        StoryMelissaTitle ->
            "xXx"

        StoryMelissaTeaser ->
            "xXx"

        StoryMelissaTeaserImageAlt ->
            "xXx"

        StoryMelissa1Quote ->
            "xXx"

        StoryMelissa1ImageAlt ->
            "xXx"

        StoryMelissa1Message ->
            "xXx"

        StoryMelissa2Quote ->
            "xXx"

        StoryMelissa2ImageAlt ->
            "xXx"

        StoryMelissa3Quote ->
            "xXx"

        StoryMelissa3ImageAlt ->
            "xXx"

        StoryMelissa3Message ->
            "xXx"

        StoryMelissa4Quote ->
            "xXx"

        StoryMelissa4ImageAlt ->
            "xXx"

        StoryMelissa4Message ->
            "xXx"

        StoryAmaTitle ->
            "xXx"

        StoryAmaTeaser ->
            "xXx"

        StoryAmaTeaserImageAlt ->
            "xXx"

        StoryAma1Quote ->
            "xXx"

        StoryAma1ImageAlt ->
            "xXx"

        StoryAma2Quote ->
            "xXx"

        StoryAma2ImageAlt ->
            "xXx"

        StoryAma2Message ->
            "xXx"

        StoryAma3Quote ->
            "xXx"

        StoryAma3ImageAlt ->
            "xXx"

        StoryAma4Quote ->
            "xXx"

        StoryAma4ImageAlt ->
            "xXx"

        StoryRebeccaTitle ->
            "xXx"

        StoryRebeccaTeaser ->
            "xXx"

        StoryRebeccaTeaserImageAlt ->
            "xXx"

        StoryRebecca1Quote ->
            "xXx"

        StoryRebecca1ImageAlt ->
            "xXx"

        StoryRebecca1Message ->
            "xXx"

        StoryRebecca2Quote ->
            "xXx"

        StoryRebecca2ImageAlt ->
            "xXx"

        StoryRebecca2Message ->
            "xXx"

        StoryRebecca3Quote ->
            "xXx"

        StoryRebecca3ImageAlt ->
            "xXx"

        StoryRebecca3Message ->
            "xXx"

        StoryRebecca4Quote ->
            "xXx"

        StoryRebecca4ImageAlt ->
            "xXx"

        StoryTinaTitle ->
            "xXx"

        StoryTinaTeaser ->
            "xXx"

        StoryTinaTeaserImageAlt ->
            "xXx"

        StoryTina1Quote ->
            "xXx"

        StoryTina1ImageAlt ->
            "xXx"

        StoryTina2Quote ->
            "xXx"

        StoryTina2ImageAlt ->
            "xXx"

        StoryTina2Message ->
            "xXx"

        StoryTina3Quote ->
            "xXx"

        StoryTina3ImageAlt ->
            "xXx"

        StoryTina3Message ->
            "xXx"

        StoryTina4Quote ->
            "xXx"

        StoryTina4ImageAlt ->
            "xXx"

        StoryTina4Message ->
            "xXx"

        StoryHeleneTitle ->
            "xXx"

        StoryHeleneTeaser ->
            "xXx"

        StoryHeleneTeaserImageAlt ->
            "xXx"

        StoryHelene1Quote ->
            "xXx"

        StoryHelene1ImageAlt ->
            "xXx"

        StoryHelene2Quote ->
            "xXx"

        StoryHelene2ImageAlt ->
            "xXx"

        StoryHelene2Message ->
            "xXx"

        StoryHelene3Quote ->
            "xXx"

        StoryHelene3ImageAlt ->
            "xXx"

        StoryHelene4Quote ->
            "xXx"

        StoryHelene4ImageAlt ->
            "xXx"

        StoryEmmaTitle ->
            "xXx"

        StoryEmmaTeaser ->
            "xXx"

        StoryEmmaTeaserImageAlt ->
            "xXx"

        StoryEmma1Quote ->
            "xXx"

        StoryEmma1ImageAlt ->
            "xXx"

        StoryEmma1Message ->
            "xXx"

        StoryEmma2Quote ->
            "xXx"

        StoryEmma2ImageAlt ->
            "xXx"

        StoryEmma2Message ->
            "xXx"

        StoryEmma3Quote ->
            "xXx"

        StoryEmma3ImageAlt ->
            "xXx"

        StoryEmma3Message ->
            "xXx"

        StoryEmma4Quote ->
            "xXx"

        StoryEmma4ImageAlt ->
            "xXx"

        StoryAmirahTitle ->
            "xXx"

        StoryAmirahTeaser ->
            "xXx"

        StoryAmirahTeaserImageAlt ->
            "xXx"

        StoryAmirah1Quote ->
            "xXx"

        StoryAmirah1ImageAlt ->
            "xXx"

        StoryAmirah2Quote ->
            "xXx"

        StoryAmirah2ImageAlt ->
            "xXx"

        StoryAmirah2Message ->
            "xXx"

        StoryAmirah3Quote ->
            "xXx"

        StoryAmirah3ImageAlt ->
            "xXx"

        StoryAmirah3Message ->
            "xXx"

        StoryAmirah4Quote ->
            "xXx"

        StoryAmirah4ImageAlt ->
            "xXx"
