*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_ARCHIVE}    https://masters.musala.com/archive
${FOOTER_ARCHIVE_PAGE}    //footer
${LAST_EVENT_BOX}    (//div[@id='events-cont']//div[@class='event-box-home'])[last()]
${EVENT_URL}    https://masters.musala.com/event/master-class

*** Keywords ***
Scroll To Bottom Of Archive Page And Select Last Event
    [Documentation]   upon landing to archive page 
    ...    execte scroll down until last element and footer are found
    Location Should Contain    ${URL_ARCHIVE}
    Page Should Contain Element    ${FOOTER_ARCHIVE_PAGE}
    Scroll Element Into View    ${FOOTER_ARCHIVE_PAGE}
    Wait Until Element Is Visible    ${FOOTER_ARCHIVE_PAGE}
    Page Should Contain Element    ${LAST_EVENT_BOX}
    Click Element    ${LAST_EVENT_BOX}  
    Wait Until Location Contains    ${EVENT_URL}