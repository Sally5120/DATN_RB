*** Settings ***
Resource   ../../Commons/Common.resource
Resource   ../../Tests/Functional_Tests/01__Subject/Subject_User_Defined_Keyword.resource
Resource    ../../Tests/Functional_Tests/02__Teacher/Teacher_User_Defined_Keyword.resource
Resource    ../../Tests/Functional_Tests/03__Course/Course_User_Defined_Keyword.resource
Resource    ../../Tests/Functional_Tests/05__RegisterStudent/RegisterStudent_User_Defined_Keyword.resource
*** Variables ***

*** Keywords ***

Implement new subjects
    Redirect create subject page
                                                #Tên môn học      #Mô tả                 #Trạng thái
    Create subject                              Môn Địa Lý      Danh mục môn địa lý      Kích hoạt
    Close Website

Implement new teacher
    Given Open Admin Site Using Chrome Browser
    And create teacher page is open
    When input data create teacher       Nguyễn Văn G     Giáo viên dạy địa    Giáo viên 10 năm kinh nghiệm luyện thi đại học.         ${image}\\Teachers\\gv_vatly_toan.png    Kích hoạt
    And click button add teacher
    Then show successful teacher added message
    And Close Website

Implement new course
    Open Admin Site Using Chrome Browser
    Redirect create course page
                                                #Tên khóa học    #Tóm tắt  #Thông tin   #Số lượng học viên  #Hình ảnh                           #Môn học        #Giáo viên            #Lịch khai giảng(dd/mm/yyyy)     #Trạng thái
    Create course                               Luyện thi địa lý  Tóm tắt    Hà Nội        15               ${image}\\Courses\\hoa10.png      Môn Địa Lý        Nguyễn Văn G            12122022                         Không kích hoạt
    Wait Until Page Contains                    Thêm khóa học thành công

Input data
    [Arguments]     ${hoten}    ${email}    ${phone}    ${subject}
    Input Text    //input[@id='name']    ${hoten}
    Input Text    //input[@id='email']    ${email}
    Input Text    //input[@id='phone']    ${phone}
    Input Text    //textarea[@id='message']     ${subject}
    Click Element    //input[@id='submit']

Verify data register
    [Arguments]     ${hoten}    ${email}    ${phone}    ${subject}
    Wait Until Element Contains    //tbody/tr[1]/td[1]    ${hoten}
    Wait Until Element Contains    //tbody/tr[1]/td[2]    ${email}
    Wait Until Element Contains    //tbody/tr[1]/td[3]    ${phone}
    Wait Until Element Contains    //tbody/tr[1]/td[4]    ${subject}

Successfully created a Geography exam preparation course with teacher
    Click Element    //span[@id='course']
    Wait Until Element Is Visible    //a[@id='list_course']
    Click Element    //a[@id='list_course']
    Wait Until Element Contains    //tbody/tr[1]/td[1]    Luyện thi địa lý
    Wait Until Element Contains    //tbody/tr[1]/td[2]    Môn Địa Lý
    Wait Until Element Contains    //tbody/tr[1]/td[3]    Nguyễn Văn G
    
