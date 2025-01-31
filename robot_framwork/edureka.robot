
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.edureka.co/blog/acceptance-testing/
${path}    /html/body/section[2]/div/div/div[2]/div[2]/p[21]

*** Test Cases ***

Bullet Test
    TRY
        Open Browser    ${url}    chrome
        Maximize Browser Window
        ${get_text}=    Get Text    xpath=${path}
        Log    ${get_text}
        Capture Page Screenshot
        Sleep    10
    EXCEPT    error_msg
        Capture Page Screenshot
        Log    Enter Password not found
        Log    error_msg
    FINALLY
        Close Browser
    END
        