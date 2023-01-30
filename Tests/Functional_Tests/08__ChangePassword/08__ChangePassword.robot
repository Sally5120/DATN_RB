*** Settings ***
Resource   ChangePassword_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website
*** Test Cases ***
# Check change password
CP01_Verify Change Password Fail-Re Enter Password wrong
     [Tags]     Check_Change_Password
     Redirect Change Password page
     Input data    12345678         123456          123456
     Page Should Contain    Mật khẩu nhập lại không đúng
CP02_Verify Change Password Fail-Password old wrong
     [Tags]     Check_Change_Password
     Redirect Change Password page
     Input data    12345678         12345678          12345
     Page Should Contain    Mật khẩu cũ không đúng
CP03_Verify Change Password Successful
     [Tags]    Check_Change_Password
     Redirect Change Password page
     Input data    12345678         12345678          123456
     Page Should Contain    Đổi mật khẩu thành công
     Clear text
     Input data    123456           123456         12345678
     Page Should Contain    Đổi mật khẩu thành công




