*** Settings ***
Resource  ../../../Commons/Common.resource

*** Variables ***

*** Keywords ***
Input data
    [Arguments]     ${hoten}    ${email}    ${phone}    ${subject}
    Input Text    //input[@id='name']    ${hoten}
    Input Text    //input[@id='email']    ${email}
    Input Text    //input[@id='phone']    ${phone}
    Input Text    //textarea[@id='message']     ${subject}
    Click Element    //input[@id='submit']

Verify data register
    [Arguments]     ${hoten}    ${email}    ${phone}    ${subject}
    Wait Until Element Contains    //tbody/tr[1]/td[1]    ${hoten}
    Wait Until Element Contains    //tbody/tr[1]/td[2]    ${email}
    Wait Until Element Contains    //tbody/tr[1]/td[3]    ${phone}
    Wait Until Element Contains    //tbody/tr[1]/td[4]    ${subject}

Redirect contacted page
    Verify_Login_Successfully
    Click Element    //span[@id='register_student']
    Wait Until Element Is Visible    //a[@id='not_contacted']
    Click Element    //a[@id='not_contacted']
    Sleep    2s

Redirect not contacted page
    Verify_Login_Successfully
    Click Element    //span[@id='register_student']
    Wait Until Element Is Visible    //a[@id='contacted']
    Click Element    //a[@id='contacted']
    Sleep    2s

Delete register
    Handle Alert 	action=ACCEPT   timeout=5s








