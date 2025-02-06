
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
&{dt}       user=standard_user   pass=secret_sauce

*** Test Cases ***

checks
    Element Should Be Visible    locator
    Element Should Contain    locator    expected
    Element Should Be Disabled    locator
    Element Should Be Enabled    locator
    Element Should Not Be Visible    locator

screenshots
    Open Browser    https://jqueryui.com/checkboxradio/    ${browser}
    Maximize Browser Window
    Capture Page Screenshot
    Sleep    2s
    Capture Element Screenshot    xpath=//a[@href='/']

waits
    Wait Until Element Is Visible    locator
    Wait For Condition    condition
    Wait For Expected Condition    condition
    Wait Until Element Contains    locator    text
    Wait Until Element Does Not Contain    locator    text
    Wait Until Keyword Succeeds    retry    retry_interval    name
    Wait Until Location Contains    expected
    Wait Until Page Contains    text
    Wait Until Page Does Not Contain Element    locator


    Get Selenium Implicit Wait
    Set Browser Implicit Wait    value
    Set Selenium Implicit Wait    value
