*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary    #Documentation automation practice related variables and keyword

*** Variables ***
${URL}            http://automationpractice.com/
${BROWSER}        chrome    #firefox    #explorer
${SIGN_IN_HOMEPAGE}    class:login
${USERNAME_FIELD}    id:email
${PASSWORD_FIELD}    id:passwd
${LOGIN_BUTTON}    id:SubmitLogin
${USER_EMAIL}     bidemi2020@yahoo.com
${USER_PASSWORD}    Poiuy123
${CREATE_NEW_USER_EMAIL_FIELD}    name:email_create
${CREATE_AN_ACCOUNT_BUTTON}    name:SubmitCreate
${USER_GENDER}    name:id_gender
${CUSTOMER_FIRSTNAME}    name:customer_firstname
${CUSTOMER_LASTNAME}    name:customer_lastname
${CUSTOMER_PASSWORD}    id:passwd
${CUSTOMER_DOB_DAY}    name:days
${CUSTOMER_DOB_MONTH}    name:months
${CUSTOMER_DOB_YEAR}    name:years
${SIGN_UP_NEWS_LETTER}    id:uniform-newsletter
${SPECIAL_OFFERS}    id:uniform-optin
${CUSTOMER_COMPANY}    name:company
${CUSTOMER_FIRSTNAME}    name:firstname
${CUSTOMER_LASTNAME}    id:lastname
${CUSTOMER_ADDRESS}    name:address1
${CUSTOMER_CITY}    id:city
${CUSTOMER_STATE}    name:id_state
${CUSTOMER_POSTCODE}    name:postcode
${CUSTOMER_MOBILE_PHONE}    id:phone_mobile
${CUSTOMER_ALIAS}    id:alias
${REGISTER_NEWUSER}    id:submitAccount

*** Keywords ***
Navigate To Homepage And Click Sign In
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${SIGN_IN_HOMEPAGE}

Enter login credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Password    ${PASSWORD_FIELD}   ${password}

Click login button and assert successful login
    Click Element    ${LOGIN_BUTTON}
    Page Should Contain    Rant Dull

Enter email to create new user
    ${email}=    FakerLibrary.email
    log    ${email}
    Set Test Variable    ${email}
    Wait Until Element is Visible    ${CREATE_NEW_USER_EMAIL_FIELD}    4s
    Input Text    ${CREATE_NEW_USER_EMAIL_FIELD}    ${email}

Click the create an account button
    Wait Until Element is Visible    ${CREATE_AN_ACCOUNT_BUTTON}    6s
    Click Element    ${CREATE_AN_ACCOUNT_BUTTON}

Select Customer Gender
    Wait Until Element is Enabled    ${USER_GENDER}    10s
    Click Element    ${USER_GENDER}

Enter User first name
    ${FirstName}=    FakerLibrary.First Name Male
    log    ${FirstName}
    Set Test Variable    ${FirstName}
    Wait Until Element is Visible    ${CUSTOMER_FIRSTNAME}    6s
    Input Text    ${CUSTOMER_FIRSTNAME}    ${FirstName}

Enter User last name
    ${LastName}=    FakerLibrary.Last Name Male
    log    ${LastName}
    Set Test Variable    ${LastName}
    Wait Until Element is Visible    ${CUSTOMER_LASTNAME}    6s
    Input Text    ${CUSTOMER_LASTNAME}    ${LastName}

Enter User Password
    ${Password}=    FakerLibrary.Password
    log    ${Password}
    Set Test Variable    ${Password}
    Wait Until Element is Visible    ${CUSTOMER_PASSWORD}
    Input Text    ${CUSTOMER_PASSWORD}    ${Password}

Enter User Date of Birth
    # Wait Until Element is Visible    ${CUSTOMER_DOB_DAY}    6s
    Select From List By Value    ${CUSTOMER_DOB_DAY}    10
    # Wait Until Element is Visible    ${CUSTOMER_DOB_MONTH}
    Select From List By Value    ${CUSTOMER_DOB_MONTH}    5
    # Wait Until Element is Visible    ${CUSTOMER_DOB_YEAR}    6s
    Select From List By Value    ${CUSTOMER_DOB_YEAR}    1992

Enter Customer Company
    ${Company}=    FakerLibrary.Company
    log    ${Company}
    Set Variable    ${Company}
    Wait Until Element is Visible    ${CUSTOMER_COMPANY}
    Input Text    ${CUSTOMER_COMPANY}    ${Company}

Enter Customer Address
    ${Address}=    FakerLibrary.Address
    log    ${Address}
    Set Variable    ${Address}
    Wait Until Element is Visible    ${CUSTOMER_ADDRESS}
    Input Text    ${CUSTOMER_ADDRESS}    ${Address}

Enter Customer City
    ${City}=    FakerLibrary.City
    log    ${City}
    Set Variable    ${City}
    Wait Until Element Is Visible    ${CUSTOMER_CITY}    7s
    Input Text    ${CUSTOMER_CITY}    ${City}

Select Customer State
    Wait Until Element is Enabled    ${CUSTOMER_STATE}    7s
    Select From List By Index    ${CUSTOMER_STATE}    3

Enter Customer Post Code
    ${Postcode}=    FakerLibrary.Postalcode
    log    ${Postcode}
    Set Variable    ${Postcode}
    Wait Until Element is Enabled    ${CUSTOMER_POSTCODE}
    Input Text    ${CUSTOMER_POSTCODE}    ${Postcode}

Enter Customer Phone Number
    ${PhoneNumber}=    FakerLibrary.Phone Number
    log    ${PhoneNumber}
    Set Variable    ${PhoneNumber}
    Wait Until Element is Enabled    ${CUSTOMER_MOBILE_PHONE}
    Input Text    ${CUSTOMER_MOBILE_PHONE}    ${PhoneNumber}

Enter Customer Alias
    Wait Until Element is Visible    ${CUSTOMER_ALIAS}    6s
    Input Text    ${CUSTOMER_ALIAS}    Noyikowo

Click Register Button
    Wait Until Element is Visible    ${REGISTER_NEWUSER}    6s
    Click Button    ${REGISTER_NEWUSER}
