*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F

*** Keywords ***
Launch App
    Open Browser        ${url}      ${browser}
    Maximize Browser Window
#    Set Selenium Speed    2s

Close App
    Close Browser

Set Email
    [Arguments]     ${username}
    Input Text    xpath=//input[@id='Email']        ${username}

Set password
    [Arguments]     ${password}
    Input Text    xpath=//input[@id='Password']        ${password}

Click login
    Click Element    xpath=//button[normalize-space()='Log in']

Error message should be visible
    Element Should Be Visible    xpath=//span[@class='field-validation-error']

