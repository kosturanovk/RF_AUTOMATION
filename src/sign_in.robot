*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOIGN_PANNEL}    //div[@class='panel panel-primary panel-registration-login']
${LOGIN_TABS}    //div[@id='login-tabs']
${SIGN_IN_TAB}    //a[@class='panel-title panel-title-registration'][contains(text(),'Sign In')]
${SIGN_IN_BUTTON}    //button[@id='btn-sign-in']
${INPUT_USR_FIELD}    //input[@id='login-form_username']
${INPUT_PWD_FIELD}    //input[@id='login-form_password']
${WRONG_PASS_BOX}    //p[contains(text(),'Wrong user or password.')]
${HOME_PAGE}    https://masters.musala.com/

*** Keywords ***
Execute Sign In With Incorrect Credentials
    [Documentation]    KW to used after the Open Sign In Dialog kw has been executed
    ...    2 args acepted pwd and usr (WRONG ONES)
    [Arguments]    ${usr}    ${pwd}
    Element Should Be Visible    ${LOIGN_PANNEL}
    Element Should Be Visible    ${SIGN_IN_TAB}
    Element Should Be Visible    ${SIGN_IN_BUTTON}
    Input Text    ${INPUT_USR_FIELD}    ${usr}
    Input Text    ${INPUT_PWD_FIELD}    ${pwd}
    ${url}=    Get Location    
    Click Button    id:btn-sign-in
    Wait Until Location Is Not   ${url}
    Wait Until Page Contains Element    ${WRONG_PASS_BOX}
    Wait Until Element Is Visible    ${WRONG_PASS_BOX}
    Scroll Element Into View    ${WRONG_PASS_BOX}
    Capture Page Screenshot    wrongpass.png
    Go To    ${HOME_PAGE}
    Location Should Be    ${HOME_PAGE}
    
