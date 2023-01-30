*** Settings ***
Resource   ../../../Commons/Common.resource

*** Variables ***

*** Keywords ***
# Create Courses
Redirect create course page
    Verify_Login_Successfully
    Click Element    //span[@id='course']
    Wait Until Element Is Visible    //a[@id='create_course']
    Click Element    //a[@id='create_course']
    Sleep    2s

Create course
    [Arguments]     ${name_course}     ${summary_course}    ${content_course}   ${number_of_students}    ${link_image}   ${subject}   ${teacher}          ${opening_schedule}  ${status}
    Input Text     //input[@id='slug']      ${name_course}
    Input Text    //textarea[@name='tomtat']    ${summary_course}
    Input Text    //textarea[@name='noidung']    ${content_course}
    Input Text    //input[@name='Soluonghocvien']  ${number_of_students}
    Choose File  //input[@name='hinhanh']   ${link_image}
    Click Element    //select[@name='id_monhoc']
    Click Element   //option[contains(text(),'${subject}')]
    Click Element    //select[@name='id_giaovien']
    Click Element   //option[contains(text(),'${teacher}')]
    Click Element    //input[@name='lichkhaigiang']
    Input Text   //input[@name='lichkhaigiang']    ${opening_schedule}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    2s
    Click Button    //button[@name='themkhoahoc']

#Update Courses
Redirect edit course page
    [Arguments]     ${locator_course}
    Verify_Login_Successfully
    Click Element    //span[@id='course']
    Wait Until Element Is Visible    //a[@id='list_course']
    Click Element    //a[@id='list_course']
    Click Element    ${locator_course}
    Sleep    2s

Verify data
    [Arguments]     ${name_course}     ${summary_course}    ${content_course}   ${number_of_students}     ${subject}   ${teacher}          ${opening_schedule}  ${status}
    Page Should Contain Element   //input[@value='${name_course}']
    Wait Until Element Contains   //textarea[@name='tomtat']     ${summary_course}
    Wait Until Element Contains   //textarea[@name='noidung']     ${content_course}
    Page Should Contain Element   //input[@value='${number_of_students}']
    Page Should Contain Element   //img[@id='image_post']
    Wait Until Element Contains    //select[@name='id_monhoc']      ${subject}
    Wait Until Element Contains    //select[@name='id_giaovien']    ${teacher}
    Page Should Contain Element   //input[@value='${opening_schedule}']
    Wait Until Element Contains    //select[@name='kichhoat']    ${status}


Update course
    [Arguments]     ${name_course}     ${summary_course}    ${content_course}   ${number_of_students}    ${link_image}   ${subject}   ${teacher}          ${opening_schedule}  ${status}
    Clear Element Text     //input[@id='slug']
    Clear Element Text    //textarea[@name='tomtat']
    Clear Element Text    //textarea[@name='noidung']
    Clear Element Text    //input[@name='Soluonghocvien']
    Input Text     //input[@id='slug']      ${name_course}
    Input Text    //textarea[@name='tomtat']    ${summary_course}
    Input Text    //textarea[@name='noidung']    ${content_course}
    Input Text    //input[@name='Soluonghocvien']  ${number_of_students}
    Choose File  //input[@name='hinhanh']   ${link_image}
    Click Element    //select[@name='id_monhoc']
    Click Element   //option[contains(text(),'${subject}')]
    Click Element    //select[@name='id_giaovien']
    Click Element   //option[contains(text(),'${teacher}')]
    Click Element    //input[@name='lichkhaigiang']
    Input Text   //input[@name='lichkhaigiang']    ${opening_schedule}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]
    Sleep    2s
    Click Button    //button[@name='suakhoahoc']


Check require
    Clear Element Text     //input[@id='slug']
    Clear Element Text    //textarea[@name='tomtat']
    Clear Element Text    //textarea[@name='noidung']
    Clear Element Text    //input[@name='Soluonghocvien']
    Click Button    //button[@name='suakhoahoc']

# Delete Courses
Redirect delete course page
    [Arguments]     ${locator_course}
    Verify_Login_Successfully
    Click Element    //span[@id='course']
    Wait Until Element Is Visible    //a[@id='list_course']
    Click Element    //a[@id='list_course']
    Click Button     ${locator_course}
Delete course
   Handle Alert 	action=ACCEPT   timeout=5s

# Search Courses
Redirect search course page
    Verify_Login_Successfully
    Click Element    //span[@id='course']
    Wait Until Element Is Visible    //a[@id='list_course']
    Click Element    //a[@id='list_course']








