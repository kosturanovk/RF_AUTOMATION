*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL_MUSALA_OFFICIAL}    http://www.musala.com/
${COMPANY_LOGO}    //div[@id='navbar']//a[@class='brand' and contains(@href,musala)]//p
${MASTERS_TAB}    

*** Keywords ***
Land And Check Musala Official Page From Masters
    [Documentation]    Kw to be used when navigating from the musala masters to the
    ...    musla offical page, KW purpose verifes official page is opened and company logo present
    ...    At the end of the checks the browser tab is closed and navigation returs to masters tab again
    ${url}    Get Location
    Should Be Equal As Strings    ${URL_MUSALA_OFFICIAL}    ${url}
    Page Should Contain Element    ${COMPANY_LOGO}    
    Element Should Be Visible    ${COMPANY_LOGO}
    Capture Page Screenshot    logo.png
    Close Window
    Switch Window    Meet the Masters