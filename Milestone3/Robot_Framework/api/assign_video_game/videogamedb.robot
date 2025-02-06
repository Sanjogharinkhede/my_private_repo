
*** Settings ***
Library     RequestsLibrary

*** Variables ***
${browser}      chrome
${base_url}     https://videogamedb.uk:443/api/v2/
${end}      api/users
${sample_json}      {"name":"abc","job":"tester"}

*** Test Cases ***

list_all_video_game
    [Tags]      slow
     RequestsLibrary.Create Session    videodb    ${base_url}
     ${resp}=        GET On Session     videodb     videogame
     Log To Console    ${resp}
     Log To Console    ${resp.text}
     Log To Console    ${resp.status_code}

create_video_game
    [Tags]      fast
    RequestsLibrary.Create Session    videodb    ${base_url}
    &{body}=        Create Dictionary   category=shooting      name=Pbj      rating=Mature      releaseDate=2022-05-04      reviewScore=95
    &{header}=      Create Dictionary       content-type=application/json
    ${resp}=        POST On Session     videodb    /videogame       json=&{body}        headers=&{header}
    Log To Console    ${resp}
    Log To Console    ${resp.text}
    Log To Console    ${resp.status_code}

update_video_game
    [Tags]      slow
    RequestsLibrary.Create Session    videodb    ${base_url}
    &{body}=        Create Dictionary   category=Platform      name=Pbj      rating=Mature      releaseDate=2022-05-04      reviewScore=95
    &{header}=      Create Dictionary       content-type=application/json
    ${resp}=        Put On Session     videodb    /videogame/1       json=&{body}        headers=&{header}
    Log To Console    ${resp}
    Log To Console    ${resp.text}
    Log To Console    ${resp.status_code}

get_A_video_game
    [Tags]      slow
     RequestsLibrary.Create Session    videodb    ${base_url}
     ${resp}=        GET On Session     videodb     videogame/1
     Log To Console    ${resp}
     Log To Console    ${resp.text}
     Log To Console    ${resp.status_code}

delete_A_video_game
    [Tags]      slow
     RequestsLibrary.Create Session    videodb    ${base_url}
     ${resp}=        Delete On Session     videodb     videogame/1
     Log To Console    ${resp}
     Log To Console    ${resp.text}
     Log To Console    ${resp.status_code}
