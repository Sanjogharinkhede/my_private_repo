*** Settings ***
Library     SeleniumLibrary
Library     DataDriver      F:/_wipro_711/NMS/Robot_Framework/testData/ddtLogindataCSV.csv    sheet_name =ddtLogindataCSV
Resource    ../resources/DDTkeywords.robot

Suite Setup     Launch App
Suite Teardown      Close Browser
Test Template       InvalidLogin

*** Test Cases ***

#Login with user ${username} and pass ${pass}    Default UserData
Login with user ${username} and pass ${password}

*** Keywords ***
InvalidLogin
    [Arguments]     ${username}     ${password}
    sleep   2
    Set Email    ${username}
    Sleep    2
    Set Password    ${password}
    Sleep    2
    Click login
    Sleep    2
    Error message should be visible

