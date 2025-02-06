*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${browser2}      firefox
${url}      https://www.saucedemo.com/
@{ls}       Apple   banana      orange
${ls2}       Apple   banana      orange
${ls3}=      Evaluate   ['Apple',['lls','ls'],'dd']
&{dt}       user='an'   name='sa'

*** Test Cases ***
Verify invoke chrome
    Open Browser        ${url}      ${browser}
    Close Browser
Verify invoke firefox
    Open Browser        ${url}      ${browser2}
    Close Browser
Verify invoke edge
    Open Browser        ${url}      edge
    Close Browser
varibleUsage
    Log To Console      ${url}
    Log To Console      ${ls}
    Log To Console      ${ls[0]}
    Log To Console      ${ls2}
    Log To Console      ${ls2[1]}
    Log To Console      ${dt}[user]
    Log To Console      ${ls3}
    Log To Console      ${ls3[0]}
    Log To Console      ${ls3[1]}