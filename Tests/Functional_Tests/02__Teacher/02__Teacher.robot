
*** Settings ***
Resource   Teacher_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website
*** Variables ***
*** Test Cases ***
#BDD (Behavior-driven style)
#Check Create Teachers
CREATE01-Verify Create Teacher Successfull
    [Tags]      Check_Create_Teacher
    Given create teacher page is open
    When input data create teacher       Nguyễn Văn A     Giáo viên dạy toán    Giáo viên 10 năm kinh nghiệm luyện thi đại học.         ${image}\\Teachers\\gv_vatly_toan.png    Kích hoạt
    And click button add teacher
    Then show successful teacher added message

CREATE02-Check the teacher already exists
    [Tags]      Check_Create_Teacher
    Given create teacher page is open
    When input data create teacher       Nguyễn Văn A     Giáo viên dạy toán    Giáo viên 10 năm kinh nghiệm luyện thi đại học.         ${image}\\Teachers\\gv_vatly_toan.png    Kích hoạt
    And click button add teacher
    Then show message teacher already exists

CREATE03-Check maxlength
    [Tags]      Check_Create_Teacher
    Given create teacher page is open
    When input data create teacher       ${text_256_character}      Giáo viên dạy toán    Giáo viên 10 năm kinh nghiệm luyện thi đại học.         ${image}\\Teachers\\gv_vatly_toan.png    Kích hoạt
    And click button add teacher
    Then show message exceed maxlength

CREATE04-Check require
   [Tags]      Check_Create_Teacher
   Given create teacher page is open
   When click button add teacher
   Then show error message

#Check Update Teachers
UPDATE01-Verify data Teacher
    [Tags]      Check_Update_Teacher
    Given edit teacher page is open    //tbody/tr[1]/td[6]/a[1]
    Then display error verify data     Nguyễn Văn A         	Giáo viên dạy toán    Giáo viên 10 năm kinh nghiệm luyện thi đại học.      Kích hoạt

UPDATE02-Verify update Teacher
    [Tags]      Check_Update_Teacher
    Given edit teacher page is open     //tbody/tr[1]/td[6]/a[1]
    When input data edit teacher                 Nguyễn Văn B     Giáo viên dạy lý     Hà Nội       ${image}\\Teachers\\gv_vatly_toan.png     Không kích hoạt
    And click button edit teacher
    Then show successful teacher edited message

UPDATE03-Check the teacher update already exists
    [Tags]      Check_Update_Teacher
    Given edit teacher page is open     //tbody/tr[1]/td[6]/a[1]
    When input data edit teacher        Nguyễn Văn C        Tóm tắt     Hà Nội     ${image}\\Teachers\\gv_vatly_toan.png    Không kích hoạt
    And click button edit teacher
    Then show message teacher already exists

UPDATE04-Check maxlength update
    [Tags]      Check_Update_Teacher
    Given edit teacher page is open     //tbody/tr[1]/td[6]/a[1]
    When input data create teacher       ${text_256_character}      Giáo viên dạy toán    Giáo viên 10 năm kinh nghiệm luyện thi đại học.         ${image}\\Teachers\\gv_vatly_toan.png    Kích hoạt
    And click button edit teacher
    Then show message exceed maxlength

UPDATE05-Check require update
    [Tags]      Check_Update_Teacher
    Given edit teacher page is open      //tbody/tr[1]/td[6]/a[1]
    When clear data input
    And click button edit teacher
    Then show error message edit

#Check Delete Teachers
DELETE01-Check delete teacher successfully
    [Tags]      Check_Delete_Teacher
    Given delete teacher page is open     //tbody/tr[1]/td[6]/form[1]/button[1]
    When delete teacher
    Then show message delete successful

#Check Search Teachers
SEARCH01-Check search find data
    [Tags]      Check_Search_Teacher
    Given list teacher page is open
    Then search has data    Nguyễn Văn T

SEARCH02-Check search not find data
    [Tags]      Check_Search_Teacher
    Given list teacher page is open
    Then search no data    Thai Hoa Anh