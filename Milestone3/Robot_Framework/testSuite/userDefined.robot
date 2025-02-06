*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${browser2}      firefox
${url}      https://www.saucedemo.com/


*** Test Cases ***
example
    Open Browser        ${url}      ${browser}
    Set Selenium Speed    1s
    loginSomewhere
    Close Browser

*** Keywords ***
loginSomewhere
    Maximize Browser Window
    Log To Console    user enter name
    Log To Console    user enter pass
    Log To Console    user click on login
    Log To Console    user navigated to home