*** Settings ***
Library     SeleniumLibrary
Library     DataDriver      F:/_wipro_711/NMS/Robot_Framework/testData/ddtLogindata.xlsx    sheet_name =ddtLogindata
Resource    ../resources/DDTkeywords.robot

Suite Setup     Launch App
Suite Teardown      Close Browser
Test Template       InvalidLogin

*** Test Cases ***

#Login with user ${username} and password ${password}    Default UserData
Login with user ${username} and password ${password}

*** Keywords ***
InvalidLogin
    [Arguments]     ${username}     ${password}
    sleep   2
    Set Email    ${username}
    Sleep    2
    Set password    ${password}
    Sleep    2
    Click login
    Sleep    2
    Error message should be visible

