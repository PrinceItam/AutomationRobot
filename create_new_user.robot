*** Settings ***
Suite Setup       Navigate To Homepage And Click Sign In
Library           SeleniumLibrary    #Suite Teardown    Close all Browsers
Resource          resources/automation_resource.resource

*** Test Cases ***
Create a New User Account
    #Navigate To Homepage And Click Sign In
    Enter email to create new user
    Click the create an account button
    Select Customer Gender
    Enter User first name
    Enter User last name
    Enter User Password
    Enter User Date of Birth
    Enter Customer Company
    Enter Customer Address
    Enter Customer City
    Select Customer State
    Enter Customer PostCode
    #Select Customer Country
    Enter Customer Phone Number
    Enter Customer Alias
    Click Register Button
