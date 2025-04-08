*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Timeout    10s
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://signin-int.visionone.trendmicro.com/
${ITOPS}    ol_t2_disti_penny@mailsac.com
${MSPC}    beta_de_reports@mailsac.com
${T1PARTNER}    Beta_JP@mailsac.com
${PASSWORD}    V1MSP@qa

*** Keywords ***
Login To Application
    [Arguments]    ${username}
    Open Browser    ${URL}    Chrome
    Wait Until Element Is Visible    //input[@data-test='_IAM_USERNAME_INPUT_']
    Input Text    //input[@data-test='_IAM_USERNAME_INPUT_']    ${username}
    Click Element    //button[@data-test='_IAM_SIGN_IN_BTN_']
    Wait Until Element Is Visible    //input[@data-test='_IAM_PASSWORD_INPUT_']
    Input Text    //input[@data-test='_IAM_PASSWORD_INPUT_']    ${PASSWORD}
    Click Element    //button[text()='Continue']

Handle Popups
    Wait Until Element Is Visible    //button[@aria-label='Close']    60s
    Click Element    //button[@aria-label='Close']
    Wait Until Element Is Visible    //button[@aria-label='Close']    60s
    Click Element    //button[@aria-label='Close']

Navigate To Usage And Billing
    Wait Until Element Is Visible    //li[@data-pendo='uic_userinfo_4']
    Click Element    //div[@data-menu-id='usage_and_billing']

*** Test Cases ***
LMP For Itops
    Login To Application    ${ITOPS}
    Handle Popups
    Navigate To Usage And Billing
    Wait Until Element Is Visible    //span[@title='Billing Reports' and @class='sub-menu-item']
    Element Text Should Be           //span[@title='Billing Reports' and @class='sub-menu-item']    Billing Reports
    Close Browser

LMP For MSPC
    Login To Application    ${MSPC}
    Handle Popups
    Navigate To Usage And Billing
    Wait Until Element Is Visible    //span[@title='Licensing Management Platform' and @class='sub-menu-item']
    Element Text Should Be           //span[@title='Licensing Management Platform' and @class='sub-menu-item']    Licensing Management Platform
    Close Browser

Verify Partner Onboarding Date Is Visible
    Login To Application    ${T1PARTNER}
    Wait Until Element Is Visible    //button[text() ='Sign in']    10s
    Click Element    //button[text() ='Sign in']
    Handle Popups
    Navigate To Usage And Billing
    Wait Until Element Is Visible    //span[@title='Licensing Management Platform' and @class='sub-menu-item']
    Click Element    //span[@title='Licensing Management Platform' and @class='sub-menu-item']
    Wait Until Element Is Visible    //iframe[@id='__ACM_APP_CONTAINER']    10s
    Select Frame    //iframe[@id='__ACM_APP_CONTAINER']
    Select Frame    //iframe[@id='loginIframe']
    Wait Until Element Is Visible    //a[@id='endabledpartners']    10s
    Click Element    //a[@id='endabledpartners']
    Wait Until Element Is Visible    //table[@id='datatable']    10s
    ${header_text}=    Get Text    //table[@id='datatable']/thead/tr/th[6]
    Should Be Equal As Strings    ${header_text}    Onboarding Date    
    Unselect Frame
    Close Browser
