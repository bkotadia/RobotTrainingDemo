*** Settings ***
Library           SeleniumLibrary
Resource          CommonlyUsedKeyWords.txt

*** Variables ***
@{cities}
${City}           ${EMPTY}
@{cars}
${Car}            ${EMPTY}
${textfield}      ${EMPTY}
${i}              ${EMPTY}
${increment}      ${EMPTY}
${SUM}            ${EMPTY}

*** Test Cases ***
OpenBrowser
    Open Browser    http://www.google.com    Chrome
    Close Browser

OpenBrowserIE
    [Documentation]    Open Browser in IE
    Selenium2Library.Open Browser    http://www.google.com    ie
    Selenium2Library.Close Browser

OpenBrowserFirfox
    Open Browser    http://www.google.com    ff
    Close Browser

EnterText
    [Documentation]    This test case will open www.ngendigital.com/practices and Input First name and Last name.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Input Text    name=FirstName    Bhavika
    Input Text    name=LastName    Kotadia
    Close Browser

FacebookClassEx
    [Documentation]    This test case demostrate text input via class
    Open Browser    https://www.facebook.com    chrome
    Maximize Browser Window
    Sleep    2
    Input Text    name=email    Bhavika
    Input Text    name= pass    Kotadia
    Sleep    2
    Close Browser

ListTest
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Select From List By Index    id=FromCity    1
    Sleep    2
    Close Browser

RelativeXpath
    [Documentation]    Testing Relative Xpath method
    Open Browser    https://www.facebook.com    chrome
    Maximize Browser Window
    Sleep    2
    Input Text    xpath://*[@id="email"]    Bhavika
    Input Text    xpath://*[@id="pass"]    Kotadia
    Sleep    2
    Close Browser

AbsoluteXpath
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Input Text    xpath:/html/body/fieldset[6]/form/input[1]    Bhavika
    Input Text    xpath:/html/body/fieldset[6]/form/input[2]    Kotadia
    Sleep    2
    Close Browser

RanorexXpath
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Input Text    xpath://body/fieldset[6]/form[@action='/action_page.php']/input[@name='FirstName']    Bhavika
    Input Text    xpath://body/fieldset[6]/form[@action='/action_page.php']/input[@name='LastName']    Kotadia
    Sleep    2
    Close Browser

CSSlocator
    [Documentation]    Test will demostrate how css selector can be used to input username and password
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Input Text    css:body > fieldset:nth-child(12) > form > input[type=text]:nth-child(1)    Bhavika
    Input Text    css:body > fieldset:nth-child(12) > form > input[type=text]:nth-child(2)    Kotadia
    Sleep    2
    Close Browser

CheckboxAbsoluteXpath
    [Documentation]    Test will check the checkbox BMW using Absolute Xpath
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    xpath:/html/body/fieldset[3]/input[1]
    Sleep    2
    [Teardown]    Close Browser    # Close Browser After test

CheckboxRelativeXpath
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    xpath://input[@value ='bmw']
    Sleep    2
    [Teardown]    Close Browser

TextXpath
    [Documentation]    Using Text of an element to build the xPath. Can only use it when the text is between opening and ending tag like <option value="yyz">Toronto</option>
    ...    If it is not between tags it will not work like this:
    ...    <input type="checkbox" name="car" value="bmw">
    ...    "BMW"
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Element Text Should Be    xpath://option[text()= 'New York']    New York
    Sleep    2
    [Teardown]    Close Browser

CheckboxXpathContains
    [Documentation]    Check the checkbox BMW by using the Contains locator.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    xpath://input[contains(@value, 'bmw')]
    Sleep    2
    [Teardown]    Close Browser

CheckboxXpathStarts-With
    [Documentation]    Check the checkbox BMW by using the Starts with locator.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    xpath://input[starts-with(@value, 'bm')]
    Sleep    2
    [Teardown]    Close Browser

