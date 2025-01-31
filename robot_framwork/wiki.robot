*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    OperatingSystem
Library    String
Library    XML
*** Variables ***
${img}    xpath=//*[@id="mw-content-text"]/div[1]/table[1]/tbody/tr[5]/td/div/div/div/span/a/img
${lang}     Fiji Hindi
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
Wiki Checkbox
    Select Language Wiki
    
*** Keywords ***
Select Language Wiki
    TRY
        Open Browser    https://www.wikipedia.org/wiki/India    chrome
        # Set Selenium Speed    3s
        Mouse Over    xpath=//*[@id="p-lang-btn-checkbox"]
        Click Element    xpath=//*[@id="p-lang-btn-checkbox"]
        Wait Until Element Is Visible    xpath=/html/body/div[1]/div[2]    3s
        ${elem}    Get WebElements   xpath=/html/body/div[1]/div[2]
        Log To Console    ${elem}
        ${elem}    Split String    ${elem}    \n
        FOR    ${element}    IN    @{elem}
            ${t}    Get Text    ${element}
            ${t}    Strip String    ${t}
            ${t}    Convert To Lower Case    ${t}  
            ${lang_lower}    Convert To Lower Case    ${lang}
            Log To Console    "Extracted: [${t}] | Expected: [${lang_lower}]"
            # Log To Console    ${t}
            IF  '${t}' == '${lang_lower}'
                
                Log To Console    ${t}
                BREAK
            END
        END
        Log To Console    ${elem}
    EXCEPT    AS    ${error}
        Log    Registration failed: ${error}
    FINALLY
        Close All Browsers
    END


