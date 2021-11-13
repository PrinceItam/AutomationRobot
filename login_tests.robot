*** Settings ***
#Test Setup        Set Selenium Implicit Wait    5s
Library                SeleniumLibrary
#Suite Setup            Navigate to homepage and click sign in
#Suite Teardown         Close All Browsers
Resource  resources/automation_resource.resource

#*** Variables ***
#${URL}            http://automationpractice.com/
#${BROWSER}        chrome    #firefox    #explorer
#${SIGN_IN_HOMEPAGE}    class:login
#${USERNAME_FILED}    id:email
#${PASSWORD_FILED}    id:passwd #${LOGIN_BUTTON}    id:SubmitLogin

*** Test Cases ***
Valid Login
    [Tags]   Prince
    Navigate to homepage and click sign in
    Enter login credentials   ${USER_EMAIL}   ${USER_PASSWORD}

    #[Setup]    Open Browser    ${URL}    ${BROWSER}
   # Maximize Browser Window
    #Click Element    ${SIGN_IN_HOMEPAGE}
    #Input Text    ${USERNAME_FILED}    bidemi2020@yahoo.com
   # Input Password    ${PASSWORD_FILED}    Poiuy123
   Click login button and assert successful login
    #Click Element    ${LOGIN_BUTTON}
    #Assert login was successful
   # Page Should Contain    Rant Dull
    #Capture Page Screenshot
    [Teardown]    Close Browser

Invalid Login
    [Template]    Login with Invalid credentilas should return the correct error message
    #Username                     #Password            #ErrorMessage
    bidemi200@yahoo.com            Poiuy123             Authentication failed
    bidemi2020@yahoo.com           Poiuy12              Authentication failed
    ${EMPTY}                       Poiuy123             An email address required.
    bidemi220@yahoo.com            Poiula               Authentication failed
    ${EMPTY}                       ${EMPTY}             An email address required
    bidemi20202yahoo.com           Poiula               Invalid email address

Invalid Login1 (Wrong User Name)
    [Setup]    Open Browser    http://automationpractice.com/    chrome
    Maximize Browser Window
    Click Element    class:login
    Input Text    id:email    bidemi200@yahoo.com
    Input Password    id:passwd    Poiuy123
    Click Element    id:SubmitLogin
    Page Should Contain    Authentication failed
    Capture Page Screenshot
    [Teardown]    Close Browser

Invalid Login2 (Wrong Password)
    [Setup]    Open Browser    http://automationpractice.com/    chrome
    Maximize Browser Window
    Click Element    class:login
    Input Text    id:email    bidemi200@yahoo.com
    Input Password    id:passwd    Poiuy12
    Click Element    id:SubmitLogin
    Page Should Contain    Authentication failed
    Capture Page Screenshot
    [Teardown]    Close Browser

Invalid Login3 (Ommit User Name)
    [Setup]    Open Browser    http://automationpractice.com/    chrome
    Maximize Browser Window
    Click Element    class:login
    #Input Text    id:    email    bidemi2020@yahoo.com
    Input Password    id:passwd    Poiuy123
    Click Element    id:SubmitLogin
    Page Should Contain    An email address required.
    Capture Page Screenshot
    [Teardown]    Close Browser

*** Keyword ***
Login with Invalid credentilas should return the correct error message
    [Arguments]  ${username}    ${password}    ${error_message}
    Open Browser    http://automationpractice.com/    chrome
    Click Element    ${SIGN_IN_HOMEPAGE}
    Wait Until Element Is Visible    id:email
    Input Text    id:email    ${user_name}
    Input Password    id:passwd    ${password}
    Click Button    id:SubmitLogin
    Page Should Contain    ${error_message}
    [Teardown]    Reload Page
