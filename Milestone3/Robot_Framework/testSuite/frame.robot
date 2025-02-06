
*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    XML

*** Variables ***
${browser}      chrome

*** Test Cases ***

fail_iframe
    Open Browser    https://jqueryui.com/checkboxradio/    ${browser}
    Maximize Browser Window
    click element   xpath=//label[normalize-space()='New York']

pass_frame

    Open Browser    https://jqueryui.com/checkboxradio/    ${browser}
    Maximize Browser Window
    select frame    xpath=//iframe[@class='demo-frame']
    click element   xpath=//label[normalize-space()='New York']

gettext_frame
    Open Browser    https://the-internet.herokuapp.com/nested_frames    ${browser}
    Maximize Browser Window

    select frame    name=frame-top
    ${first}=  Get Text    xpath=//body
    Log To Console    ${first}
    select frame    name=frame-left
    ${second}=  Get Text    xpath=//body
    Log To Console    ${second}
    select frame    name=frame-right
    ${third}=  Get Text    xpath=//body
    Log To Console    ${third}
    select frame    name=frame-bottom
    ${last}=  Get Text    xpath=//body
    Log To Console    ${last}
