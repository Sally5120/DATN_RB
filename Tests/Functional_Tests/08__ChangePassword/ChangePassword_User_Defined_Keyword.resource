*** Settings ***
Resource   ../../../Commons/Common.resource
*** Variables ***
${locator_password_new}         //input[@name="matkhaumoi"]
${locator_re_enter_password}    //input[@name="nhaplai"]
${locator_password_old}         //input[@name="matkhaucu"]
${locator_button_password}      //button[contains(text(),'Đổi mật khẩu')]
*** Keywords ***
Redirect Change Password page
    Verify_Login_Successfully
    Click Element    //span[@id='droplist_user']
    Wait Until Element Is Visible     //a[@id='change_password']
    Click Element    //a[@id='change_password']
    Sleep    2s
Input data
    [Arguments]     ${password_new}     ${re_enter_password}     ${password_old}
    Input Password      ${locator_password_new}     ${password_new}
    Input Password      ${locator_re_enter_password}     ${re_enter_password}
    Input Password      ${locator_password_old}     ${password_old}
    Sleep    2s
    Click Button        ${locator_button_password}







