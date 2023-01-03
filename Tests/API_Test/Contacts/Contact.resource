*** Settings ***
Resource    ../../../Commons/Common.resource
*** Variables ***

*** Keywords ***
create_new_session
    Open Browser    ${url_local_page}    headlesschrome
    Click Element    //a[contains(text(),'Liên hệ')]
    ${cookie_value}=     Get Cookie  XSRF-TOKEN
    Close Browser
    ${header}=  Create Dictionary   Content-Type=application/json       X-XSRF-TOKEN=${cookie_value.value}
    Create Session    myssion    ${base_url}    headers=${header}




#create_new_session
#    Open Browser    ${url_production_page}    headlesschrome
#    Sleep    5s
#    Click Element    //a[contains(text(),'Liên hệ')]
#    ${cookie_value}=     Get Cookie  XSRF-TOKEN
#    Close Browser
#    ${header}=  Create Dictionary   Content-Type=application/json       X-XSRF-TOKEN=${cookie_value.value}
#    Create Session    myssion    ${base_production_url}    headers=${header}

#check_contact_fail
#    [Arguments]     ${hoten}     ${email}   ${sodienthoai}  ${khoahocquantam}   ${expect_stt}   ${expect_message}
#    ${body}=    Create Dictionary   hoten=${hoten}     email=${email}    sodienthoai=${sodienthoai}      khoahocquantam=${khoahocquantam}
#    ${response}=    POST On Session   myssion      /contact    json=${body}
#    ${status_code}=   Convert To String   ${response.status_code}
#    Should Be Equal    ${status_code}    ${expect_stt}
#    ${res_body}=    Convert String To Json     ${response.content}
#    Should Contain    ${res_body}    ${expect_message}

check_contact_fail
    [Arguments]     ${hoten}     ${email}   ${sodienthoai}  ${khoahocquantam}   ${expect_stt}
    ${body}=    Create Dictionary   hoten=     email=test@gmail.com    sodienthoai=8528888820      khoahocquantam=test
    ${response}=  Run Keyword And Expect Error    HTTPError: 400*
     ...    POST On Session  myssion  /contact    json=${body}
    Status Should Be    expected_status=${expect_stt}






