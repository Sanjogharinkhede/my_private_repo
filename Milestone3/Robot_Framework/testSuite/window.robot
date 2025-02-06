
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome

*** Test Cases ***

switch_window
    Open Browser    https://the-internet.herokuapp.com/windows    ${browser}
    Maximize Browser Window
    click element   xpath=//a[normalize-space()='Click Here']
    Sleep    2
    Switch Window   title=New Window
    Sleep    2
    Page Should Contain    New Window
    Element Should Be Visible    xpath=//h3[normalize-space()='New Window']
    Sleep    2
    Switch Window   title=The Internet
    Sleep    2
    Element Should Be Visible    xpath=//a[normalize-space()='Click Here']

tooltip
    Open Browser    https://jqueryui.com/tooltip/    ${browser}
    Maximize Browser Window
    select frame    xpath=//iframe[@class='demo-frame']
    Sleep    2
    ${title}=       Get Element Attribute    xpath=//a[normalize-space()='Tooltips']    title
    Mouse Over    xpath=//a[normalize-space()='Tooltips']
    Sleep    2
    Should Contain    ${title}      That's what this widget is
    Sleep    2

date_picker

    Open Browser    https://www.tutorialspoint.com/selenium/practice/date-picker.php    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@id='datetimepicker1']
    Sleep    2
    Click Element    xpath=//input[@id='datetimepicker1']
#    Wait Until Element Is Visible    xpath=//div[@class='flatpickr-calendar hasTime animate arrowTop arrowLeft open']//span[@aria-label='February 4, 2025'][normalize-space()='4']
    Click Element    xpath=//div[@class='flatpickr-calendar hasTime animate arrowTop arrowLeft open']//span[@aria-label='February 5, 2025'][normalize-space()='5']
    Sleep    2

