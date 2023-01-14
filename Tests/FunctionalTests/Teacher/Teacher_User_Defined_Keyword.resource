*** Settings ***
Resource   ../../../Commons/Common.resource

*** Variables ***

*** Keywords ***
#Create
create teacher page is open
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Wait Until Element Is Visible     //a[@id='create_teacher']
    Click Element    //a[@id='create_teacher']
    Sleep    3s

input data create teacher
    [Arguments]     ${name_teacher}     ${summary_teacher}  ${content_teacher}     ${link_image}   ${status}
    Input Text     //input[@id='slug']      ${name_teacher}
    Input Text    //textarea[@name='tomtat']    ${summary_teacher}
    Input Text    //textarea[@name='thongtin']    ${content_teacher}
    Choose File  //input[@name='hinhanh']   ${link_image}
    Click Element    //select[@name='kichhoat']
    Click Element     //option[contains(text(),'${status}')]

click button add teacher
    Sleep    3s
    Click Button    //button[@name='themgiaovien']

show successful teacher added message
    Wait Until Page Contains    Thêm giáo viên thành công

show message teacher already exists
    Wait Until Page Contains             Tên giáo viên đã có.Vui lòng điền tên khác

show message exceed maxlength
    Wait Until Page Contains            Tên giáo viên không vượt quá 255 ký tự

show error message
    Wait Until Page Contains    Bạn phải điền tên giáo viên
    Page Should Contain         Bạn phải điền tóm tắt giáo viên
    Page Should Contain         Bạn phải điền thông tin giáo viên
    Page Should Contain         Bạn phải có hình ảnh giáo viên

#Update
edit teacher page is open
    [Arguments]     ${locator_teacher}
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Wait Until Element Is Visible     //a[@id='list_teacher']
    Click Element    //a[@id='list_teacher']
    Click Element    ${locator_teacher}
    Sleep    3s

display error verify data
    [Arguments]     ${name_teacher}   ${summary_teacher}  ${content_teacher}     ${status}
    Page Should Contain Element   //input[@value='${name_teacher}']
    Wait Until Element Contains   //textarea[@name='tomtat']     ${summary_teacher}
    Wait Until Element Contains   //textarea[@name='thongtin']     ${content_teacher}
    Page Should Contain Element   //img[@id='image_teacher']
    Wait Until Element Contains    //select[@name='kichhoat']    ${status}


input data edit teacher
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

click button edit teacher
    Sleep    3s
    Click Button    //button[@name='update_teacher']
show successful teacher edited message
    Wait Until Page Contains    Cập nhật giáo viên thành công

clear data input
    Clear Element Text    //input[@id='slug']
    Clear Element Text    //textarea[@name='tomtat']
    Clear Element Text    //textarea[@name='thongtin']

show error message edit
    Wait Until Page Contains    Bạn phải điền tên giáo viên
    Page Should Contain         Bạn phải điền tóm tắt giáo viên
    Page Should Contain         Bạn phải điền thông tin giáo viên

#Delete
delete teacher page is open
    [Arguments]     ${locator_teacher}
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Wait Until Element Is Visible     //a[@id='list_teacher']
    Click Element    //a[@id='list_teacher']
    Click Element    ${locator_teacher}
    Sleep    3s
delete teacher
   Handle Alert 	action=ACCEPT   timeout=5s

show message delete successful
    Wait Until Page Contains    Xóa giáo viên thành công

#Search
list teacher page is open
    Verify_Login_Successfully
    Click Element    //span[@id='teacher_category']
    Wait Until Element Is Visible     //a[@id='list_teacher']
    Click Element    //a[@id='list_teacher']

search has data
    [Arguments]     ${keyword}
    Input Text    //input[@type='search']      ${keyword}
    Sleep    3s
    Page Should Contain     ${keyword}

search no data
    [Arguments]     ${keyword}
    Input Text    //input[@type='search']      ${keyword}
    Sleep    3s
    Page Should Contain    No matching records found