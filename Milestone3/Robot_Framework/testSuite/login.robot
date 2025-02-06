
*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    XML

*** Variables ***
${browser}      chrome
${browser2}      firefox
${url}      https://www.saucedemo.com/
&{dt}       user=standard_user   pass=secret_sauce
${url2}     https://the-internet.herokuapp.com/checkboxes

*** Test Cases ***

Login Test
    TRY
        Open Browser    ${url}    ${browser}
        Maximize Browser Window
        Input Text    xpath=//input[@id='user-name']    ${dt}[user]
        Input Password    xpath=//input[@id='password']    ${dt}[pass]
        Sleep    3
        Click Button    xpath=//input[@id='login-button']
        Sleep    2
        Capture Page Screenshot
    EXCEPT    error_msg
        Capture Page Screenshot
        Log    Enter Password not found
        Log    error_msg
    FINALLY
        Close Browser
    END


demo checkbox
    Open Browser    ${url2}    ${browser}
    Maximize Browser Window
    Select Checkbox    xpath=(//input[@type = 'checkbox'])[1]
    Checkbox Should Be Selected    xpath=(//input[@type = 'checkbox'])[1]
    Sleep    2s
    Unselect Checkbox    xpath=(//input[@type = 'checkbox'])[2]
    Sleep    2s

demo radio
    Open Browser    https://rahulshettyacademy.com/AutomationPractice/    ${browser}
    Maximize Browser Window
    Select Radio Button    radioButton    radio3
    Radio Button Should Be Set To    radioButton    radio3
    Sleep    2s
#
#demo_autocomplete
#
#    Open Browser    https://rahulshettyacademy.com/AutomationPractice/    ${browser}
#    Maximize Browser Window
#    //input[@id='autocomplete']
#    Sleep    2s

demo_select
    Open Browser    https://rahulshettyacademy.com/AutomationPractice/    ${browser}
    Maximize Browser Window
    Select From List By Label    dropdown-class-example     Option1
    sleep   2
    Select From List By Index    dropdown-class-example     2
    sleep   2
    Select From List By Value    dropdown-class-example     option3
    sleep   2
#    Unselect From List By Label    dropdown-class-example     option3
    Sleep    2s


demo_select_multi
    Open Browser    https://www.softwaretestingmaterial.com/sample-webpage-to-automate/    ${browser}
    Maximize Browser Window
    Select From List By Label    multipleselect[]     Performance Testing
    sleep   2
    Select From List By Index    multipleselect[]     3
    sleep   2
    Select From List By Value    multipleselect[]     msagile
    sleep   2
    Unselect From List By Label    multipleselect[]     Agile Methodology
    Sleep    2s
    Unselect All From List    multipleselect[]


*** Keywords ***

