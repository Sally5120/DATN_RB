*** Settings ***
Library     RequestsLibrary
*** Variables ***
${base_url}     http://localhost/Project/tschool/api
*** Test Cases ***
Get_course
    Create Session    myssion    ${base_url}
    ${response}=     Get Request    myssion    ${base_url}
#    Log To Console    ${response.status_code}
#    Log To Console    ${response.content}
#    Log To Console    ${response.headers}
    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