CheckboxXpathIndex
    [Documentation]    Check the checkbox BMW by using the Index locator.
    ...    We can also combine two attributes using 'and' to locate the fields.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    xpath://input[@type = 'checkbox' and @value='bmw']
    Click Element    xpath://input[@type = 'checkbox'][2]
    Sleep    2
    [Teardown]    Close Browser

ListTestCssSelector
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Select From List By Index    css:select#FromCity    1
    Sleep    2
    [Teardown]    Close Browser

ListTestCssSelector2
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Select From List By Index    css:select[id='FromCity']    1
    Sleep    2
    [Teardown]    Close Browser

ListTestCssSelector3
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Select From List By Index    css:#FromCity    1
    Sleep    2
    [Teardown]    Close Browser

PopupXpath
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    xpath://div[@onclick = 'myFunction()']
    Sleep    2
    [Teardown]    Close Browser

PopupCss
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    css:div[onclick='myFunction()']
    Sleep    2
    [Teardown]    Close Browser

PopupCss2
    [Documentation]    css with any string
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    css:div[onclick*='Fun']
    Sleep    2
    [Teardown]    Close Browser

PopupCss3
    [Documentation]    css with start with
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    css:div[onclick^='m']
    Sleep    2
    [Teardown]    Close Browser

PopupCss4
    [Documentation]    css with start with
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    css:div[onclick$='n()']
    Sleep    2
    [Teardown]    Close Browser

ListTestCssSelector4
    [Documentation]    css using children tag system
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Select From List By Index    css:fieldset>select    1
    Sleep    2
    [Teardown]    Close Browser

ListTestCssSelector5
    [Documentation]    css using children tag system
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    css:fieldset>select :first-child
    Sleep    2
    [Teardown]    Close Browser

ListTestCssSelector6
    [Documentation]    css using children tag system. Will select last entry from the list.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    css:fieldset>select :last-child
    Sleep    2
    [Teardown]    Close Browser

ListTestCssSelector7
    [Documentation]    css using children tag system. Will select Chicago from the list.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Click Element    css:fieldset>select :nth-child(3)
    Sleep    2
    [Teardown]    Close Browser

EnterText2
    [Documentation]    This test case will
    ...    1)open www.ngendigital.com/practices
    ...    2) Max window
    ...    3) Check if the Text fields exists - if not, it will show appropriate error we provided. if can also provide info in log for DEBUG, INFO,WARN and NONE mode.
    ...    4) Once the Text fields exists, Add value to the field
    ...    5) Verify the value of the field
    ...    6) Clear the field.
    ...
    ...    In real life scenario, for a given webpage we have to find the username and password text field and verify if they exist, if they exist, add the username and password value and than press the button and clear the fields.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstName']    Field FirstName \ does not exists    Debug
    Page Should Contain Textfield    xpath://input[@name='LastName']    Field LastName \ does not exists    Debug
    Sleep    2
    Input Text    xpath://input[@name='FirstName']    Bhavika
    Input Text    xpath://input[@name='LastName']    Kotadia
    Sleep    2
    Textfield Value Should Be    xpath://input[@name='FirstName']    Bhavika
    Textfield Value Should Be    xpath://input[@name='LastName']    Kotadia
    Sleep    2
    Clear Element Text    xpath://input[@name='FirstName']
    Clear Element Text    xpath://input[@name='LastName']
    Sleep    2
    [Teardown]    Close Browser

