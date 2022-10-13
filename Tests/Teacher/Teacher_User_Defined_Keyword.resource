*** Settings ***
Resource   ../../Commons/Common.resource

*** Variables ***

*** Keywords ***
#Create
Redirect create teacher page
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Wait Until Element Is Visible     //a[@id='create_teacher']
    Click Element    //a[@id='create_teacher']
    Sleep    3s

Create teacher
    [Arguments]     ${name_teacher}     ${summary_teacher}  ${content_teacher}     ${link_image}   ${status}
    Input Text     //input[@id='slug']      ${name_teacher}
    Input Text    //textarea[@name='tomtat']    ${summary_teacher}
    Input Text    //textarea[@name='thongtin']    ${content_teacher}
    Choose File  //input[@name='hinhanh']   ${link_image}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    3s
    Click Button    //button[@name='themgiaovien']

#Update
Redirect edit teacher page
    [Arguments]     ${locator_teacher}
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Wait Until Element Is Visible     //a[@id='list_teacher']
    Click Element    //a[@id='list_teacher']
    Click Element    ${locator_teacher}
    Sleep    3s

Verify data
    [Arguments]     ${name_teacher}   ${summary_teacher}  ${content_teacher}     ${status}
    Page Should Contain Element   //input[@value='${name_teacher}']
    Wait Until Element Contains   //textarea[@name='tomtat']     ${summary_teacher}
    Wait Until Element Contains   //textarea[@name='thongtin']     ${content_teacher}
    Page Should Contain Element   //img[@id='image_teacher']
    Wait Until Element Contains    //select[@name='kichhoat']    ${status}


Update teacher
    [Arguments]     ${name_teacher}     ${summary_teacher}  ${content_teacher}     ${link_image}   ${status}
    Clear Element Text    //input[@id='slug']
    Clear Element Text    //textarea[@name='tomtat']
    Clear Element Text    //textarea[@name='thongtin']
    Input Text     //input[@id='slug']      ${name_teacher}
    Input Text    //textarea[@name='tomtat']    ${summary_teacher}
    Input Text    //textarea[@name='thongtin']    ${content_teacher}
    Choose File  //input[@name='hinhanh']   ${link_image}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    3s
    Click Button    //button[@name='update_teacher']

Check require
    Clear Element Text    //input[@id='slug']
    Clear Element Text    //textarea[@name='tomtat']
    Clear Element Text    //textarea[@name='thongtin']
    Click Button    //button[@name='update_teacher']

#Delete
Redirect delete teacher page
    [Arguments]     ${locator_teacher}
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Sleep    3s
    Click Element    //a[@id='list_teacher']
    Click Button     ${locator_teacher}
Delete teacher
   Handle Alert 	action=ACCEPT   timeout=5s

#Search
Redirect search teacher page
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Wait Until Element Is Visible     //a[@id='list_teacher']
    Click Element    //a[@id='list_teacher']
    Sleep    3s






