*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Start Test
    [Arguments]    ${start_url}    ${browser_choice}
    Open Browser    url=${start_url}    browser=${browser_choice}
    Maximize Browser Window

Stop Test
    Close Browser