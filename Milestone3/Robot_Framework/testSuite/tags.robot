*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${browser2}      firefox
${url}      https://www.saucedemo.com/

*** Test Cases ***
Test_1
    [tags]      sanity
    Log To Console    test case 1 san
Test_2
    [tags]      regression
    Log To Console    test case 2 reg
Test_3
    [tags]      sanity
    Log To Console    test case 3 san2
Test_4
    [tags]      regression
    Log To Console    test case 4 reg2