*** Settings ***
Resource   ../../../Commons/Common.resource

*** Variables ***

*** Keywords ***
#Create
Redirect create new page
    Verify_Login_Successfully
    Click Element    //span[@id='new_category']
    Wait Until Element Is Visible     //a[@id='create_new']
    Click Element    //a[@id='create_new']
    Sleep    3s

Create new
    [Arguments]     ${name_new}     ${summary_new}  ${content_new}     ${link_image}   ${status}
    Input Text     //input[@id='slug']      ${name_new}
    Input Text    //textarea[@name='tomtat']    ${summary_new}
    Input Text    //textarea[@name='noidung']    ${content_new}
    Choose File  //input[@name='hinhanh']   ${link_image}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    3s
    Click Button    //button[@name='themtintuc']

#Update
Redirect edit new page
    [Arguments]     ${locator_new}
    Verify_Login_Successfully
    Click Element    //span[@id='new_category']
    Wait Until Element Is Visible    //a[@id='list_new']
    Click Element    //a[@id='list_new']
    Click Element    ${locator_new}
    Sleep    3s


Verify data
   [Arguments]     ${name_new}   ${summary_new}  ${content_new}     ${status}
    Page Should Contain Element   //input[@value='${name_new}']
    Wait Until Element Contains   //textarea[@name='tomtat']     ${summary_new}
    Wait Until Element Contains   //textarea[@name='noidung']     ${content_new}
    Page Should Contain Element   //img[@id='image_new']
    Wait Until Element Contains    //select[@name='kichhoat']    ${status}


Update new
    [Arguments]     ${name_new}     ${summary_new}  ${content_new}     ${link_image}   ${status}
    Clear Element Text    //input[@id='slug']
    Clear Element Text    //textarea[@name='tomtat']
    Clear Element Text    //textarea[@name='noidung']
    Input Text     //input[@id='slug']      ${name_new}
    Input Text    //textarea[@name='tomtat']    ${summary_new}
    Input Text    //textarea[@name='noidung']    ${content_new}
    Choose File  //input[@name='hinhanh']   ${link_image}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    3s
    Click Button    //button[@name='suatintuc']

Check require
    Clear Element Text    //input[@id='slug']
    Clear Element Text    //textarea[@name='tomtat']
    Clear Element Text    //textarea[@name='noidung']
    Click Button    //button[@name='suatintuc']

#Delete
Redirect delete new page
    [Arguments]     ${locator_new}
    Verify_Login_Successfully
    Click Element    //span[@id='new_category']
    Sleep    3s
    Click Element    //a[@id='list_new']
    Click Button     ${locator_new}
Delete new
   Handle Alert 	action=ACCEPT   timeout=5s

#Search
Redirect search new page
    Verify_Login_Successfully
    Click Element    //span[@id='new_category']
    Wait Until Element Is Visible     //a[@id='list_new']
    Click Element    //a[@id='list_new']
    Sleep    3s



