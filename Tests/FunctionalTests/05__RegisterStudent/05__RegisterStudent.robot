
*** Settings ***
Resource   RegisterStudent_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website

*** Variables ***

*** Test Cases ***
RG01-Register and Verify data register
     [Setup]  Open User Site Using Chrome Browser
     Click Element    //a[contains(text(),'Liên hệ')]
     Sleep  2s
     Input data    Nguyễn Văn A   linh@gmail.com    0988888888    Toán
     Sleep    2s
     Close Browser
     Open Admin Site Using Chrome Browser
     Redirect not contacted page
     Verify data register   Nguyễn Văn A   linh@gmail.com    0988888888    Toán

RG02-Verify change status contacted
    Redirect not contacted page
    Click Element    //tbody/tr[1]/td[6]/a[1]/span[1]
    Wait Until Page Contains    Thay đổi trạng thái thành công

RG3-Verify delete student not contacted
    Redirect not contacted page
    Click Element    //tbody/tr[1]/td[7]/form[1]/button[1]
    Delete register
    Wait Until Page Contains    Xóa học sinh đăng ký thành công

RG4-Verify change status not contacted
    Redirect contacted page
    Click Element    //tbody/tr[1]/td[6]/a[1]/span[1]
    Wait Until Page Contains    Thay đổi trạng thái thành công

RG5-Verify delete student contacted
    Redirect not contacted page
    Click Element    //tbody/tr[1]/td[7]/form[1]/button[1]
    Delete register
    Wait Until Page Contains    Xóa học sinh đăng ký thành công

SEARCH01-Check search to find data students contacted
    [Tags]      Search
    Redirect contacted page
    Input Text    //input[@type='search']     Linh
    Sleep    2s
    Page Should Contain     Linh

SEARCH02-Check search not find data student contacted
    [Tags]      Search
    Redirect contacted page
    Input Text    //input[@type='search']    Nguyễn Văn C
    Sleep    2s
    Page Should Contain    Showing 0 to 0 of 0 entries

SEARCH03-Check search to find data students not contact
    [Tags]      Search
    Redirect not contacted page
    Input Text    //input[@type='search']     Linh
    Sleep    2s
    Page Should Contain     Linh

SEARCH04-Check search not find data student not contact
    [Tags]      Search
    Redirect not contacted page
    Input Text    //input[@type='search']    Nguyễn Văn C
    Sleep    2s
    Page Should Contain    Showing 0 to 0 of 0 entries






