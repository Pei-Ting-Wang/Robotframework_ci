*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Timeout    10s
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://signin-int.visionone.trendmicro.com/
${USERNAME_1}    ol_t2_disti_penny@mailsac.com
${USERNAME_2}    beta_de_reports@mailsac.com
${t1partner}    Beta_JP@mailsac.com
${PASSWORD}    V1MSP@qa

*** Test Cases ***
LMP For Itops
    Open Browser    ${URL}    Chrome
    Wait Until Element Is Visible    //input[@data-test='_IAM_USERNAME_INPUT_']
    Input Text    //input[@data-test='_IAM_USERNAME_INPUT_']    ${USERNAME_1}
    Click Element    //button[@data-test='_IAM_SIGN_IN_BTN_']
    Wait Until Element Is Visible    //input[@data-test='_IAM_PASSWORD_INPUT_']
    Input Text    //input[@data-test='_IAM_PASSWORD_INPUT_']    ${PASSWORD}
    Click Element    //button[text()='Continue']
    Wait Until Element Is Visible    //button[@aria-label='Close']    60s
    Click Element    //button[@aria-label='Close']
    Wait Until Element Is Visible    //button[@aria-label='Close']    60s
    Click Element    //button[@aria-label='Close']
    Wait Until Element Is Visible    //li[@data-pendo='uic_userinfo_4']
    Click Element    //div[@data-menu-id='usage_and_billing']
    Wait Until Element Is Visible    //span[@title='Billing Reports' and @class='sub-menu-item']
    Element Text Should Be           //span[@title='Billing Reports' and @class='sub-menu-item']    Billing Reports
    Close Browser

LMP For MSPC
    Open Browser    ${URL}    Chrome
    Wait Until Element Is Visible    //input[@data-test='_IAM_USERNAME_INPUT_']
    Input Text    //input[@data-test='_IAM_USERNAME_INPUT_']    ${USERNAME_2}
    Click Element    //button[@data-test='_IAM_SIGN_IN_BTN_']
    Wait Until Element Is Visible    //input[@data-test='_IAM_PASSWORD_INPUT_']
    Input Text    //input[@data-test='_IAM_PASSWORD_INPUT_']    ${PASSWORD}
    Click Element    //button[text()='Continue']
    Wait Until Element Is Visible    //button[@aria-label='Close']    60s
    Click Element    //button[@aria-label='Close']
    Wait Until Element Is Visible    //button[@aria-label='Close']    60s
    Click Element    //button[@aria-label='Close']
    Wait Until Element Is Visible    //li[@data-pendo='uic_userinfo_4']
    Click Element    //div[@data-menu-id='usage_and_billing']
    Wait Until Element Is Visible    //span[@title='Licensing Management Platform' and @class='sub-menu-item']
    Element Text Should Be           //span[@title='Licensing Management Platform' and @class='sub-menu-item']    Licensing Management Platform
    Close Browser

Verify Partner Onboarding Date Is Visible
    Open Browser    ${URL}    Chrome
    Wait Until Element Is Visible    //input[@data-test='_IAM_USERNAME_INPUT_']
    Input Text    //input[@data-test='_IAM_USERNAME_INPUT_']    ${t1partner}
    Click Element    //button[@data-test='_IAM_SIGN_IN_BTN_']
    Wait Until Element Is Visible    //input[@data-test='_IAM_PASSWORD_INPUT_']
    Input Text    //input[@data-test='_IAM_PASSWORD_INPUT_']    ${PASSWORD}
    Click Element    //button[text()='Continue']
    Wait Until Element Is Visible    //button[text() ='Sign in']    10s
    Click Element    //button[text() ='Sign in']
    Wait Until Element Is Visible    //button[@aria-label='Close']    10s
    Click Element    //button[@aria-label='Close']
    Wait Until Element Is Visible    //button[@aria-label='Close']    10s
    Click Element    //button[@aria-label='Close']
    Wait Until Element Is Visible    //li[@data-pendo='uic_userinfo_4']
    Click Element    //li[@data-pendo='uic_userinfo_4']
    Click Element    //div[@data-menu-id='usage_and_billing']
    Wait Until Element Is Visible    //span[@title='Licensing Management Platform' and @class='sub-menu-item']
    Click Element    //span[@title='Licensing Management Platform' and @class='sub-menu-item']
    Wait Until Element Is Visible    //iframe[@id='__ACM_APP_CONTAINER']    10s
    Select Frame    //iframe[@id='__ACM_APP_CONTAINER']
    Select Frame   //iframe[@id='loginIframe']
    Wait Until Element Is Visible    //a[@id='endabledpartners']    10s
    Click Element    //a[@id='endabledpartners']
    Wait Until Element Is Visible    //table[@id='datatable']    10s
    ${header_text}=    Get Text    //table[@id='datatable']/thead/tr/th[6]
    Should Be Equal As Strings  ${header_text}    Onboarding Date    
    Unselect Frame
    Close Browser