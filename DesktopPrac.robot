*** Settings ***
Library           SeleniumLibrary
Library           AutoItLibrary
Resource          DesktopKeywords.txt

*** Test Cases ***
OpenCalculator
    Run    calc.exe
    Win Wait Active    Calculator
    Control Click    Calculator    \    Button10
    Win Close    Calculator
    ${abc}    Statusbar Get Text    \    Calculator
    Log    ${abc}

NotepadTest
    Run    notepad.exe
    Win Wait Active    Untitled - Notepad
    Control Set Text    Untitled - Notepad    \    Edit1    I want to add this text in this notepad
    Sleep    2
    Control Send    Untitled - Notepad    \    Edit1    This is my second text
    Sleep    2
    Send    This is my third test
    Win Close    Untitled - Notepad
    Control Click    Notepad    \    Button2

PracticeDemo
    Run    calc.exe
    Win Wait Active    Calculator
    Control Click    Calculator    \    Button10
    Control Click    Calculator    \    Button23
    Control Click    Calculator    \    Button3
    Control Click    Calculator    \    Button28
    Win Close    Calculator
    Run    notepad.exe
    Win Wait Active    Untitled - Notepad
    Control Set Text    Untitled - Notepad    \    Edit1    I want to add this text in this notepad
    Control Send    Untitled - Notepad    \    Edit1    This is my second text
    Send    This is my third test
    ${abc}    Process Exists    notepad.ex
    Log    ${abc}
    Process Close    notepad.exe
    Run Wait    calc.exe
    ${abc}    Statusbar Get Text    \    Calculator
    Log    ${abc}

TC01-CreateOrder
    Login
    Enter Option    1
    Input Order
    Verify Confirmation
    Win Close    Options

TC2-VerifyOrder
    Login
    Enter Option    2
    ViewOrder1
    Win Close    Options
