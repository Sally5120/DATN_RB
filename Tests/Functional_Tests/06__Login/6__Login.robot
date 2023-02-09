
*** Settings ***
Resource   Login_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website
*** Variables ***
*** Test Cases ***
# Check login
L01_Verify Login Successful
    [Tags]  Check_Login_Successful
    Verify_Login_Successfully
L02_Verify login fail
    [Tags]  Check_Login_Fail
    [Template]          Verify_Login_Fail   #Username               #Password           #Expect
                                            Sally515                123456               //span[contains(text(),'Mật khẩu hoặc tài khoản không đúng')]          #wrong username
                                            Sally51                 1234567              //span[contains(text(),'Mật khẩu hoặc tài khoản không đúng')]          #wrong password
                                            ${EMPTY}                123456               //div[@data-validate="Vui lòng nhập username"]                         #input blank username
                                            Sally51                 ${EMPTY}             //div[@data-validate="Vui lòng nhập password"]                         #input blank password
*** Keywords ***
