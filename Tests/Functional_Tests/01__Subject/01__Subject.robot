
*** Settings ***
Resource   Subject_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website
*** Variables ***
*** Test Cases ***
# Check create subject
CREATE01-Verify Create Subject Successfull
    [Tags]      Check_Create_Subject
    Redirect create subject page
                                                #Tên môn học      #Mô tả                 #Trạng thái
    Create subject                              Môn Toán Học      Danh mục môn toán      Kích hoạt
    Wait Until Page Contains                    Thêm danh mục môn học thành công

CREATE02-Check the subject already exists
    [Tags]      Check_Create_Subject
    Redirect create subject page
    Sleep    2s
                                                #Tên môn học      #Mô tả                    #Trạng thái
    Create subject                              Môn Toán Học      Danh mục môn toán         Kích hoạt
    Wait Until Page Contains                    Tên môn học đã có.Vui lòng điền tên khác

CREATE03-Check maxlength
    [Tags]      Check_Create_Subject
    Redirect create subject page
                                         #Tên môn học           #Mô tả                         #Trạng thái
    Create subject                       ${text_256_character}  Danh mục môn toán               Kích hoạt
    Wait Until Page Contains             Tên môn học không vượt quá 255 ký tự

CREATE04-Check require
   [Tags]      Check_Create_Subject
    Redirect create subject page
    Click Button    //button[@name='themmonhoc']
    Wait Until Page Contains    Bạn phải điền tên danh mục môn học
    Page Should Contain    Bạn phải điền mô tả danh mục môn học


# Check update subject
UPDATE01-Verify data subject
    [Tags]      Check_Update_Subject
    Redirect edit subject page      //tbody/tr[1]/td[4]/a[1]
                                   #Tên môn học          #Mô tả                   #Trạng thái
    Verify data                    Môn Toán Học          Danh mục môn toán         Kích hoạt

UPDATE02-Verify update subject
    [Tags]      Check_Update_Subject
    Redirect edit subject page      //tbody/tr[1]/td[4]/a[1]
                                    #Tên môn học       #Mô tả                     #Trạng thái
    Update subject                  Môn Văn Học            Danh mục môn văn       Không kích hoạt
    Wait Until Page Contains        Cập nhật danh mục môn học thành công

UPDATE03-Check the subject update already exists
    [Tags]      Check_Update_Subject
    Redirect edit subject page     //tbody/tr[1]/td[4]/a[1]
                                         #Tên môn học           #Mô tả                 #Trạng thái
    Update subject                       Môn Vật Lý            Danh mục môn vật lý       Không kích hoạt
    Wait Until Page Contains             Tên môn học đã có.Vui lòng điền tên khác


UPDATE04-Check maxlength update
    [Tags]      Check_Update_Subject
    Redirect edit subject page    //tbody/tr[1]/td[4]/a[1]
                                         #Tên môn học           #Mô tả                 #Trạng thái
    Update subject                      ${text_256_character}   Danh mục môn văn              Không kích hoạt
    Wait Until Page Contains            Tên môn học không vượt quá 255 ký tự

UPDATE05-Check require update
    [Tags]      Check_Update_Subject
    Redirect edit subject page    //tbody/tr[1]/td[4]/a[1]
    Check require
    Wait Until Page Contains    Bạn phải điền tên danh mục môn học
    Page Should Contain    Bạn phải điền mô tả danh mục môn học

# Check delete subject
DELETE-Check delete subject successfully
    [Tags]      Check_Delete_Subject
    Redirect delete subject page    //tbody/tr[1]/td[4]/form[1]/button[1]
    Delete subject
    Sleep    5s
    Wait Until Page Contains    Xóa danh mục môn học thành công


# Check search subject
SEARCH01-Check search find data
    [Tags]      Check_Search_Subject
    Redirect search subject page
    Input Text    //input[@type='search']     Môn Vật Lý
    Sleep    2s
    Page Should Contain     Môn Vật Lý

SEARCH02-Check search not find data
    [Tags]      Check_Search_Subject
    Redirect search subject page
    Input Text    //input[@type='search']    Môn Ngoại Ngữ
    Sleep    2s
    Page Should Contain    No matching records found







