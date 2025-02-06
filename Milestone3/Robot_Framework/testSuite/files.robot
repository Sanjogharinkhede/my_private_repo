
*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    XML

*** Variables ***
${browser}      chrome

*** Test Cases ***

check_file_downloaded
    Open Browser    https://the-internet.herokuapp.com/download    ${browser}
    Maximize Browser Window
    Click Link    xpath=//a[normalize-space()='megadyneBladeHero.jpg']
    ${file}=        Get Text    xpath=//a[normalize-space()='megadyneBladeHero.jpg']
#    Log To Console    ${file}
    Sleep    3
#    @{files}=   List Files In Directory     C:/Users/hp/Downloads
    File Should Exist    C:/Users/hp/Downloads/megadyneBladeHero.jpg
#    Log To Console    ${files}
    Close Browser

file_uploader
    Open Browser    https://the-internet.herokuapp.com/upload    ${browser}
    Maximize Browser Window
    Choose File    xpath=//*[@id="file-upload"]    C:/Users/hp/Downloads/strawberry.jpg
    Sleep    2s
    Click Element    xpath=//*[@id="file-submit"]
    Sleep    2s
    Close Browser