EnterLoginFacebookClickLogIn
    [Documentation]    This test case will
    ...    1)open www.facebook.com
    ...    2) Max window
    ...    3) Check if the Text fields exists - if not, it will show appropriate error we provided. if can also provide info in log for DEBUG, WARN and NONE mode.
    ...    4) Once the Text fields exists, Add value to the field
    ...    5) Verify the value of the field
    ...    6) Click the LogIn button
    ...
    ...
    ...    In real life scenario, for a given webpage we have to find the username and password text field and verify if they exist, if they exist, add the username and password value and than press the button and clear the fields.
    Open Browser    https://www.facebook.com    chrome
    Maximize Browser Window
    Sleep    2
    Page Should Contain Textfield    css:#email    Field Username \ does not exists    Debug
    Page Should Contain Textfield    css:#pass    Field Password \ does not exists    Debug
    Sleep    2
    Input Text    css:#email    Demo
    Input Text    css:#pass    Demo1
    Sleep    2
    Textfield Value Should Be    css:#email    Demo
    Textfield Value Should Be    css:#pass    Demo1
    Sleep    2
    Page Should Contain Button    //input[@value= 'Log In']    LogIn Button does not exists    Debug
    Sleep    2
    Click Button    //input[@value= 'Log In']
    Sleep    2
    [Teardown]    Close Browser

CheckboxTC1
    [Documentation]    1) Check the checkbox BMW exists on the page
    ...    2) Select the BMW checkbox
    ...    3) Confirm that BMW checkbox is checked
    ...    4) Unselect the BMW checkbox.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain Checkbox    xpath://input[@value ='bmw']    BMW checkbox does not exists    WARN
    Sleep    2
    Select Checkbox    xpath://input[@value ='bmw']
    Sleep    2
    Checkbox Should Be Selected    xpath://input[@value ='bmw']
    Sleep    2
    Unselect Checkbox    xpath://input[@value ='bmw']
    Sleep    2
    [Teardown]    Close Browser

ListTC1
    [Documentation]    1) Check the List exists on the page
    ...    2) Get all the List items and print all the items on the console
    ...    3) Verify that the List selection is Toronto by default
    ...    4) First Select New York
    ...    5) Second select Chicago
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Page Should Contain List    css:#FromCity    List not found    INFO
    Sleep    2
    @{cities}    Get List Items    css:#FromCity
    : FOR    ${City}    IN    @{cities}
    \    LOG    ${City}
    Sleep    2
    Select From List By Index    css:#FromCity    1
    Sleep    2
    Select From List By Value    css:#FromCity    ord
    Sleep    2
    [Teardown]    Close Browser

ListTC2
    [Documentation]    1) Check the Cars List exists on the page
    ...    2) Get all the List items and print all the items on the console
    ...    3) Verify that the List selection is Volvo by default
    ...    4) First Select Volvo
    ...    5) Second select Saab
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Page Should Contain List    xpath://select[@name ='cars']    List not found    INFO
    Sleep    2
    @{cars}    Get List Items    xpath://select[@name ='cars']
    : FOR    ${Car}    IN    @{cars}
    \    LOG    ${Car}
    Sleep    2
    Select From List By Index    xpath://select[@name ='cars']    1
    Sleep    2
    Select From List By Value    xpath://select[@name ='cars']    audi
    Sleep    2
    [Teardown]    Close Browser

RadioTC1
    [Documentation]    1) Check the radio button exists on the page
    ...    2) Select the second radio button Flight + hotel
    ...    3) Verify that the radio button is set to Flight+hotel
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    Page Should Contain Radio Button    xpath://input[@value='flight']    Radio Button not found    INFO
    Sleep    2
    Select Radio Button    flight    flighthotel
    Sleep    2
    Radio Button Should Be Set To    flight    flighthotel
    Sleep    2
    [Teardown]    Close Browser

ImageTC1
    [Documentation]    1) Check the Image exists on the page
    ...    2) Click the Image and navigate to the home page.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Page Should Contain Image    xpath://*[@id="n-52555261-navBarId"]/div[1]/div/a/img    Image not found    INFO
    Sleep    2
    Click Image    xpath://*[@id="n-52555261-navBarId"]/div[1]/div/a/img
    Sleep    2
    [Teardown]    Close Browser

