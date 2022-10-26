*** Settings ***
Resource   ../../../Commons/Common.resource
*** Variables ***

*** Keywords ***
Redirect Logout
    Verify_Login_Successfully
    Click Element    //span[@id='droplist_user']
    Wait Until Element Is Visible     //a[@id='logout']
    Click Element    //a[@id='logout']
    Sleep    3s