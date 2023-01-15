*** Settings ***
Resource    ../../../Commons/Common.resource

*** Keywords ***

Verify_Login_Fail
    [Arguments]     ${username}     ${password}     ${expect}
    Input Text      ${locator_username}        ${username}
    Input Password      ${locator_password}     ${password}
    Click Button    ${locator_button}
    Wait Until Page Contains Element     ${expect}
    Reload Page
    Sleep    2s







