*** Settings ***
Library           ExcelLibrary

*** Variables ***
${Count1}         ${EMPTY}
${Count2}         ${EMPTY}
${Count3}         ${EMPTY}
@{List1}
@{List2}
@{List3}
${Cellvalue1}     ${EMPTY}
${RowCount}       ${EMPTY}
${Cellvalue2}     ${EMPTY}

*** Test Cases ***
ExcelTC1
    Create Excel Workbook    sample1
    Save Excel    Demo1.xls

ExcelTC2
    [Documentation]    Open Excel
    Open Excel    C:/Robot Projects/RobotTrainingDemo/Demo1.xls

ExcelTC3
    [Documentation]    Open Excel , update cells and save
    Open Excel    C:/Robot Projects/RobotTrainingDemo/Demo1.xls
    Put String To Cell    sample1    0    0    Kotadia
    Put String To Cell    sample1    1    0    crazy
    Put Number To Cell    sample1    0    1    20
    Put Date to Cell    sample1    0    2    20.02.1982
    Save Excel    Demo2.xls

ExcelTC4
    [Documentation]    Open Excel ,read cells
    Open Excel    C:/Robot Projects/RobotTrainingDemo/Demo2.xls
    ${Count1}    Get Column Count    sample1
    ${Count2}    Get Row Count    sample1
    @{List1}     Get Column Values    sample1    2
    :FOR    ${Cellvalue}    IN    @{List1}
    \    LOG    ${Cellvalue}
    @{List2}     Get Row Values    sample1    2
    :FOR    ${Cellvalue}    IN    @{List2}
    \    LOG    ${Cellvalue}
    ${Cellvalue}    Read Cell Data By Coordinates    sample1    0    1
    ${Cellvalue}    Read Cell Data By Name    sample1    A3

ExcelTC5
    [Documentation]    Assume you've an Excel worksheet containing two columns - 'Test Case Name' and 'Execute'. 'Execute' column either contains a 'Yes' or a 'No'. Loop thru the rows of the spreadsheet and print the names of the test cases containing the flag 'Yes'
    ...
    ...    Questions for this assignment
    ...    What keyword will you use to read data from Excel?
    ...
    ...    What will be the logic to loop thru the rows in the spreadsheet?
    Open Excel    C:/Robot Projects/RobotTrainingDemo/Demo2.xls
    @{List1}     Get Column Values    sample2    0
    @{List2}     Get Column Values    sample2    1
    ${RowCount}    Get Row Count    sample2
    :FOR    ${Count1}    IN RANGE    1    ${RowCount}
    \    ${Cellvalue1}    Read Cell Data By Coordinates    sample2    0    ${Count1}
    \    ${Cellvalue2}    Read Cell Data By Coordinates    sample2    1    ${Count1}
    \    Run Keyword If    '${Cellvalue2}' == 'YES'    LOG    ${Cellvalue1}

ExcelTC6
    [Documentation]    Assume you've an Excel worksheet containing two columns - 'Test Case Name' and 'Execute'. 'Execute' column either contains a 'Yes' or a 'No'. Loop thru the rows of the spreadsheet and print the names of the test cases containing the flag 'Yes'
    ...
    ...    Questions for this assignment
    ...    What keyword will you use to read data from Excel?
    ...
    ...    What will be the logic to loop thru the rows in the spreadsheet?
    Open Excel    C:/Robot Projects/RobotTrainingDemo/Demo2.xls
    @{List1}     Get Column Values    sample2    0
    @{List2}     Get Column Values    sample2    1
    ${RowCount}    Get Row Count    sample2
    :FOR    ${Count1}    IN RANGE    1    ${RowCount}
    \    ${Cellvalue1}    Read Cell Data By Coordinates    sample2    0    ${Count1}
    \    ${Cellvalue2}    Read Cell Data By Coordinates    sample2    1    ${Count1}
    \    Run Keyword If    '${Cellvalue2}' == 'YES'    LOG    ${Cellvalue1}
