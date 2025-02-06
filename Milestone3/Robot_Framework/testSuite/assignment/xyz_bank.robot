*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login

*** Test Cases ***
xyz_bank
    Open Browser    ${url}    ${browser}
    Set Selenium Speed    1s
    Maximize Browser Window
    bank_manager

*** Keywords ***
bank_manager
    Sleep    2s
    Click Button    xpath=//button[normalize-space()='Bank Manager Login']
    Element Should Be Visible    xpath=//button[normalize-space()='Add Customer']
    Click Button    xpath=//button[normalize-space()='Add Customer']
    Sleep    2s
    Element Should Be Visible    xpath=//input[@placeholder='First Name']
    Input Text    xpath=//input[@placeholder='Last Name']    Harinkhede
    Input Text    xpath=//input[@placeholder='First Name']    Sanjog
    Input Text    xpath=//input[@placeholder='Post Code']    411055
    Click Button  xpath=//button[@type='submit']
    Sleep    2s

#    Alert Should Be Present     Customer added successfully with customer
    Handle Alert    accept=ACCEPT
    Sleep    2s

    Click Element    xpath=//button[normalize-space()='Open Account']
    Element Should Be Visible    xpath=//*[@id="userSelect"]
    Select From List By Label    userSelect     Sanjog Harinkhede
    Select From List By Label    currency    Rupee
    Sleep    2s

    Click Button    xpath=//button[normalize-space()='Process']
#    Alert Should Be Present     Account created successfully with account Number
    Handle Alert    accept=ACCEPT
    Sleep    2s

    Element Should Contain    xpath=//tbody    Sanjog
    Element Should Contain    xpath=//tbody    Harinkhede
    Element Should Contain    xpath=//tbody    411055
    Sleep    2s







