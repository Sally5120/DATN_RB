*** Settings ***
Resource   Logout_User_Defined_Keyword.resource
Test Setup  Open Admin Site Using Chrome Browser
Test Teardown   Close Website


*** Test Cases ***
Logout01_Verify logout Successful
     Redirect Logout
     Wait Until Page Contains Element     //button[@id='button_login']





