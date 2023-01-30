
*** Settings ***
Resource   News_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website
*** Variables ***
*** Test Cases ***
# Check create new
CREATE01-Verify Create New Successfull
    [Tags]      Check_Create_New
    Redirect create new page
                                                #Tên tin tức     #Tóm tắt  #Thông  tin   #Hình ảnh                          #Trạng thái
    Create new                                  Nguyễn Văn A     Tóm tắt    Hà Nội      ${image}\\News\\tintuc1.jpg    Không kích hoạt
    Wait Until Page Contains    Thêm tin tức thành công

CREATE02-Check the new already exists
    [Tags]      Check_Create_New
    Redirect create new page
                                            #Tên tin tức     #Tóm tắt  #Thông  tin   #Hình ảnh                          #Trạng thái
    Create new                               Nguyễn Văn A     Tóm tắt    Hà Nội      ${image}\\News\\tintuc1.jpg     Không kích hoạt
    Wait Until Page Contains             Tiêu đề tin tức đã có.Vui lòng điền tiêu đề khác

CREATE03-Check maxlength
    [Tags]      Check_Create_New
    Redirect create new page
                                        #Tên tin tức         #Tóm tắt  #Thông  tin   #Hình ảnh                           #Trạng thái
    Create new                         ${text_256_character}     Tóm tắt     Hà Nội   ${image}\\News\\tintuc1.jpg     Không kích hoạt
    Wait Until Page Contains            Tên tin tức không vượt quá 255 ký tự

CREATE04-Check require
   [Tags]      Check_Create_New
    Redirect create new page
    Click Button    //button[@name='themtintuc']
    Wait Until Page Contains    Bạn phải điền tiêu đề
    Page Should Contain         Bạn phải điền tóm tắt tin tức
    Page Should Contain         Bạn phải điền nội dung tin tức
    Page Should Contain         Bạn phải có hình ảnh tin tức


# Check update new
UPDATE01-Verify data new
    [Tags]      Check_Update_New
    Redirect edit new page      //tbody/tr[1]/td[5]/a[1]
                                   #Tên tin tức        #Tóm tắt              #Thông  tin             #Trạng thái
    Verify data                    Nguyễn Văn A        Tóm tắt                 Hà Nội                Không kích hoạt


UPDATE02-Verify update new
    [Tags]      Check_Update_New
    Redirect edit new page      //tbody/tr[1]/td[5]/a[1]
                                 #Tên tin tức    #Tóm tắt    #Thông  tin   #Hình ảnh                           #Trạng thái
    Update new                   Nguyễn Văn B     Tóm tắt     Hà Nội       ${image}\\News\\tintuc1.jpg      Không kích hoạt
    Wait Until Page Contains    Cập nhật tin tức thành công

UPDATE03-Check the new update already exists
    [Tags]      Check_Update_New
    Redirect edit new page    //tbody/tr[1]/td[5]/a[1]
                                 #Tên tin tức                                 #Tóm tắt    #Thông  tin   #Hình ảnh                           #Trạng thái
    Update new                   Tin tức mới nhất về kỳ thi THPT quốc gia     Tóm tắt     Hà Nội       ${image}\\News\\tintuc1.jpg      Không kích hoạt
    Wait Until Page Contains             Tiêu đề tin tức đã có.Vui lòng điền tiêu đề khác

UPDATE04-Check maxlength update
    [Tags]      Check_Update_New
    Redirect edit new page    //tbody/tr[1]/td[5]/a[1]
                                    #Tên tin tức       #Tóm tắt  #Thông  tin   #Hình ảnh                           #Trạng thái
    Update new               ${text_256_character}     Tóm tắt     Hà Nội    ${image}\\News\\tintuc1.jpg       Không kích hoạt
    Wait Until Page Contains            Tên tin tức không vượt quá 255 ký tự

UPDATE05-Check require update
    [Tags]      Check_Update_New
    Redirect edit new page    //tbody/tr[1]/td[5]/a[1]
    Check require
    Sleep    3s
    Wait Until Page Contains        Bạn phải điền tiêu đề
    Page Should Contain         Bạn phải điền tóm tắt tin tức
    Page Should Contain         Bạn phải điền nội dung tin tức

# Check delete new
DELETE-Check delete new successfully
    [Tags]      Check_Delete_New
    Redirect delete new page    //tbody/tr[1]/td[5]/form[1]/button[1]
    Delete new
    Wait Until Page Contains    Xóa tin tức thành công

# Check search new
SEARCH01-Check search find data
    [Tags]     Check_Search_New
    Redirect search new page
    Input Text    //input[@type='search']    Tin tức mới nhất về kỳ thi THPT quốc gia
    Sleep    3s
    Page Should Contain    Tin tức mới nhất về kỳ thi THPT quốc gia

SEARCH02-Check search not find data
    [Tags]      Check_Search_New
    Redirect search new page
    Input Text    //input[@type='search']    Nguyễn Văn E
    Sleep    3s
   Page Should Contain    No matching records found









