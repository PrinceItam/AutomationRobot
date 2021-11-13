*** Settings ***
Suite Setup       Navigate To Homepage And Click Sign In
Suite Teardown    Close all Browsers
Library           SeleniumLibrary
Resource          resources/purchase_resource.resource

*** Test Cases ***
Purchase items from the store
    Enter login credentials
    Click login button and assert successful login
    # Enter login credentials
    # Click login button and assert successful login
    Hover the mouse on the dress
    Select the dress to be purchased
    #Select the dress size
    Select desired colour
    Hover the mouse on desired item
    Click on more to continue with purchase
    Select the desired quantity
    #Select specific size
    Add items to cart
    Proceed to checkout
    Confirm proceed to checkout
    Confirm the terms of service
    Proceed to secondary checkout
    Select payment type
    Final order placement
