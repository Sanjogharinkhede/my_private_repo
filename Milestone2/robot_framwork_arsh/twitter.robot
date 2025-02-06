*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
Signup Test
    TRY
        Open Browser    https://x.com/    chrome
        Maximize Browser Window
        # Click Link    xpath=//*[@id="menu-cta"]
        Click Link    xpath=//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/div[1]/div/div[3]/a
        Sleep    3
        # Click Element    xpath=//*[@id="registration"]/div/form/div[1]/div[3]/label
        # Click Button    xpath=//*[@id="registration"]/div/form/div[1]/button
        Input Text    name=name    b33yy12
        Input Text    name=email    b33yy12@yopmail.com
        Sleep    2
        Mouse over    xpath=//*[@id="SELECTOR_1"]
        Page Should Contain Element    xpath=//*[@id="SELECTOR_1"]/option[2]    3s
        Click Element   xpath=//*[@id="SELECTOR_1"]/option[2]


        Mouse over    xpath=//*[@id="SELECTOR_2"]
        Page Should Contain Element    xpath=//*[@id="SELECTOR_2"]/option[2]    3s
        Click Element   xpath=//*[@id="SELECTOR_2"]/option[2]

        Mouse over    xpath=//*[@id="SELECTOR_3"]
        Page Should Contain Element    xpath=//*[@id="SELECTOR_3"]/option[37]    3s
        Click Element   xpath=//*[@id="SELECTOR_3"]/option[37]

        Click Button    xpath=//*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div/button
        Sleep    5

        # Click Button    xpath=//*[@id="registration"]/div/form/div[2]/button
        Sleep    3
        # Capture Element Screenshot    xpath=/html/body/div[1]/div/div[3]
        # Sleep    3
    EXCEPT    error_msg
        Log    Enter Password not found
        Log    error_msg
    FINALLY
        Close Browser
    END
