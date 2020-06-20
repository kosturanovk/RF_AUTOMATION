*** Settings ***
Resource    ../src/home.robot
Resource    ../src/common.robot
Resource    ../src/sign_in.robot
Resource    ../src/musala_official_page.robot
Resource    ../src/muffin_fb.robot
Resource    ../src/archive.robot
Resource    ../src/event.robot
Variables    ../param/run_config.yaml
Variables    ../param/credentials.yaml


Test Setup    Start Test    ${TEST_EXEC_CONF.url}    ${TEST_EXEC_CONF.browser}
Test Teardown    Stop Test
*** Test Cases ***
Test Case 1 - Wrong Sign In 5 Times
    FOR    ${i}    IN RANGE    1    6
        Verify Home Page And Initiate Signing In
        Log To Console    ${i}-th iteration:     ${CRED${i}.usr}    ${CRED${i}.pwd}
        Execute Sign In With Incorrect Credentials    ${CRED${i}.usr}    ${CRED${i}.pwd}
    END
    Sleep    10
    
Test Case 2 - Navigation Muffin
    Verify Home Page And Navigate From Footer To Offical Page
    Land And Check Musala Official Page From Masters
    Navigate from Masters Home To Fb Muffin
    Verify Muffin Conf Url and Prof Pic
    Sleep    10    
    
Test Case 3 - Last Event Summary
    Navigate To Archive Section
    Scroll To Bottom Of Archive Page And Select Last Event
    Make A Summary Of Event Topics Per Day
    Sleep    10    