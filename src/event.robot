*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${EVENT_URL_LANDED}    https://masters.musala.com/event/master-class
${EVENT_PAGE_FOOTER}    //*//footer
${DAY_ELEMENT_DESC}    //ul[@class='list-group checked-list-box']//li//span[contains(text(),'Day')]
${GENERIC_ELEMENT}    //ul[@class='list-group checked-list-box']
#${GENERIC_ELEMENT_TOPIC}    //ul[@class='list-group checked-list-box']//*//div[@class='speaker-info']


*** Keywords ***
Make A Summary Of Event Topics Per Day
    [Documentation]    List all days of the event
    ...    and come out with an event summary (printed to log and console)
    ...    DAY1 - Title
    ...    Topic 1
    ...    Topic 2
    ...    ...
    ...    DAY2 - Title
    ...    Topic 1
    Location Should Contain    ${EVENT_URL_LANDED}
    Page Should Contain Element    ${EVENT_PAGE_FOOTER}
    #To be sure all day divs a re loaded and visible
    #Scroll Element Into View    ${EVENT_PAGE_FOOTER}
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${EVENT_PAGE_FOOTER}
    ${days}=    Get Element Count    ${DAY_ELEMENT_DESC}
    ${end_day}=    Evaluate    ${days} + 1
    
    #FOR    ${i}    IN RANGE    1    ${end_day}
    #    Log To Console    iter ----- ${i}
     #   ${day_title}=    Get Text    (${DAY_ELEMENT_DESC})[${i}]
      #  Log To Console    ${day_title}     
       # #Scroll Element Into View    (${DAY_ELEMENT_DESC})[${i}]
    #END
    
    ${elem}=    Get Element Count    ${GENERIC_ELEMENT}
    ${last_elem}=    Evaluate    ${elem} + 1
    
    FOR    ${j}    IN RANGE    1    ${last_elem}
        ${elem_text}=    Get Text    (${GENERIC_ELEMENT})[${j}]
        ${line_count}=    Get Line Count    ${elem_text}
        ${line_count_last}=    Evaluate    ${line_count} - 1    
        ${topic}=    Get Line    ${elem_text}    ${line_count_last}
        Log To Console    ${topic}
        Log    ${topic}    
    END  