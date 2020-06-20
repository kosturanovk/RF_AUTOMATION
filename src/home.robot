*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNIN_BUTTON}    //ul[@class='nav navbar-nav navbar-right']//li//a[@class='btn btn-nav' and contains(text(),'Sign In')]
${ARCHIVE_BUTTON}    //ul[@class='nav navbar-nav navbar-right']//li//a[@class='btn btn-nav' and contains(text(),'Archive')]
${URL_MUSALAMASTER}    https://masters.musala.com/
${URL_MUSALA_HTTP}     http://www.musala.com/
${URL_MUSALAMASTER_LOGIN}    https://masters.musala.com/login#1
${HOME_PAGE_MUSALA_LOGO}    //img[@class='muffin-logo-pic']
${FOOTER}    //footer
${FOOTER_LOGO}     //div[@class='leftPartFooter']//img[@class='footer-image']
${MUFFIN_BUTTON}   //div[@class='rightPartFooter']//a[contains(@href, 'MUFFIN')]
${MASTERS_TAB_TITLE}    Meet the Masters
${MUSALA_TAB_TITLE}    Musala Soft
${MUFFIN_TAB_TITLE}    MUFFIN Conference - Home | Facebook

*** Keywords ***
Verify Home Page And Initiate Signing In
    [Documentation]    Kw used to open the given parametric url and initiate (open/click)
    ...    the sign in button
    # verify the correct url is open
    ${url}=    Get Location
    Should Be Equal As Strings    ${url}    ${URL_MUSALAMASTER}
    Element Should Be Visible    ${HOME_PAGE_MUSALA_LOGO}
    #verify presence and click sign in buttons
    Page Should Contain Element    ${SIGNIN_BUTTON}    1    
    Element Should Be Visible    ${SIGNIN_BUTTON}
    Set Focus To Element    ${SIGNIN_BUTTON}
    Click Element    ${SIGNIN_BUTTON}
    #Implicit check if login page is opened 
    ${url_login}=    Get Location
    Should Contain    ${url_login}    login

Verify Home Page And Navigate From Footer To Offical Page
    [Documentation]    This kw enables scrolling to the footer section and clicking 
    ...    the muffin link
    #Verify url = home
    ${url_1}    Get Location
    Run Keyword If    "${url_1}" == "${URL_MUSALAMASTER}"    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Element Should Be Visible    ${FOOTER}
    #cick the FACEBOOK LOGO and navigate to the MUFFIN CONF SITE
    #verify tab
    @{open_tabs_before}=    Create List
    @{open_tabs_before}=    Get Window Titles
    Log    ELEMNTS ARE : @{open_tabs_before}
    
    Should Contain   @{open_tabs_before}       ${MASTERS_TAB_TITLE}
    
    Click Element     //div[@class='leftPartFooter']//img[@class='footer-image']
    #Check if navigation took place and new musala page tab is opened
    @{open_tabs_after}=    Create List
    @{open_tabs_after}=    Get Window Titles
    @{check_list}=    Create List    ${MASTERS_TAB_TITLE}    ${MUSALA_TAB_TITLE}

    Log    ELEMNTS ARE : @{open_tabs_after}
    ${count}=    Set Variable    ${0}
    FOR    ${i}    IN    @{open_tabs_after}
        Log To Console    item:::::${i}
        Log To Console    ${check_list}[${count}]    
        Should Be Equal As Strings    ${i}    ${check_list}[${count}]
        ${count}=    Evaluate    ${count} + ${1}
    END    
    
    Switch Window    ${MUSALA_TAB_TITLE}
    
        
Navigate from Masters Home To Fb Muffin
    [Documentation]    NAvigate from masters home page to the Fb 
    ...    muffin event
    Location Should Be    ${URL_MUSALAMASTER}
    # go to footer
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Page Should Contain Element    ${MUFFIN_BUTTON}
    # check open tabs before
    @{open_tabs_before}=    Create List
    @{open_tabs_before}=    Get Window Titles
    Log    ELEMNTS ARE : @{open_tabs_before}
    
    Should Contain   @{open_tabs_before}       ${MASTERS_TAB_TITLE}
    

    Click Element    ${MUFFIN_BUTTON}
    #Check open tabs after
    @{open_tabs_after}=    Create List
    @{open_tabs_after}=    Get Window Titles
    @{check_list}=    Create List    ${MASTERS_TAB_TITLE}    ${MUFFIN_TAB_TITLE}
    
    Log    ELEMNTS ARE : @{open_tabs_after}
    ${count}=    Set Variable    ${0}
    FOR    ${i}    IN    @{open_tabs_after}
        Log To Console    item:::::${i}
        Log To Console    ${check_list}[${count}]    
        Should Be Equal As Strings    ${i}    ${check_list}[${count}]
        ${count}=    Evaluate    ${count} + ${1}
    END    
    
    Switch Window    ${MUFFIN_TAB_TITLE}
    
Navigate To Archive Section
    [Documentation]    1. check url = masters url    2.click the archive section
    Location Should Be    ${URL_MUSALAMASTER}
    Page Should Contain Element    ${ARCHIVE_BUTTON}
    Element Should Be Visible    ${ARCHIVE_BUTTON}
    Click Element    ${ARCHIVE_BUTTON}
    Wait Until Location Contains    archive
    
    
    
    
    
    
        
    