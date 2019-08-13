*** Settings ***
Library           DatabaseLibrary
Library           SeleniumLibrary
Library           Collections

*** Test Cases ***
TC01DatabaseAutomation
    Connect To Database    pymssql    TestDB    User1    User1***    localhost    1433
    @{queryResults}    Description    Select * From Students
    Log Many    @{queryResults}
    @{queryResults}    QUERY    Select * From Students
    Log Many    @{queryResults}
    ${rowCount}    Row Count    Select * From Students
    LOG    ${rowCount}
    Table Must Exist    Students
    Check If Exists In Database    Select FirstName from Students where LastName= 'Kotadia'
    @{queryResults}    QUERY    Select FirstName from Students where LastName= 'Kotadia'
    Log Many    @{queryResults}

TC02-LoginFromDatabase
    Connect To Database    pymssql    TestDB    User1    User1***    localhost    1433
    Table Must Exist    Login1
    @{queryresults}    Query    select Username from Login1 where Id=1
    @{var5}    Convert To List    @{queryresults}
    @{queryresults1}    Query    select Password from Login1 where Id=1
    @{var6}    Convert To List    @{queryresults1}
    Open Browser    https://ngendigital.com/demo-application    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='email']    @{var5}
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='password']    @{var6}
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://div[contains(text(),'Sign In')]
    [Teardown]    Close Browser
