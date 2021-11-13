*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary

*** Variables ***
${URL}            http://automationpractice.com/index.php
${BROWSER}        chrome    #firefox    #explorer
${SIGN_IN_HOMEPAGE}    class:login
${USERNAME_FIELD}    id:email
${PASSWORD_FIELD}    id:passwd
${LOGIN_BUTTON}    id:SubmitLogin
${USER_EMAIL}     bidemi2020@yahoo.com
${USER_PASSWORD}    Poiuy123
${HOVER_WOMEN}    xpath://*[@id="block_top_menu"]/ul/li[1]/a
${SELECT_BLOUSES}    xpath://*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[2]/a
${SELECT_COLOUR}    xpath://*[@id="ul_layered_id_attribute_group_3"]/li[2]
${HOVER_ITEM}     xpath://*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
${SELECT_MORE}    xpath://*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[2]/span
#${QUANTITY}      xpath://*[@id="quantity_wanted"]
${ADD_TO_CART}    xpath://*[@id="add_to_cart"]/button/span
${PROCEED_TO_CHECKOUT}    xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
${CONFIRM_PROCEED_TO_CHECKOUT}    xpath://*[@id="center_column"]/form/p/button/span
${TERMS_OF_SERVICE}    name:cgv
${PROCEED_TO_CHECKOUT_2}    xpath://*[@id="form"]/p/button/span
${PAYMENT}        xpath://*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
${CONFIRM_ORDER}    xpath://*[@id="cart_navigation"]/button/span

*** Keywords ***
Navigate To Homepage And Click Sign In
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    ${SIGN_IN_HOMEPAGE}

Enter login credentials
    # [Arguments]    #${username}    #    ${password}
    Input Text    ${USERNAME_FIELD}    ${USER_EMAIL}    # ${password}
    Input Text    ${PASSWORD_FIELD}    ${USER_PASSWORD}

Click login button and assert successful login
    Click Element    ${LOGIN_BUTTON}
    Page Should Contain    Rant Dull

Hover the mouse on the dress
    Wait Until Element is Enabled    ${HOVER_WOMEN}
    Mouse Over    ${HOVER_WOMEN}

Select the dress to be purchased
    Wait Until Element is Enabled    ${SELECT_BLOUSES}
    Click Element    ${SELECT_BLOUSES}
    #Select the dress size
    # Wait Until Element is Enabled    ${SELECT_SIZE}
    #Click Element    ${SELECT_SIZE}
    #Select From List By Index    L

Select desired colour
    Wait Until Element is Enabled    ${SELECT_COLOUR}
    Click Element    ${SELECT_COLOUR}

Hover the mouse on desired item
    Wait Until Element is Enabled    ${HOVER_ITEM}
    Mouse Over    ${HOVER_ITEM}

Click on more to continue with purchase
    Wait Until Element is Enabled    ${SELECT_MORE}
    Click Element    ${SELECT_MORE}

Select the desired quantity
    Clear Element Text    ${SELECT_SIZE}
    ${Quantity}=    FakerLibrary.Random Number
    log    ${Quantity}
    Set Variable    ${Quantity}
    Wait Until Element is Enabled    ${SELECT_SIZE}    5s
    #Select specific size
    #Wait Until Element is Enabled    ${SIZE}
    #Click Element    ${SIZE}
    #Select From List By Index    2

Add items to cart
    Wait Until Element is Enabled    ${ADD_TO_CART}    5s
    Click Element    ${ADD_TO_CART}

Proceed to checkout
    Wait Until Element is Enabled    ${PROCEED_TO_CHECKOUT}
    Click Element    ${PROCEED_TO_CHECKOUT}

Confirm proceed to checkout
    Wait Until Element is Enabled    ${CONFIRM_PROCEED_TO_CHECKOUT}
    Click Element    ${CONFIRM_PROCEED_TO_CHECKOUT}

Confirm the terms of service
    Wait Until Element is Enabled    ${TERMS_OF_SERVICE}
    Click Element    ${TERMS_OF_SERVICE}

Proceed to secondary checkout
    Wait Until Element is Enabled    ${PROCEED_TO_CHECKOUT_2}
    Click Element    ${PROCEED_TO_CHECKOUT_2}

Select payment type
    Wait Until Element is Enabled    ${PAYMENT}
    Click Element    ${PAYMENT}

Final order placement
    Wait Until Element is Enabled    ${CONFIRM_ORDER}
    Click Element    ${CONFIRM_ORDER}
