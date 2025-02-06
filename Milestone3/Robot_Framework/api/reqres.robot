
*** Settings ***
Library     RequestsLibrary

*** Variables ***
${browser}      chrome
${base_url}     https://reqres.in/
${end}      api/users
${sample_json}      {"name":"abc","job":"tester"}

*** Test Cases ***

verify_post
    [Tags]      fast
    RequestsLibrary.Create Session    baseURL    ${base_url}
    &{body}=        Create Dictionary       name=sanjog     job=tester
    &{header}=      Create Dictionary       content-type=application/json
    ${resp}=        POST On Session     baseURL    ${end}       json=&{body}        headers=&{header}
    Log To Console    ${resp}
    Log To Console    ${resp.text}
    Log To Console    ${resp.status_code}

verify_get
    [Tags]      slow
     RequestsLibrary.Create Session    reqres    ${base_url}
     ${resp}=        GET On Session     reqres     api/users/2
     Log To Console    ${resp}
     Log To Console    ${resp.text}
     Log To Console    ${resp.status_code}

verify_delete
    [Tags]      fast
     RequestsLibrary.Create Session    reqres    ${base_url}
     ${resp}=        Delete On Session     reqres     api/users/2
     Log To Console    ${resp}
     Log To Console    ${resp.text}
     Log To Console    ${resp.status_code}

verify_put
    [Tags]      fast
     RequestsLibrary.Create Session    baseURL    ${base_url}
     &{body}=        Create Dictionary       name=sanjog     job=tester
     &{header}=      Create Dictionary       content-type=application/json
     ${resp}=        Put On Session     baseURL    api/users/2       json=&{body}        headers=&{header}
     Log To Console    ${resp}
     Log To Console    ${resp.text}
     Log To Console    ${resp.status_code}