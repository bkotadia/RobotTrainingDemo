*** Settings ***
Resource          UserDefinedKeyWords.txt
Library           DateTime
Library           SeleniumLibrary

*** Variables ***
${var1}           4
${var2}           4
@{USER}           BHAVIKA    \    \    \    SAMIR
&{Credentials}    username=bhavika    password=bhavika
${d}              ${EMPTY}

*** Test Cases ***
TC_01
    [Documentation]    This is my first test case. It is used to compare two variables.
    ...    *Testcase01* _Compare two variables_
    ...    Link is : http://www.google.com
    Should Be Equal    ${var1}    ${var2}

TC_02
    [Tags]    LOGIN
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    @{USER}[0]    @{USER}[1]
    [Teardown]    TeardownDemo

TC_03
    Should Be Equal As Strings    &{Credentials}[username]    &{Credentials}[password]

TC_04
    [Tags]    LOGIN
    Should be True    4    4

TC_05
    [Documentation]    This test will run a same keyword for multiple data.
    [Template]    Should Be Equal As Integers
    4    4
    5    5
    7    9
    4    5
    3    3

TC_06
    Compare Two Variables    5    5

TC_07
    [Documentation]    Print current date to console
    ${d}    DateTime.Get Current Date
    Log To Console    ${d}    UTC
    Log To Console    Hello World

*** Keywords ***
SetupDemo
    Log To Console    This will be the preaction that is run before executing the test case.

TeardownDemo
    Log To Console    This is the teardown action that will be run after the test execution.
