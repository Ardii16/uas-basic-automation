*** Settings ***
Library           SeleniumLibrary

*** variables ***
${BROWSER}     chrome
${HOST}    http://localhost/karyawan/index.php

${EMAIL}    fuad@demo.isc.id
${PASS-1}    1234    # correct password
${PASS-2}    wrongpass    # wrong password

${COMPANY}    global.inc
${TITLE}    [TEST] Senior Engineering manager
${LOCATION}     Singapore
${TAGS}    engineering manager software
${JOBEMAIL}    jobs@global.co
${WEBSITE}    https://global.co
${DESCRIPTION}     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

*** Test Cases ***

# login
# positive test
testcase-1
    Login Success
    Close Browser    

# negative test
testcase-2
    Open Browser    ${HOST}    ${BROWSER}
    input text        name:email       ${EMAIL}
    input text        name:password    ${PASS-2}
    Click Element     xpath://button[@type='submit']
    ${alert_message}=    Handle Alert   
    Close Browser 
 

*** Keywords ***

Scroll Down Until End
    ${previous_height}=    Execute Javascript    return document.body.scrollHeight;
    FOR  ${i}    IN RANGE    10
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Sleep    1s
        ${current_height}=    Execute Javascript    return document.body.scrollHeight;
        Exit For Loop If    '${current_height}' == '${previous_height}'
        ${previous_height}=    Set Variable    ${current_height}
        ${alert_message}=    Handle Alert    accept=True    # Menerima pesan alert
        Sleep    2s
    END

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    input text        name:email       ${EMAIL}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']

