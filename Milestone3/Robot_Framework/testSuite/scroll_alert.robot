*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    XML

*** Variables ***
${browser}      chrome

*** Test Cases ***

scroll_to_ele
    Open Browser    https://www.javatpoint.com/shell-scripting-shift-through-parameters    ${browser}
    Maximize Browser Window
    Set Selenium Speed    value
    Scroll Element Into View    xpath=//a[19]
    Click Element    xpath=//a[19]
    Sleep    5s
    Element Should Be Visible    xpath=//h1[normalize-space()='Python Tutorial | Python Programming Language']
    Close Browser

alert
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1s
    #prompt alert handle
    Click Element    xpath=//button[normalize-space()='Click for JS Alert']
    Handle Alert    action=Accept
    alert should not be present    I am a JS Alert
#    cancel or accept
    Click Element    xpath=//button[normalize-space()='Click for JS Confirm']
    Handle Alert    action=dismiss
    alert should not be present    I am a JS Confirm

#    with input
    Click Element    xpath=//button[normalize-space()='Click for JS Prompt']
    Input Text Into Alert    hdjfhkjsd  action=Accept
#    Handle Alert    action=dismiss
#    alert should not be present    I am a JS prompt
    Sleep    2s
    Close Browser