
*** Settings ***
Resource    Home.resource
Test Setup  create_new_session

*** Test Cases ***
TC01_Check_get_course
    [Tags]      API
    [Template]      check_get_course
    course[0]        'tieude': 'Luyện Thi Vật Lý 10'


TC02_Check_get_teacher
    [Tags]      API
    [Template]      check_get_teacher
    teacher[0]      'tengiaovien': 'Nguyễn Thị P'


TC03_Check_get_news
    [Tags]      API
    [Template]      check_get_news
    news[0]         Tin tức mới nhất về kỳ thi THPT quốc gia

TC04_Check_get_subject
    [Tags]      API
    [Template]      check_get_subject
    subject[0]       'tenmonhoc': 'Môn Hóa Học'

TC05_Check_get_slider
    [Tags]      API
    [Template]      check_get_slider
    slider[0]       'slider_name': 'Slider giới thiệu'















