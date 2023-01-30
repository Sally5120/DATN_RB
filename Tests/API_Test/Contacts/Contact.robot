*** Settings ***
Resource    Contact.resource
Test Setup  create_new_session
*** Test Cases ***
TC01_Contact_Successfully
    [Tags]      API_Test
    ${body}=    Create Dictionary   hoten=test     email=test@gmail.com    sodienthoai=8528888820      khoahocquantam=test
    ${response}=    POST On Session    myssion      /contact    json=${body}
    ${status_code}=   Convert To String   ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    add contact successfully

TC02_Contact_Fail
     [Tags]      API_Test
     [Template]     check_contact_fail
     # ${hoten}                       ${email}                           ${sodienthoai}          ${khoahocquantam}   ${expect_stt}
     ${EMPTY}                         test@gmail.com                    88999999999              test                400
     linhtest                         ${EMPTY}                          88999999999              test                400
     linhtest                         test@gmail.com                    ${EMPTY}                 test                400
     linhtest                         test@gmail.com                    88999999999              ${EMPTY}            400
     ${None}                          test@gmail.com                    88999999999              test                400
     linhtest                         ${None}                           88999999999              test                400
     linhtest                         test@gmail.com                    ${None}                  test                400
     linhtest                         test@gmail.com                    88999999999              ${None}             400
     linh                             testgmail.com                     88999999999              test                400
     test                             test@gmail.com                    8899999999999999         test                400
     ${text_256_character}            test@gmail.com                    88999999999              test                400
     text_256_character               ${text_256_character_email}       88999999999              test                400








#TC02_Contact_Fail
#     [Tags]      API
#     [Template]     check_contact_fail
#     # ${hoten}                       ${email}                           ${sodienthoai}          ${khoahocquantam}   ${expect_stt}     ${expect_message}
#     ${EMPTY}                         test@gmail.com                    88999999999              test                400              The hoten field is required.
#     linhtest                         ${EMPTY}                          88999999999              test                400              The email field is required.
#     linhtest                         test@gmail.com                    ${EMPTY}                 test                400              The sodienthoai field is required.
#     linhtest                         test@gmail.com                    88999999999              ${EMPTY}            400              The khoahocquantam field is required.
#     ${None}                          test@gmail.com                    88999999999              test                400              The hoten field is required.
#     linhtest                         ${None}                           88999999999              test                400              The email field is required.
#     linhtest                         test@gmail.com                    ${None}                  test                400              The sodienthoai field is required.
#     linhtest                         test@gmail.com                    88999999999              ${None}             400              The khoahocquantam field is required.
#     linh                             testgmail.com                     88999999999              test                400              The email must be a valid email address.
#     test                             test@gmail.com                    8899999999999999         test                400              The sodienthoai must not be greater than 15 characters.
#     ${text_256_character}            test@gmail.com                    88999999999              test                400              The hoten must not be greater than 255 characters.
#     text_256_character               ${text_256_character_email}       88999999999              test                400              The email must not be greater than 255 characters.
#









