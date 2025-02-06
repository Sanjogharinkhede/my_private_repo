*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      https://www.saucedemo.com/
&{dt}       user=standard_user   pass=secret_sauce

*** Test Cases ***
cart_check
    Open Browser    ${url}    ${browser}
    Set Selenium Speed    1s
    Maximize Browser Window
    Login Test
    ${item}=    Get Text    xpath=//*[@id="item_4_title_link"]/div
    Log To Console    ${item}
    Click Button    xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
    Click Link    xpath=//*[@id="shopping_cart_container"]/a
    Element Should Contain    xpath=//*[@id="item_4_title_link"]/div    ${item}
    Click Button    xpath=//*[@id="checkout"]
    Element Should Be Visible    xpath=//input[@id='first-name']
    Input Text    xpath=//input[@id='first-name']    my_name
    Input Text    xpath=//input[@id='last-name']    last_name
    Input Text    xpath=//input[@id='postal-code']    411055
    Click Element    xpath=//input[@id='continue']
    Element Should Be Visible    xpath=//div[normalize-space()='Payment Information:']
    Element Should Be Visible    xpath=//div[@class='summary_total_label']
    Click Button    xpath=//button[@id='finish']
    Element Should Contain    xpath=//div[@class='complete-text']    Your order has been dispatched, and will arrive just as fast as the pony can get there!
    Close Browser


*** Keywords ***
Login Test

    Input Text    xpath=//input[@id='user-name']    ${dt}[user]
    Input Password    xpath=//input[@id='password']    ${dt}[pass]
    Sleep    3
    Click Button    xpath=//input[@id='login-button']
    Sleep    2
    Capture Page Screenshot

