
*** Settings ***
Resource   Teacher_User_Defined_Keyword.resource
Test Setup  Start Testcase
Test Teardown   Finish Testcase
*** Variables ***
*** Test Cases ***
#Create Teachers
CREATE01-Verify Create Teacher Successfull
    [Tags]      Check create teacher
    Redirect create teacher page
                                                 #Tên giáo viên   #Tóm tắt                            #Thông  tin                               #Hình ảnh                                #Trạng thái
    Create teacher                               Nguyễn Văn A     Giáo viên dạy toán    Giáo viên 10 năm kinh nghiệm luyện thi đại học.         ${image}\\Teachers\\gv_vatly_toan.png    Kích hoạt
    Wait Until Page Contains    Thêm giáo viên thành công

CREATE02-Check the teacher already exists
    [Tags]      Check create teacher
    Redirect create teacher page
                                                 #Tên giáo viên  #Tóm tắt  #Thông  tin   #Hình ảnh                           #Trạng thái
    Create teacher                               Nguyễn Văn A     Tóm tắt    Hà Nội     ${image}\\Teachers\\gv_vatly_toan.png    Không kích hoạt
    Wait Until Page Contains             Tên giáo viên đã có.Vui lòng điền tên khác

CREATE03-Check maxlength
    [Tags]      Check create teacher
    Redirect create teacher page
                                         #Tên giáo viên          #Tóm tắt  #Thông  tin   #Hình ảnh                           #Trạng thái
    Create teacher                     ${text_256_character}     Tóm tắt     Hà Nội    ${image}\\Teachers\\gv_vatly_toan.png       Không kích hoạt
    Wait Until Page Contains            Tên giáo viên không vượt quá 255 ký tự

CREATE04-Check require
   [Tags]      Check create teacher
    Redirect create teacher page
    Click Button    //button[@name='themgiaovien']
    Wait Until Page Contains    Bạn phải điền tên giáo viên
    Page Should Contain         Bạn phải điền tóm tắt giáo viên
    Page Should Contain         Bạn phải điền thông tin giáo viên
    Page Should Contain         Bạn phải có hình ảnh giáo viên


#Update Teachers
UPDATE01-Verify data Teacher
    [Tags]      Check update teacher
    Redirect edit teacher page      //tbody/tr[1]/td[6]/a[1]
    Sleep    3s
                                     #Tên giáo viên        #Tóm tắt              #Thông  tin                                          #Trạng thái
    Verify data                      Nguyễn Văn A         	Giáo viên dạy toán    Giáo viên 10 năm kinh nghiệm luyện thi đại học.      Kích hoạt

UPDATE02-Verify update Teacher
    [Tags]      Check update teacher
    Redirect edit teacher page      //tbody/tr[1]/td[6]/a[1]
                                     #Tên giáo viên  #Tóm tắt    #Thông  tin   #Hình ảnh                                 #Trạng thái
    Update teacher                   Nguyễn Văn B     Tóm tắt     Hà Nội       ${image}\\Teachers\\gv_vatly_toan.png     Không kích hoạt
    Wait Until Page Contains    Cập nhật giáo viên thành công

UPDATE03-Check the teacher update already exists
    [Tags]      Check update teacher
    Redirect edit teacher page    //tbody/tr[1]/td[6]/a[1]
                                                         #Tên giáo viên    #Tóm tắt   #Thông  tin   #Hình ảnh                               #Trạng thái
    Update teacher                                      Nguyễn Văn C        Tóm tắt     Hà Nội     ${image}\\Teachers\\gv_vatly_toan.png    Không kích hoạt
    Wait Until Page Contains            Tên giáo viên đã có.Vui lòng điền tên khác

UPDATE04-Check maxlength update
    [Tags]      Check update teacher
    Redirect edit teacher page    //tbody/tr[1]/td[6]/a[1]
                                    #Tên giáo viên        #Tóm tắt  #Thông  tin   #Hình ảnh                                   #Trạng thái
    Update teacher               ${text_256_character}     Tóm tắt     Hà Nội    ${image}\\Teachers\\gv_vatly_toan.png      Không kích hoạt
    Wait Until Page Contains            Tên giáo viên không vượt quá 255 ký tự

UPDATE05-Check require update
    [Tags]      Check Update teacher
    Redirect edit teacher page    //tbody/tr[1]/td[6]/a[1]
    Check require
    Wait Until Page Contains    Bạn phải điền tên giáo viên
    Page Should Contain         Bạn phải điền tóm tắt giáo viên
    Page Should Contain         Bạn phải điền thông tin giáo viên

#Delete Teachers
DELETE01-Check delete teacher successfully
    [Tags]      Check Delete teacher
    Redirect delete teacher page    //tbody/tr[1]/td[6]/form[1]/button[1]
    Delete teacher
    Sleep    5s
    Wait Until Page Contains    Xóa giáo viên thành công

#Search
SEARCH01-Check search find data
    [Tags]      Search
    Redirect search teacher page
    Input Text    //input[@type='search']     Nguyễn Văn C
    Sleep    3s
    Page Should Contain     Nguyễn Văn C

SEARCH02-Check search not find data
    [Tags]      Search
    Redirect search teacher page
    Input Text    //input[@type='search']    Nguyễn Văn D
    Sleep    3s
    Page Should Contain    No matching records found







