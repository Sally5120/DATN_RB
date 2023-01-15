*** Settings ***
Resource  ../../../Commons/Common.resource

*** Variables ***

*** Keywords ***


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








