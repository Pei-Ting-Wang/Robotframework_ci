*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://ie85v.login-tmp.trendmicro.com/authenticate/operator/false
${USERNAME}       Admin
${PASSWORD}       V1MSP@qa
${SUBTITLE}       Update to Trend Vision One for Service Providers
${CONTENT}        Trend Vision One for Service Providers offers valuable insight into your customers' security posture, discovers and prioritizes asset vulnerabilities, and minimizes their organizational risk exposure. With advanced XDR capabilities, this unified solution enables incident response and threat hunting using detection models, event correlation, and data analysis. Trend Vision One for Service Providers also enables automation and management of detection and response processes seamlessly across the endpoint, data, identity, mobile, cloud, network, and email layers of your customers' environments.
${UPDATE_TEXT}    By continuing with the update, you gain access to Trend Vision One for Service Providers.\nBefore updating, please note the following:\nThe update is irreversible.\nYou must update your administrator account to email address format.\nOther administrator accounts must update their accounts to email address format on their next sign-in to Licensing Management Platform.\nYour existing Remote Manager and Licensing Management Platform are embedded in the Trend Vision One for Service Providers console.\nThe Trend Vision One for Service Providers console appears in dark mode and is available in English only.

*** Test Cases ***
Promotion Banner
    Open Browser    ${URL}    Chrome      
    Input Text      class = input_username    ${USERNAME}
    Input Text      class = input_password    ${PASSWORD}
    Click Button    id=btn_logon
    Wait Until Page Contains Element    class=PromotionBanner-banner-action-btn    10s
    Click Button    class=PromotionBanner-banner-action-btn
    ${subtitle_text}=  Get Text    class=PromotionBanner-modal-subtitle
    ${content_text}=  Get Text    //div[@class='PromotionBanner-modal-content']/p
    Should Be Equal As Strings    ${subtitle_text}    ${SUBTITLE}
    Should Be Equal As Strings    ${content_text}    ${CONTENT}
    Click Button    //button[@data-track='licensing-management-platform_promotion-modal-upgrade-now-btn']
    ${html_text}=   Get Text    //div[@class='PromotionBanner-confirmation-modal-content']
    Log             {html_text}
    Should Be Equal As Strings    ${html_text}    ${UPDATE_TEXT}
    Close Browser
