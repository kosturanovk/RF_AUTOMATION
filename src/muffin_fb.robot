*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${MUFFIN_FB_URL}    https://www.facebook.com/MUFFINconference/
${PROFILE PICURE}    //a[@aria-label='Profile picture']//img
${MASTERS_TAB_RETURN}    Meet the Masters

*** Keywords ***
Verify Muffin Conf Url and Prof Pic
    [Documentation]    Upon landing to the muffin fb page 
    ...    2 checks are executed (test steps)
    ...    1. url = fb...
    ...    2. fb profile picture element is dislayed and visible
    ...    Precondition switch to muffin window is done
    ...    post conditnion return to masters window
    ${url}    Get Location
    Location Should Be    ${MUFFIN_FB_URL}
    Page Should Contain Element    ${PROFILE PICURE}
    Set Focus To Element    ${PROFILE PICURE}
    Capture Element Screenshot    ${PROFILE PICURE}    fb_muffin_pic.png
    Close Window
    Switch Window    ${MASTERS_TAB_RETURN}
     