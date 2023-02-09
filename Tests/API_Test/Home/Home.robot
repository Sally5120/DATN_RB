
*** Settings ***
Resource    Home.resource
Test Setup  create_new_session

*** Test Cases ***
TC01_Check_get_course
    [Tags]      API_Test
    [Template]      check_get_course
    course[0]        Luyện thi ngữ văn


TC02_Check_get_teacher
    [Tags]      API_Test
    [Template]      check_get_teacher
    teacher[0]      Nguyễn Văn C


TC03_Check_get_news
     [Tags]      API_Test
    [Template]      check_get_news
    news[0]         Tin tức mới nhất về kỳ thi THPT quốc gia

TC04_Check_get_subject
    [Tags]      API_Test
    [Template]      check_get_subject
    subject[0]       Môn Toán Học

TC05_Check_get_slider
     [Tags]      API_Test
    [Template]      check_get_slider
    slider[0]       Slider giới thiệu















