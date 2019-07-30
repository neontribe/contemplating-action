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
            "xXx"

        ContentLinkLong ->
            "Find out more"

        ContentLinkMedium ->
            "Find Out More"

        ContentLinkShort ->
            "xXx"

        ContactLinkLong ->
            "hello@contemplatingaction.org.uk"

        ContactLinkShort ->
            "xXx"

        ContactLinkDestination ->
            "mailto:hello@contemplatingaction.org.uk"

        ExitSite ->
            "Exit Site"

        LanguageButton ->
            "xXx"

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
            "xXx"

        PrivacyIntroP ->
            "xXx"

        PrivacyDataCollectH3 ->
            "xXx"

        PrivacyDataCollectP ->
            "xXx"

        PrivacyInfoUsedH3 ->
            "xXx"

        PrivacyInfoUsedP ->
            "xXx"

        PrivacyInfoUsedLi1 ->
            "xXx"

        PrivacyInfoUsedLi2 ->
            "xXx"

        PrivacyInfoUsedLi3 ->
            "xXx"

        PrivacyInfoUsedLi4 ->
            "xXx"

        PrivacyInfoUsedLi5 ->
            "xXx"

        PrivacyInfoSharedH3 ->
            "xXx"

        PrivacyInfoSharedP1 ->
            "xXx"

        PrivacyInfoSharedP2 ->
            "xXx"

        PrivacyInfoSharedP3 ->
            "xXx"

        PrivacyCookiesH3 ->
            "xXx"

        PrivacyCookiesP1 ->
            "xXx"

        PrivacyCookiesP2 ->
            "xXx"

        PrivacyCookiesP3 ->
            "xXx"

        PrivacyCookiesLi1 ->
            "xXx"

        PrivacyCookiesLi2 ->
            "xXx"

        PrivacyCookiesLi3 ->
            "xXx"

        PrivacyCookiesLi4 ->
            "xXx"

        PrivacyTermsH3 ->
            "xXx"

        PrivacyTermsP ->
            "xXx"

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
