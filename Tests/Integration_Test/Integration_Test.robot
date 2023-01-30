
*** Settings ***

Resource    Integration_Test.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website

*** Variables ***

*** Test Cases ***
# Intergration Test Register Course
RG01-Register course
    [Tags]  Integration_Test
    When Implement new subjects
    And Implement new teacher
    And Implement new course
    Then Successfully created a Geography exam preparation course with teacher

# Intergration Test Register and Verify data register
RG02_Register and Verify data register
    [Tags]  Integration_Test
     [Setup]  Open User Site Using Chrome Browser
     Click Element    //a[contains(text(),'Liên hệ')]
     Sleep  2s
     Input data    Nguyễn Văn A   linh@gmail.com    0988888888    Toán
     Sleep    2s
     Close Browser
     Open Admin Site Using Chrome Browser
     Redirect not contacted page
     Sleep    3s
     Verify data register   Nguyễn Văn A   linh@gmail.com    0988888888    Toán


