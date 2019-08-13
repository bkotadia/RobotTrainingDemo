*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          CommonKeywords.txt
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC01-Login screen - objects on the page
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Objectonwebpage
    [Teardown]    close browser

TC02_Login screen - default text for username and password
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Defaultvalueusernamepassword
    [Teardown]

TC03_User doesn't enter email
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    EmptyUsername

TC04_User doesn't enter password
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Emptypassword

TC05_User doesn't enter email or password
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    emptyusernamepassword

TC06_User enters invalid email format
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe    id=iframe-014
    Invalidemailformat

TC07_User logs in with valid username and password
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
