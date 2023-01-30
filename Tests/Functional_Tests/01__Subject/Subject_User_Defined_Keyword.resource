*** Settings ***
Resource   ../../../Commons/Common.resource

*** Variables ***

*** Keywords ***
# Create subject
Redirect create subject page
    Verify_Login_Successfully
    Click Element    //span[@id='subject_category']
    Wait Until Element Is Visible     //a[@id='create_subject']
    Click Element    //a[@id='create_subject']
    Sleep    2s

Create subject
    [Arguments]     ${name_subject}     ${summary_subject}    ${status}
    Input Text     //input[@id='slug']      ${name_subject}
    Input Text    //textarea[@name='mota']    ${summary_subject}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    2s
    Click Button    //button[@name='themmonhoc']

# Update subject
Redirect edit subject page
    [Arguments]     ${locator_subject}
    Verify_Login_Successfully
    Click Element    //span[@id='subject_category']
    Wait Until Element Is Visible    //a[@id='list_subject']
    Click Element    //a[@id='list_subject']
    Click Element    ${locator_subject}
    Sleep    2s


Verify data
    [Arguments]      ${name_subject}     ${summary_subject}    ${status}
    Page Should Contain Element   //input[@value='${name_subject}']
    Wait Until Element Contains   //textarea[@name='mota']     ${summary_subject}
    Wait Until Element Contains    //select[@name='kichhoat']    ${status}


Update subject
    [Arguments]     ${name_subject}     ${summary_subject}   ${status}
    Clear Element Text    //input[@id='slug']
    Clear Element Text    //textarea[@name='mota']
    Input Text     //input[@id='slug']      ${name_subject}
    Input Text    //textarea[@name='mota']    ${summary_subject}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    2s
    Click Button    //button[@name='suamonhoc']

Check require
    Clear Element Text    //input[@id='slug']
    Clear Element Text    //textarea[@name='mota']
    Click Button    //button[@name='suamonhoc']

# Delete subject
Redirect delete subject page
    [Arguments]     ${locator_subject}
    Verify_Login_Successfully
    Click Element    //span[@id='subject_category']
    Sleep    2s
    Click Element    //a[@id='list_subject']
    Click Button     ${locator_subject}

Delete subject
   Handle Alert 	action=ACCEPT   timeout=5s

# Search subject
Redirect search subject page
    Verify_Login_Successfully
    Click Element    //span[@id='subject_category']
    Wait Until Element Is Visible    //a[@id='list_subject']
    Click Element    //a[@id='list_subject']







