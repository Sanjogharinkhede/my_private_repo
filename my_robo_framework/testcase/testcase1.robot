*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEVICE_NAME}   Android Emulator
${BROWSER}       Chrome
${url}  https://www.shoppersstack.com/
${AdminSignUp}  //*[@id="root"]/section[3]/article/div[2]/div[1]/div[1]/p/a
${RegisterButton}   //*[@id="Disabled Register"]
*** Test Cases ***
Shopper stack test cases
    TRY
        Run Keyword And Continue On Failure    RegisterTOShopperStack    user1    Password@1
        RegisterTOShopperStack    user2    Password@2
        Sleep    10

    EXCEPT    AS    ${error}
        Log     failed: ${error}
    FINALLY
        Close Browser
    END

Shopper stack with Template and removing try except as both not work at same time
    [Template]    RegisterTOShopperStack    
    user-1    Password@4
    user0    Password@3
Open Youtube and Watch for fun
    TRY
        FOR    ${counter}    IN RANGE    0    10
            Log    ${counter}
            Open Browser    https://www.youtube.com/watch?v=wNMV534RpqM  ${BROWSER}
            Open Browser    https://www.youtube.com/watch?v=wNMV534RpqM  firefox
            
        END
        Sleep    18

    EXCEPT    message
        Log    Failed
    FINALLY
        Close All Browsers
    END

List with multiple Select and checkbox Practice
    Select Checkbox    some    
    Select Checkbox    some    #name only
    Unselect Checkbox    some

    Select Radio Button    name    value
    

    Select From List By Label    name    value
    Select From List By Label    name2    value2
    Unselect From List By Label    name2    value2

*** Keywords ***
RegisterTOShopperStack 
    [Arguments]    ${username}    ${password}
    ${s}    get selenium speed
    Log To Console    ${s}
    Set Selenium Speed    5 seconds
    ${sp}=  get selenium speed
    Log To Console    ${sp}

    Open Browser    ${url}  ${BROWSER}

    Wait Until Element Is Visible    xpath=${AdminSignUp}   15s
    Page Should Contain Link    xpath=${AdminSignUp}
    Click Link    xpath=${AdminSignUp}

    Page Should Contain Button    ${RegisterButton}
    Element Should Be Disabled    ${RegisterButton}

    ################################## Input Box ################
    Input Text    id=First Name    ${username}
    Input Text    id=Last Name    sbcbq
    Click Element    id=Female
    Input Text    id=Phone Number    7417417411
    Input Text    id=Email Address    sbcbq@gmail.com
    Input Password    id=Password    ${password}
    Input Password    id=Confirm Password    Password@1
    
    ################################## SELECT DROPDOWN ################
    Select From List By Index    Country    2
    Sleep    3
    Select From List By Value    Country    USA
    Sleep    3
    Select From List By Label    Country    Canada
    Sleep    3

    Mouse Over    id=Country
    Click Element    id=Country
    Element Should Be Visible    id=India
    Click Element    id=India
    
    Sleep    2
    Mouse Over    id=State
    Click Element    id=State
    Element Should Be Visible    id=Tripura
    Click Element    id=Tripura

    Mouse Over    id=City
    Click Element    id=City
    Element Should Be Visible    id=Agartala
    Click Element    id=Agartala
    ################################## SELECT DROPDOWN ################

    Sleep    2

    Element Should Be Enabled    //*[@id="Register"]
#        Click Button    //*[@id="Register"]



    