TableTC1
    [Documentation]    1) Table should be present on the webpage
    ...    2) "Country" column should be present in the table
    ...    3) Canada should be present in the table (using cell)
    ...    4) A colum should have value - Justin
    ...    5) A row should have value - Chancellor
    ...    6) verify that Theresa May is present as the third row and compare 2 strings are equal.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    Table not found    INFO
    Sleep    2
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    Sleep    2
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    Sleep    2
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    Sleep    2
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    Sleep    2
    ${textfield}    Get Text    xpath:/html/body/fieldset[7]/table/tbody/tr[4]/td[1]
    Log To Console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    Sleep    2
    [Teardown]    Close Browser

TableTC2
    [Documentation]    Run a loop and get text from each row and store it in a list.
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    ${i}    Set Variable    1
    ${increment}    Set Variable    1
    ${Sum}    Evaluate    ${i}+${increment}
    LOG    ${Sum}
    while
    [Teardown]    Close Browser

FlightApplicatonTC1
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    select Frame    id=iframe-014
    Login Flight App    support@ngendigital.com    abc123
    Sleep    2
    [Teardown]    Close Browser

FlightApplicatonTC2
    [Documentation]    Verify the error message exists after invalid login.
    ...    Retrieve the message from the element containing the error message.
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    select Frame    id=iframe-014
    Login Flight App    support@ngendigital.com    abc1234
    Sleep    2
    Page Should Contain Element    css:#InvalidLogin > p > label > font
    Sleep    2
    ${increment}    Get Text    css:#InvalidLogin > p > label > font
    [Teardown]    Close Browser

FlightApplicatonExcelRead
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    select Frame    id=iframe-014
    Wait Until Keyword Succeeds    1 min    5s    Login Flight App from Excel
    Sleep    2
    [Teardown]    Close Browser

FlightApplicatonTC3
    [Documentation]    Login with invalid credentials (Refer Assignment 6). Place the expected error message in an Excel cell, and compare the text retrieved from the screen with the text stored in Excel
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    select Frame    id=iframe-014
    Login Flight App    support@ngendigital.com    abc1234
    Sleep    2
    Page Should Contain Element    css:#InvalidLogin > p > label > font
    Sleep    2
    ${increment}    Get Text    css:#InvalidLogin > p > label > font
    Open Excel    C:/Robot Projects/RobotTrainingDemo/LoginData.xls
    Set Global Variable    ${i}
    ${i}    Read Cell Data By Coordinates    sample2    3    0
    Run Keyword If    '${increment}' == '${i}'    Log To Console    Values are same
    [Teardown]    Close Browser

AssignIDtoElement
    [Documentation]    Assign Id to xpath/locator and use that id instead.
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    Assign Id To Element    xpath://tbody/tr[4]/td[3]    pm
    ${num12}    Get Text    pm
    Log    ${num12}
    Capture Page Screenshot
    [Teardown]    close browser

Misc
    [Documentation]    1) See if the Frame contains the text 'Select Example'
    ...    2) see is the 'name' attribute has value 'car' for the xpath of bmw.
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    Current Frame Should Contain    Select Example
    Element Attribute Value Should Be    xpath://input[@value='bmw']    name    car
    [Teardown]    close browser

Disabledelement
    [Documentation]    Check if the given element is disabled.
    Open Browser    https://www.cineplex.com/    chrome
    Maximize Browser Window
    Element Should Be Disabled    xpath://div[@class='selectize-input items not-full disabled locked']//input[@title='Type or Select Movie']
    [Teardown]    close browser

CountElements
    [Documentation]    check if we have 3 checkbox elements for car
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    ${var1}    Get Element Count    //input[@name='car']
    Should Be True    ${var1}==3
    [Teardown]    Close browser

Go back
    Open Browser    https://ngendigital.com/practice    Chrome
    sleep    2
    Go To    https://www.cineplex.com/
    Go Back

URL Verify
    Open Browser    https://ngendigital.com/    chrome
    Location Should Be    https://ngendigital.com/    it is not the same url
    Close Browser
    Open Browser    https://www.gmail.com/    Chrome
    Log Location
    Log Source
    Log Title
    Close browser
    [Teardown]
