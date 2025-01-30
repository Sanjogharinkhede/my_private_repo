*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    OperatingSystem
*** Variables ***
${img}    xpath=//*[@id="mw-content-text"]/div[1]/table[1]/tbody/tr[5]/td/div/div/div/span/a/img

*** Test Cases ***
wikipedia Test
    TRY
        Open Browser    https://www.wikipedia.org/    chrome
        Input Text    xpath=//*[@id="searchInput"]    Madhya pradesh
        Click Button    xpath=//*[@id="search-form"]/fieldset/button
        Sleep    3
        Page Should Contain Image    ${img}
        Element Should Be Visible    ${img}
        ${image_url}=  Get Element Attribute  ${img}  src
        log to console  ${image_url}

        Run Process  curl  -o  logo.png  ${image_url}
        ${get_text}=    Get Text    xpath=//*[@id="mw-content-text"]/div[1]/p[2]
        Log    ${get_text}
        Create File    ${CURDIR}/wiki.txt    ${get_text}
        Sleep    3
        
    EXCEPT    message
        Log    message
    FINALLY
        Close All Browsers
    END
    

