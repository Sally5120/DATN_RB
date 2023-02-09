
*** Settings ***
Resource   Course_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website
*** Variables ***

*** Test Cases ***
# Data-driven style
# Check Create Cources
CREATE01-Verify Create Course Successfull
    [Tags]      Check_Create_Course
    Redirect create course page
                                                #Tên khóa học   #Tóm tắt  #Thông tin   #Số lượng học viên  #Hình ảnh                           #Môn học        #Giáo viên            #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Create course                               Luyện thi Sinh   Tóm tắt    Hà Nội        15               ${image}\\Courses\\hoa10.png      Môn Sinh Học    Nguyễn Văn C    12122022                         Không kích hoạt
    Wait Until Page Contains                    Thêm khóa học thành công

CREATE02-Check the course already exists
    [Tags]      Check_Create_Course
    Redirect create course page
                                                 #Tên khóa học   #Tóm tắt  #Thông tin   #Số lượng học viên  #Hình ảnh                           #Môn học        #Giáo viên            #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Create course                               Luyện thi Sinh   Tóm tắt    Hà Nội        15              ${image}\\Courses\\hoa10.png      Môn Sinh Học    Nguyễn Văn C      12122022                         Không kích hoạt
    Wait Until Page Contains                    Tiêu đề khóa học đã có.Vui lòng điền tên khác


CREATE03-Check maxlength
    [Tags]      Check_Create_Course
    Redirect create course page
                                               #Tên khóa học            #Tóm tắt  #Thông tin   #Số lượng học viên   #Hình ảnh                           #Môn học        #Giáo viên            #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Create course                              ${text_256_character}   Tóm tắt    Hà Nội        15                  ${image}\\Courses\\hoa10.png      Môn Sinh Học    Nguyễn Văn C    12122022                         Không kích hoạt
    Wait Until Page Contains                   Tiêu đề khóa học không vượt quá 255 ký tự

CREATE04-Check require
   [Tags]      Check_Create_Course
    Redirect create course page
    Click Button    //button[@name='themkhoahoc']
    Wait Until Page Contains    Bạn phải điền tiêu đề khóa học
    Page Should Contain         Bạn phải điền tóm tắt khóa học
    Page Should Contain         Bạn phải điền nội dung khóa học
    Page Should Contain         Bạn phải có hình ảnh khóa học
    Page Should Contain         Bạn phải có lịch khai giảng khóa học
    Page Should Contain         Bạn phải điền số lượng học viên

# Check Update Courses
UPDATE01-Verify data course
    [Tags]      Check_Update_Course
    Redirect edit course page    //tbody/tr[1]/td[8]/a[1]
                        #Tên khóa học   #Tóm tắt  #Thông tin   #Số lượng học viên     #Môn học        #Giáo viên            #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Verify data         Luyện thi Sinh    Tóm tắt    Hà Nội       15                  Môn Sinh Học    Nguyễn Văn C      2022-12-12                       Không kích hoạt

UPDATE02-Verify update course
    [Tags]      Check_Update_Course
    Redirect edit course page    //tbody/tr[1]/td[8]/a[1]
                                     #Tên khóa học           #Tóm tắt  #Thông tin   #Số lượng học viên  #Hình ảnh                           #Môn học        #Giáo viên        #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Update course                    Luyện thi tiếng anh   Tóm tắt    Hà Nội        15              ${image}\\Courses\\hoa10.png      Môn Tiếng Anh    Nguyễn Thị A    12122022                         Không kích hoạt
    Wait Until Page Contains         Cập nhật khóa học thành công

UPDATE03-Check the course update already exists
    [Tags]      Check_Update_Course
    Redirect edit course page    //tbody/tr[1]/td[8]/a[1]
                                                #Tên khóa học       #Tóm tắt            #Thông tin   #Số lượng học viên  #Hình ảnh                              #Môn học        #Giáo viên            #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Update course                                Luyện thi vật lý   Luyện thi vật lý    Luyện thi vật lý        15                ${image}\\Courses\\hoa10.png      Môn Vật Lý    Nguyễn Văn L             12122022                        Không kích hoạt
    Wait Until Page Contains                     Tiêu đề khóa học đã có.Vui lòng điền tên khác


UPDATE04-Check maxlength update
    [Tags]      Check_Update_Course
    Redirect edit course page    //tbody/tr[1]/td[8]/a[1]
                                 #Tên khóa học           #Tóm tắt  #Thông tin   #Số lượng học viên  #Hình ảnh                           #Môn học        #Giáo viên            #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Update course                ${text_256_character}   Tóm tắt    Hà Nội        15                ${image}\\Courses\\hoa10.png      Môn Sinh Học    Nguyễn Văn C    12122022                        Không kích hoạt
    Wait Until Page Contains     Tiêu đề khóa học không vượt quá 255 ký tự

UPDATE05-Check require update
    [Tags]      Check_Update_Course
    Redirect edit course page    //tbody/tr[1]/td[8]/a[1]
    Check require
    Wait Until Page Contains    Bạn phải điền tiêu đề khóa học
    Page Should Contain         Bạn phải điền tóm tắt khóa học
    Page Should Contain         Bạn phải điền nội dung khóa học
    Page Should Contain         Bạn phải điền số lượng học viên

# Check Delete Courses
DELETE-Check delete course successfully
    [Tags]      Check_Delete_Course
    Redirect delete course page   //tbody/tr[1]/td[8]/form[1]/button[1]
    Delete course
    Sleep    5s
    Wait Until Page Contains    Xóa khóa học thành công

# Check Search Courses
SEARCH01-Check search find data
    [Tags]      Check_Search_Course
    Redirect search course page
    Input Text    //input[@type='search']     Luyện thi vật lý
    Sleep    3s
    Page Should Contain     Luyện thi vật lý

SEARCH02-Check search not find data
    [Tags]      Check_Search_Course
    Redirect search course page
    Input Text    //input[@type='search']    Luyện thi sinh học
    Sleep    3s
    Page Should Contain    No matching records found








