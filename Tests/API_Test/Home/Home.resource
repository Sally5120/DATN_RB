*** Settings ***
Resource   ../../../Commons/Common.resource

*** Keywords ***

create_new_session
    Create Session    myssion    ${base_url}


check_get_course
    [Arguments]     ${data}    ${result_d}
    ${response}=     GET On Session    myssion    ${base_url}
    ${json_object}=   Convert String To Json   ${response.content}
    ${khoahoc}=  Get Value From Json    ${json_object}    $.${data}
    ${result}=  Convert To String    ${khoahoc[0]}
    Should Be Equal   ${result}   ${result_d}
    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${contentTypeValue}=     Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal     ${contentTypeValue}   application/json

check_get_teacher
    [Arguments]     ${data}    ${result_d}
    ${response}=     GET On Session    myssion    ${base_url}
    ${json_object}=   Convert String To Json   ${response.content}
    ${teacher}=  Get Value From Json    ${json_object}    $.${data}
    ${result}=  Convert To String    ${teacher[0]}
    Should Be Equal   ${result}   ${result_d}
    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${contentTypeValue}=     Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal     ${contentTypeValue}   application/json

check_get_news
    [Arguments]     ${data}    ${result_d}
    ${response}=     GET On Session    myssion    ${base_url}
    ${json_object}=   Convert String To Json   ${response.content}
    ${news}=  Get Value From Json    ${json_object}    $.${data}
    ${result}=  Convert To String    ${news[0]}
    Should Contain   ${result}   ${result_d}
    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${contentTypeValue}=     Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal     ${contentTypeValue}   application/json