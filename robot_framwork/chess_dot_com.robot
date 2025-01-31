*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.chess.com/

*** Test Cases ***
Signup Test
    TRY
        Open Browser    https://www.chess.com/    chrome
        Maximize Browser Window
        Click Link    xpath=//*[@id="menu-cta"]
        Click Button    xpath=//*[@id="registration"]/div/div/button
        Click Element    xpath=//*[@id="registration"]/div/form/div[1]/div[3]/label
        Click Button    xpath=//*[@id="registration"]/div/form/div[1]/button
        Input Text    id=registration_email    sanjogharinkhede@gmail.com
        Input Password    id=registration_password    997784
        Click Button    xpath=//*[@id="registration"]/div/form/div[2]/button
        Sleep    3
        Capture Element Screenshot    xpath=/html/body/div[1]/div/div[3]
        Sleep    3
    EXCEPT    error_msg
        Log    Enter Password not found
        Log    error_msg
    FINALLY
        Close Browser
    END

Login Test
    TRY
        Open Browser    https://www.chess.com/    chrome
        Maximize Browser Window
        Click Link    xpath=//*[@id="sb"]/div[3]/a[9]
        Input Text    xpath=//*[@id="username-input-field"]/div/input    sanjogharinkhede@gmail.com
        Input Password    xpath=//*[@id="password-input-field"]/div/input    997784
        Click Button    xpath=//*[@id="login"]
        Sleep    3
        # Capture Element Screenshot    xpath=/html/body/div[1]/div/div[3]
        Capture Page Screenshot
        Sleep    10
    EXCEPT    error_msg
        Capture Page Screenshot
        Log    Enter Password not found
        Log    error_msg
    FINALLY
        Close Browser
    END

Play Game
    TRY
        Open Browser    ${url}    chrome
        Sleep    3
        Click Link    xpath=/html/body/div[1]/div[2]/main/div/div/section[1]/div[2]/div[2]/a
        Click Button    xpath=//*[@id="first-time-modal"]/div/div[2]/div/button[2]
        Sleep    2
        Log To Console    modal done
        Mouse Over    xpath=//*[@id="board-layout-sidebar"]/div/div[2]/div/div[3]/button
        Click Button    xpath=//*[@id="board-layout-sidebar"]/div/div[2]/div/div[3]/button
        Log To Console    play btn click
        Click Element    xpath=//*[@id="board-play-computer"]/div[24]
        Element Should Be Visible    xpath=//*[@id="board-play-computer"]/div[24]
        Sleep    2
        Click Element    xpath=//*[@id="board-play-computer"]/div[24]
        Sleep    9
    EXCEPT    error_msg
        Capture Page Screenshot
        Log    Enter Password not found
        Log    error_msg
    FINALLY
        Close All Browsers
    END

