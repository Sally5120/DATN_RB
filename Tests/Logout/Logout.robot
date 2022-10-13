*** Settings ***
Resource   Logout_User_Defined_Keyword.resource
Test Setup  Start Testcase
Test Teardown   Finish Testcase


*** Test Cases ***
Logout01_Verify logout Successful
     Redirect Logout
     Wait Until Page Contains Element     //button[@id='button_login']





