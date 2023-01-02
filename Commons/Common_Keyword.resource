*** Settings ***
Resource    Common.resource

*** Keywords ***
Start Testcase
    Open Browser    ${url_local_admin}   ${browser}
#    Open Browser    ${url_production_admin}   ${browser}
    Maximize Browser Window

Start Testcase Page
    Open Browser    ${url_local_page}  ${browser}
#    Open Browser    ${url_production_page}   ${browser}
    Maximize Browser Window

Finish TestCase
    Close Browser

Verify_Login_Successfully
    Input Text      ${locator_username}        ${data_username}
    Input Password      ${locator_password}     ${data_password}
    Click Button    ${locator_button}
    Wait Until Page Contains    Thống kê số lượng học sinh đăng ký










