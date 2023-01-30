*** Settings ***
Resource   Logout_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website


*** Test Cases ***
#Check logout
Logout01_Verify logout Successful
     [Tags]     Check_Logout
     Redirect Logout
     Wait Until Page Contains Element     //button[@id='button_login']





