
*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    XML

*** Variables ***
${browser}      chrome
${url}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
&{dt}       user=standard_user   pass=secret_sauce

*** Test Cases ***

context_and_dbl_clicks
    Open Browser    ${url}    ${browser}
    Set Selenium Speed    1s
    Maximize Browser Window
    Open Context Menu    xpath=//a[normalize-space()='OrangeHRM, Inc']
    Sleep    2
    Double Click Element    xpath=//p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']
    Sleep    2
    Close Browser

drag_drop
    Open Browser    https://the-internet.herokuapp.com/drag_and_drop    ${browser}
    Set Selenium Speed    1s
    Maximize Browser Window
    Drag And Drop    xpath=//div[@id='column-a']    xpath=//div[@id='column-b']

keys_check
    Open Browser    https://the-internet.herokuapp.com/key_presses    ${browser}
    Set Selenium Speed    1s
    Maximize Browser Window
    Clear Element Text   xpath=//input[@id='target']
    Press Key    xpath=//input[@id='target']    \\13
    Sleep    2
    Clear Element Text   xpath=//input[@id='target']
    Press Key    xpath=//input[@id='target']    TAB
    Sleep    2
    Clear Element Text   xpath=//input[@id='target']
    Press Key    xpath=//input[@id='target']    CNTRL
    Clear Element Text   xpath=//input[@id='target']

    Press Keys      xpath=//input[@id='target']    CNTRL

hovers_check
    Open Browser    https://the-internet.herokuapp.com/hovers    ${browser}
    Set Selenium Speed    1s
    Maximize Browser Window
    Mouse Over      xpath=//div[@class='example']//div[1]//img[1]
    Element Should Be Visible    xpath=(//a[contains(text(),'View profile')])[1]
