
*** Settings ***
Resource   News_User_Defined_Keyword.resource
Test Setup  Start Testcase
Test Teardown   Finish Testcase
*** Variables ***
*** Test Cases ***
#Create new
CREATE01-Verify Create New Successfull
    [Tags]      Check create new
    Redirect create new page
                                                #Tên tin tức     #Tóm tắt  #Thông  tin   #Hình ảnh                          #Trạng thái
    Create new                                  Nguyễn Văn A     Tóm tắt    Hà Nội      ${image}\\News\\tintuc1.jpg    Không kích hoạt
    Wait Until Page Contains    Thêm tin tức thành công

CREATE02-Check the new already exists
    [Tags]      Check create new
    Redirect create new page
                                            #Tên tin tức     #Tóm tắt  #Thông  tin   #Hình ảnh                          #Trạng thái
    Create new                               Nguyễn Văn A     Tóm tắt    Hà Nội      ${image}\\News\\tintuc1.jpg     Không kích hoạt
    Wait Until Page Contains             Tiêu đề tin tức đã có.Vui lòng điền tiêu đề khác

CREATE03-Check maxlength
    [Tags]      Check create new
    Redirect create new page
                                        #Tên tin tức         #Tóm tắt  #Thông  tin   #Hình ảnh                           #Trạng thái
    Create new                         ${text_256_character}     Tóm tắt     Hà Nội   ${image}\\News\\tintuc1.jpg     Không kích hoạt
    Wait Until Page Contains            Tên tin tức không vượt quá 255 ký tự

CREATE04-Check require
   [Tags]      Check create new
    Redirect create new page
    Click Button    //button[@name='themtintuc']
    Wait Until Page Contains    Bạn phải điền tiêu đề
    Page Should Contain         Bạn phải điền tóm tắt tin tức
    Page Should Contain         Bạn phải điền nội dung tin tức
    Page Should Contain         Bạn phải có hình ảnh tin tức


#Update new
UPDATE01-Verify data new
    [Tags]      Check update new
    Redirect edit new page      //tbody/tr[1]/td[5]/a[1]
                                   #Tên tin tức        #Tóm tắt              #Thông  tin             #Trạng thái
    Verify data                    Nguyễn Văn A        Tóm tắt                 Hà Nội                Không kích hoạt


UPDATE02-Verify update new
    [Tags]      Check update new
    Redirect edit new page      //tbody/tr[1]/td[5]/a[1]
                                 #Tên tin tức    #Tóm tắt    #Thông  tin   #Hình ảnh                           #Trạng thái
    Update new                   Nguyễn Văn B     Tóm tắt     Hà Nội       ${image}\\News\\tintuc1.jpg      Không kích hoạt
    Wait Until Page Contains    Cập nhật tin tức thành công

UPDATE03-Check the new update already exists
    [Tags]      Check update new
    Redirect edit new page    //tbody/tr[1]/td[5]/a[1]
                                 #Tên tin tức    #Tóm tắt    #Thông  tin   #Hình ảnh                           #Trạng thái
    Update new                   Nguyễn Văn C     Tóm tắt     Hà Nội       ${image}\\News\\tintuc1.jpg      Không kích hoạt
    Wait Until Page Contains             Tiêu đề tin tức đã có.Vui lòng điền tiêu đề khác

UPDATE04-Check maxlength update
    [Tags]      Check update new
    Redirect edit new page    //tbody/tr[1]/td[5]/a[1]
                                    #Tên tin tức       #Tóm tắt  #Thông  tin   #Hình ảnh                           #Trạng thái
    Update new               ${text_256_character}     Tóm tắt     Hà Nội    ${image}\\News\\tintuc1.jpg       Không kích hoạt
    Wait Until Page Contains            Tên tin tức không vượt quá 255 ký tự

UPDATE05-Check require update
    [Tags]      Check Update new
    Redirect edit new page    //tbody/tr[1]/td[5]/a[1]
    Check require
    Sleep    3s
    Wait Until Page Contains        Bạn phải điền tiêu đề
    Page Should Contain         Bạn phải điền tóm tắt tin tức
    Page Should Contain         Bạn phải điền nội dung tin tức

#Delete new
DELETE-Check delete new successfully
    [Tags]      Check Delete new
    Redirect delete new page    //tbody/tr[1]/td[5]/form[1]/button[1]
    Delete new
    Wait Until Page Contains    Xóa tin tức thành công

#Search
SEARCH01-Check search find data
    [Tags]      Search
    Redirect search new page
    Input Text    //input[@type='search']    Nguyễn Văn C
    Sleep    3s
    Page Should Contain    Nguyễn Văn C

SEARCH02-Check search not find data
    [Tags]      Search
    Redirect search new page
    Input Text    //input[@type='search']    Nguyễn Văn E
    Sleep    3s
   Page Should Contain    No matching records found









