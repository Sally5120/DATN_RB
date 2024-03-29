
*** Settings ***
Resource   RegisterStudent_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website

*** Variables ***

*** Test Cases ***

# Check change status contacted
RG01-Verify change status contacted
    [Tags]      Check_Change_Status_Student_Register
    Redirect not contacted page
    Click Element    //tbody/tr[1]/td[6]/a[1]/span[1]
    Sleep    3s
    Wait Until Page Contains    Thay đổi trạng thái thành công

# Check delete student status not contacted
RG2-Verify delete student not contacted
    [Tags]      Check_Delete_Student_Register
    Redirect not contacted page
    Click Element    //tbody/tr[1]/td[7]/form[1]/button[1]
    Delete register
    Wait Until Page Contains    Xóa học sinh đăng ký thành công

# Check change status contacted
RG3-Verify change status not contacted
    [Tags]      Check_Change_Status_Student_Register
    Redirect contacted page
    Sleep    5s
    Click Element    //tbody/tr[1]/td[6]/a[1]/span[1]
    Sleep    3s
    Wait Until Page Contains    Thay đổi trạng thái thành công

# Check delete student status not contacted
RG4-Verify delete student contacted
    [Tags]     Check_Delete_Student_Register
    Redirect not contacted page
    Click Element    //tbody/tr[1]/td[7]/form[1]/button[1]
    Delete register
    Wait Until Page Contains    Xóa học sinh đăng ký thành công

# Check search student register
SEARCH01-Check search to find data students contacted
    [Tags]      Check_Search_Student _Register
    Redirect contacted page
    Input Text    //input[@type='search']     Linh
    Sleep    2s
    Page Should Contain     Linh

SEARCH02-Check search not find data student contacted
    [Tags]      Check_Search_Student _Register
    Redirect contacted page
    Input Text    //input[@type='search']    Nguyễn Văn C
    Sleep    2s
    Page Should Contain    Showing 0 to 0 of 0 entries

SEARCH03-Check search to find data students not contact
    [Tags]      Check_Search_Student _Register
    Redirect not contacted page
    Input Text    //input[@type='search']     Linh
    Sleep    2s
    Page Should Contain     Linh

SEARCH04-Check search not find data student not contact
    [Tags]      Check_Search_Student _Register
    Redirect not contacted page
    Input Text    //input[@type='search']    SAllY
    Sleep    2s
    Page Should Contain    Showing 0 to 0 of 0 entries






