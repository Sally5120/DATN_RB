*** Settings ***
Resource    Common.resource

*** Keywords ***
Open Admin Site Using Chrome Browser
#     Open Browser    ${url_dev_admin}    ${browser}
    Open Browser    ${url_production_admin}   ${browser}

    Maximize Browser Window

Open User Site Using Chrome Browser
#    Open Browser    ${url_dev_page}   ${browser}
    Open Browser    ${url_production_page}   ${browser}
    Maximize Browser Window

Close Website
    Close Browser

Verify_Login_Successfully
    Input Text      ${locator_username}        ${data_username}
    Input Password      ${locator_password}     ${data_password}
    Click Button    ${locator_button}
    Wait Until Page Contains    Thống kê số lượng học sinh đăng ký










