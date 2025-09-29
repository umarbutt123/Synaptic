Feature: 26-Reports

    As a user on the unified portal Application
    I want to verify reports screen

    Background: Enter UserId and Password and perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-01 - Performing validation of Standard Reports for both Operator and Distributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        Then I verify reports page header is visible <HEADER>
        And I verify available standard reports <REPORT1> <REPORT2> <REPORT3> <REPORT4> <REPORT5>
        Examples:
            | USERNAME   | PASSWORD | HEADER               | REPORT1             | REPORT2    | REPORT3   | REPORT4         | REPORT5            |
            | "Operator" | "2023"   | "Reports Management" | "Marketing Reports" | "Reseller" | "Support" | "Sales Reports" | "Campaign Reports" |
            | "MD1"      | "2023"   | "Reports Management" | "Marketing Reports" | "Reseller" | "Support" | "Sales Reports" | ""                 |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-03 Performing validation of search fields, columns and download functionality in Electronic Recharge Per Day Report available in the Marketing Reports menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        And I enter From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT              | REPORT_NAME                   | FIELD1      | FIELD2    | FIELD3    | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1            | COLUMN2   | COLUMN3     | COLUMN4      | COLUMN5     | COLUMN6      | COLUMN7    | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Marketing Reports" | "Electronic Recharge Per Day" | "From Date" | "To Date" | "Channel" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Aggregation Date" | "Channel" | "R2R Count" | "R2R Amount" | "R2S Count" | "R2S Amount" | "Currency" | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Marketing Reports" | "Electronic Recharge Per Day" | "From Date" | "To Date" | "Channel" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Aggregation Date" | "Channel" | "R2R Count" | "R2R Amount" | "R2S Count" | "R2S Amount" | "Currency" | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-04 User is able to fetch Electronic Recharge Report as per Date and Channel
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Channel to fetch report data <CHANNEL>
        And I click on submit button
        Then Data should be available in the grid <REPORT_NAME>
        When I enter keyword in Grid Search field to fetch report data <KEYWORD>
        Then Data should be available in the grid <REPORT_NAME>
        When I click on export button
        And I click on export CSV button
        Then I delete the file name <REPORT_NAME>
        When I click on export button
        And I click on export PDF button
        Then I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT              | REPORT_NAME                   | CHANNEL | KEYWORD |
            | "Operator" | "2023"   | "Marketing Reports" | "Electronic Recharge Per Day" | "WEB"   | "SDG"   |
            | "MD1"      | "2023"   | "Marketing Reports" | "Electronic Recharge Per Day" | "WEB"   | "SDG"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-05 Performing validation of search fields, columns and download functionality in Transaction Statistics Report available in the Marketing Reports menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        And I verify Total Count, Amount and Currency labels are available in grid <TRANSACTION_COUNT_LABEL> <TRANSACTION_AMOUNT_LABEL> <CURRENCY>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT              | REPORT_NAME              | FIELD1      | FIELD2    | FIELD3    | FIELD4         | FIELD5             | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1   | COLUMN2        | COLUMN3            | COLUMN4                        | COLUMN5                         | COLUMN6    | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | TRANSACTION_COUNT_LABEL              | TRANSACTION_AMOUNT_LABEL              | CURRENCY   | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Marketing Reports" | "Transaction Statistics" | "From Date" | "To Date" | "Channel" | "Account Type" | "Transaction Type" | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Channel" | "Account Type" | "Transaction Type" | "Successful Transaction Count" | "Successful Transaction Amount" | "Currency" | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Total Successful Transaction Count" | "Total Successful Transaction Amount" | "Currency" | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Marketing Reports" | "Transaction Statistics" | "From Date" | "To Date" | "Channel" | "Account Type" | "Transaction Type" | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Channel" | "Account Type" | "Transaction Type" | "Successful Transaction Count" | "Successful Transaction Amount" | "Currency" | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Total Successful Transaction Count" | "Total Successful Transaction Amount" | "Currency" | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-06 User is able to fetch Transaction Statistics Report as per Date, Channel, Account Type and Transaction Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Channel to fetch report data <CHANNEL>
        When I click on submit button
        Then Data should be available in the grid <REPORT_NAME>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <ACCOUNT_TYPE>
        When I click on Navigation Toolbar Icon
        And I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> "" <ACCOUNT_TYPE> <TRANSACTION_TYPE>
        Examples:
            | USERNAME   | PASSWORD | REPORT              | REPORT_NAME              | CHANNEL | ACCOUNT_TYPE | TRANSACTION_TYPE  |
            | "Operator" | "2023"   | "Marketing Reports" | "Transaction Statistics" | "WEB"   | "RESELLER"   | "CREDIT_TRANSFER" |
            | "MD1"      | "2023"   | "Marketing Reports" | "Transaction Statistics" | "WEB"   | "RESELLER"   | "CREDIT_TRANSFER" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-07 Performing validation of search fields, columns and download functionality in Reseller Balance Report available in the Reseller menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT     | REPORT_NAME               | RESELLER_TYPE      | RESELLER_ID | FIELD1          | FIELD2        | FIELD3         | FIELD4   | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1     | COLUMN2       | COLUMN3         | COLUMN4           | COLUMN5        | COLUMN6  | COLUMN7           | COLUMN8           | COLUMN9         | COLUMN10          | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Reseller" | "Reseller Balance Report" | "Main Distributor" | "MD1"       | "Reseller Type" | "Reseller Id" | "Account Type" | "Region" | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Date Time" | "Reseller Id" | "Reseller Name" | "Reseller MSISDN" | "Account Type" | "Region" | "Reseller Parent" | "Reseller Status" | "Reseller Type" | "Current Balance" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-08 Performing validation of search fields, columns and download functionality in Reseller Balance By Hierarchy Report available in the Reseller menu for MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT     | REPORT_NAME               | RESELLER_TYPE      | FIELD1        | FIELD2          | FIELD3         | FIELD4   | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | RESELLER_ID | COLUMN1     | COLUMN2       | COLUMN3         | COLUMN4           | COLUMN5        | COLUMN6  | COLUMN7           | COLUMN8           | COLUMN9         | COLUMN10          | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD1"    | "2023"   | "Reseller" | "Reseller Balance Report" | "Main Distributor" | "Reseller Id" | "Reseller Type" | "Account Type" | "Region" | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "MD1"       | "Date Time" | "Reseller Id" | "Reseller Name" | "Reseller MSISDN" | "Account Type" | "Region" | "Reseller Parent" | "Reseller Status" | "Reseller Type" | "Current Balance" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-09 User is able to fetch Reseller Balance Report as per Reseller Id, Reseller Type, Account Type and Region
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        When I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <ACCOUNT_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Region to fetch report data <REGION>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <ACCOUNT_TYPE> <RESELLER_LEVEL> <REGION>
        Examples:
            | USERNAME   | PASSWORD | REPORT     | REPORT_NAME               | RESELLER_ID | RESELLER_TYPE      | ACCOUNT_TYPE | REGION    | RESELLER_LEVEL    |
            | "Operator" | "2023"   | "Reseller" | "Reseller Balance Report" | "MD1"       | "Main Distributor" | "RESELLER"   | "Central" | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-10 User is able to fetch Reseller Balance By Hierarchy Report as per Reseller Id, Reseller Type, Account Type and Region
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        When I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch hierarchy report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <ACCOUNT_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Region to fetch report data <REGION>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <ACCOUNT_TYPE> <RESELLER_LEVEL> <REGION>
        Examples:
            | USERNAME | PASSWORD | REPORT     | REPORT_NAME               | RESELLER_ID | RESELLER_TYPE      | ACCOUNT_TYPE | REGION    | RESELLER_LEVEL    |
            | "MD1"    | "2023"   | "Reseller" | "Reseller Balance Report" | "MD1"       | "Main Distributor" | "RESELLER"   | "Central" | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-11 Performing validation of search fields, columns and download functionality in Top Reseller Report available in the Reseller menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT    | REPORT_NAME    | RESELLER_TYPE      | RESELLER_ID | FIELD1      | FIELD2    | FIELD3          | FIELD4         | FIELD5    | FIELD6   | FIELD7        | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1          | COLUMN2        | COLUMN3         | COLUMN4       | COLUMN5           | COLUMN6  | COLUMN7    | COLUMN8    | COLUMN9  | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Support" | "Top Reseller" | "Main Distributor" | "MD1"       | "From Date" | "To Date" | "Reseller Type" | "Account Type" | "Sort By" | "Region" | "Reseller Id" | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Reseller Level" | "Account Type" | "Reseller Name" | "Reseller Id" | "Reseller MSISDN" | "Amount" | "Quantity" | "Currency" | "Region" | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-12 Performing validation of search fields, columns and download functionality in Top Reseller By Hierarchy Report available in the Reseller menu for MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT    | REPORT_NAME    | RESELLER_TYPE      | FIELD1      | FIELD2    | FIELD3          | FIELD4         | FIELD5    | FIELD6   | FIELD7        | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | RESELLER_ID | COLUMN1          | COLUMN2        | COLUMN3         | COLUMN4       | COLUMN5           | COLUMN6  | COLUMN7    | COLUMN8    | COLUMN9  | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD1"    | "2023"   | "Support" | "Top Reseller" | "Main Distributor" | "From Date" | "To Date" | "Reseller Type" | "Account Type" | "Sort By" | "Region" | "Reseller Id" | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "MD1"       | "Reseller Level" | "Account Type" | "Reseller Name" | "Reseller Id" | "Reseller MSISDN" | "Amount" | "Quantity" | "Currency" | "Region" | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-13 User is able to fetch Top Reseller Report as per Date, Reseller Type, Reseller Id, Account Type, Region and Sort By option
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <ACCOUNT_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Region to fetch report data <REGION>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <REGION>
        When I click on Navigation Toolbar Icon
        And I enter Sort By option to fetch report data <SORT_BY>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <REGION> <ACCOUNT_TYPE> <RESELLER_LEVEL>
        Examples:
            | USERNAME   | PASSWORD | REPORT    | REPORT_NAME    | RESELLER_ID | RESELLER_TYPE      | ACCOUNT_TYPE | SORT_BY  | REGION    | RESELLER_LEVEL    |
            | "Operator" | "2023"   | "Support" | "Top Reseller" | "MD1"       | "Main Distributor" | "RESELLER"   | "Amount" | "Central" | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-14 User is able to fetch Top Reseller By Hierarchy Report as per Date, Reseller Id, Reseller Type, Account Type, Region and Sort By option
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <ACCOUNT_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Region to fetch report data <REGION>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <REGION>
        When I click on Navigation Toolbar Icon
        And I enter Sort By option to fetch report data <SORT_BY>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <REGION> <ACCOUNT_TYPE> <RESELLER_LEVEL>
        Examples:
            | USERNAME | PASSWORD | REPORT    | REPORT_NAME    | RESELLER_TYPE      | RESELLER_ID | ACCOUNT_TYPE | SORT_BY  | REGION    | RESELLER_LEVEL    |
            | "MD1"    | "2023"   | "Support" | "Top Reseller" | "Main Distributor" | "MD1"       | "RESELLER"   | "Amount" | "Central" | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-15 Performing validation of search fields, columns and download functionality in Transaction Failure Causes Report available in the Support menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT    | REPORT_NAME                         | FIELD1      | FIELD2    | FIELD3    | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1   | COLUMN2            | COLUMN3                    | COLUMN4          | COLUMN5 | COLUMN6 | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Support" | "Transaction Failure Causes Report" | "From Date" | "To Date" | "Channel" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Channel" | "Transaction Type" | "Failed Transaction Count" | "Failure Reason" | ""      | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Support" | "Transaction Failure Causes Report" | "From Date" | "To Date" | "Channel" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Channel" | "Transaction Type" | "Failed Transaction Count" | "Failure Reason" | ""      | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-16 User is able to fetch Transaction Failure Causes Report as per Date and Channel
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Channel to fetch report data <CHANNEL>
        And I click on submit button
        Then Data should be available in the grid <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT    | REPORT_NAME                         | CHANNEL |
            | "Operator" | "2023"   | "Support" | "Transaction Failure Causes Report" | "WEB"   |
            | "MD1"      | "2023"   | "Support" | "Transaction Failure Causes Report" | "WEB"   |

    @ss-report-not-applicable
    Scenario Outline: STD-01 - Performing validation of search fields, columns and download functionality in Hourly Usage Statistics Report available in the Support menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter Date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT    | REPORT_NAME              | FIELD1 | FIELD2 | FIELD3    | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2 | COLUMN3   | COLUMN4        | COLUMN5         | COLUMN6        | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Support" | "Hourly Usage Statistic" | "Date" | ""     | "Channel" | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "Date"  | "Hours" | "Channel" | "Hourly Total" | "Success Count" | "Failed Count" | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @ss-report-not-applicable
    Scenario Outline: STD-02 Verify that Hourly Usage Statistic Report is not available for unauthorised user
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        Then I verify that the sub report is not available <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT    | REPORT_NAME              |
            | "MD1"    | "2023"   | "Support" | "Hourly Usage Statistic" |

    @ss-report-not-applicable
    Scenario Outline: STD-03 User is able to fetch Hourly Usage Statistic Report as per Date and Channel
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter Date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Channel to fetch report data <CHANNEL>
        And I click on submit button
        Then Data should be available in the grid <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT    | REPORT_NAME              | CHANNEL |
            | "Operator" | "2023"   | "Support" | "Hourly Usage Statistic" | "WEB"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-17 Performing validation of search fields, columns and download functionality in Reseller With Zero Balance Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_TYPE | RESELLER_ID | FIELD1      | FIELD2    | FIELD3          | FIELD4         | FIELD5        | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1         | COLUMN2       | COLUMN3           | COLUMN4        | COLUMN5                    | COLUMN6                      | COLUMN7                         | COLUMN8    | COLUMN9  | COLUMN10  | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Reseller With Zero Balance" | "PoS"         | "POS16"     | "From Date" | "To Date" | "Reseller Type" | "Account Type" | "Reseller Id" | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Reseller Type" | "Reseller Id" | "Reseller MSISDN" | "Account Type" | "Last Date of Transaction" | "Amount Of Last Transaction" | "Total Credit Since Activation" | "Currency" | "Region" | "Balance" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-18 Performing validation of search fields, columns and download functionality in Reseller With Zero Balance By Hierarchy Report available in the Sales Reports menu for MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_TYPE | FIELD1      | FIELD2    | FIELD3          | FIELD4         | FIELD5        | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | RESELLER_ID | COLUMN1         | COLUMN2       | COLUMN3           | COLUMN4        | COLUMN5                    | COLUMN6                      | COLUMN7                         | COLUMN8    | COLUMN9  | COLUMN10  | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD1"    | "2023"   | "Sales Reports" | "Reseller With Zero Balance" | "PoS"         | "From Date" | "To Date" | "Reseller Type" | "Account Type" | "Reseller Id" | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "POS16"     | "Reseller Type" | "Reseller Id" | "Reseller MSISDN" | "Account Type" | "Last Date of Transaction" | "Amount Of Last Transaction" | "Total Credit Since Activation" | "Currency" | "Region" | "Balance" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-19 User is able to fetch Reseller With Zero Balance Report as per Date, Reseller Level and Account Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        When I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> <ACCOUNT_TYPE> <RESELLER_TYPE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_TYPE | ACCOUNT_TYPE | RESELLER_ID |
            | "Operator" | "2023"   | "Sales Reports" | "Reseller With Zero Balance" | "PoS"         | "RESELLER"   | "POS16"     |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-20 User is able to fetch Reseller With Zero Balance By Hierarchy Report as per Date, Reseller Id, Reseller Level and Account Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        When I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> <ACCOUNT_TYPE> <RESELLER_TYPE>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_TYPE | RESELLER_ID | ACCOUNT_TYPE |
            | "MD1"    | "2023"   | "Sales Reports" | "Reseller With Zero Balance" | "PoS"         | "POS16"     | "RESELLER"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-21 Performing validation of search fields, columns and download functionality in Active Inactive Reseller Report available in the Sales Reports menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                | FIELD1      | FIELD2    | FIELD3 | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1       | COLUMN2        | COLUMN3          | COLUMN4   | COLUMN5     | COLUMN6 | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Active Inactive Reseller" | "From Date" | "To Date" | ""     | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Total Count" | "Active Count" | "Inactive Count" | "Active%" | "Inactive%" | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Sales Reports" | "Active Inactive Reseller" | "From Date" | "To Date" | ""     | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Total Count" | "Active Count" | "Inactive Count" | "Active%" | "Inactive%" | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-22 User is able to fetch Active Inactive Reseller Report as per Date
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then Data should be available in the grid <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                |
            | "Operator" | "2023"   | "Sales Reports" | "Active Inactive Reseller" |
            | "MD1"      | "2023"   | "Sales Reports" | "Active Inactive Reseller" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-23 Performing validation of search fields, columns and download functionality in Dormant Reseller Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter Current Date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME        | RESELLER_TYPE      | RESELLER_ID | FIELD1      | FIELD2          | FIELD3        | FIELD4         | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1       | COLUMN2           | COLUMN3         | COLUMN4                 | COLUMN5           | COLUMN6                 | COLUMN7                         | COLUMN8           | COLUMN9    | COLUMN10 | COLUMN11     | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Dormant Reseller" | "Main Distributor" | "MD2"       | "From Date" | "Reseller Type" | "Reseller Id" | "Account Type" | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Reseller Id" | "Reseller MSISDN" | "Reseller Type" | "Last Transaction Date" | "Receiver MSISDN" | "Last Transaction Type" | "Total Credit Since Activation" | "Current Balance" | "Currency" | "Ageing" | "Account Id" | "Region" | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-24 Performing validation of search fields, columns and download functionality in Dormant Reseller By Hierarchy Report available in the Sales Reports menu for MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter Current Date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME        | RESELLER_TYPE      | FIELD1      | FIELD2          | FIELD3        | FIELD4         | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | RESELLER_ID | COLUMN1       | COLUMN2           | COLUMN3         | COLUMN4                 | COLUMN5           | COLUMN6                 | COLUMN7                         | COLUMN8           | COLUMN9    | COLUMN10 | COLUMN11     | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD2"    | "2023"   | "Sales Reports" | "Dormant Reseller" | "Main Distributor" | "From Date" | "Reseller Type" | "Reseller Id" | "Account Type" | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "MD2"       | "Reseller Id" | "Reseller MSISDN" | "Reseller Type" | "Last Transaction Date" | "Receiver MSISDN" | "Last Transaction Type" | "Total Credit Since Activation" | "Current Balance" | "Currency" | "Ageing" | "Account Id" | "Region" | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-25 User is able to fetch Dormant Reseller Report as per Date, Reseller Id, Reseller Type and Account Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter Current Date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> "" <RESELLER_LEVEL>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME        | RESELLER_ID | RESELLER_TYPE      | ACCOUNT_TYPE | RESELLER_LEVEL    |
            | "Operator" | "2023"   | "Sales Reports" | "Dormant Reseller" | "MD2"       | "Main Distributor" | "RESELLER"   | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-26 User is able to fetch Dormant Reseller By Hierarchy Report as per Date, Reseller Id, Reseller Type and Account Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter Current Date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Account Type to fetch report data <ACCOUNT_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> "" <RESELLER_LEVEL>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME        | RESELLER_ID | RESELLER_TYPE      | ACCOUNT_TYPE | RESELLER_LEVEL    |
            | "MD2"    | "2023"   | "Sales Reports" | "Dormant Reseller" | "MD2"       | "Main Distributor" | "RESELLER"   | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-27 Performing validation of search fields, columns and download functionality in Extended Transaction Details Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available in Transaction Details Grid <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13> <COLUMN14> <COLUMN15> <COLUMN16> <COLUMN17> <COLUMN18> <COLUMN19> <COLUMN20> <COLUMN21>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                           | RESELLER_TYPE      | RESELLER_ID | TRANSACTION_TYPE  | FIELD1      | FIELD2    | FIELD3             | FIELD4          | FIELD5 | FIELD6        | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2         | COLUMN3            | COLUMN4         | COLUMN5          | COLUMN6           | COLUMN7              | COLUMN8               | COLUMN9                     | COLUMN10 | COLUMN11             | COLUMN12   | COLUMN13        | COLUMN14   | COLUMN15    | COLUMN16  | COLUMN17    | COLUMN18    | COLUMN19 | COLUMN20 | COLUMN21 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Extended Transaction Details Report" | "Main Distributor" | "MD1"       | "CREDIT_TRANSFER" | "From Date" | "To Date" | "Transaction Type" | "Reseller Type" | ""     | "Reseller Id" | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Date"  | "ERS Reference" | "Client Reference" | "Sender MSISDN" | "Sender Balance" | "Receiver MSISDN" | "Transaction Amount" | "Transaction Profile" | "Product Name/Denomination" | "Status" | "Sender Reseller Id" | "Currency" | "Sender Region" | "Latitude" | "Longitude" | "Cell ID" | "Cell Name" | "Site Name" | "Area"   | "City"   | "State"  | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-27 Performing validation of search fields, columns and download functionality in Transaction Details Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available in Transaction Details Grid <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13> <COLUMN14> <COLUMN15> <COLUMN16> <COLUMN17> <COLUMN18> <COLUMN19> <COLUMN20> <COLUMN21>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_TYPE      | RESELLER_ID | TRANSACTION_TYPE | FIELD1      | FIELD2    | FIELD3             | FIELD4          | FIELD5 | FIELD6        | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2         | COLUMN3            | COLUMN4         | COLUMN5          | COLUMN6           | COLUMN7              | COLUMN8               | COLUMN9                     | COLUMN10 | COLUMN11             | COLUMN12   | COLUMN13        | COLUMN14   | COLUMN15    | COLUMN16  | COLUMN17    | COLUMN18    | COLUMN19 | COLUMN20 | COLUMN21 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Transaction Details Report" | "Main Distributor" | "MD1"       | "ALL"            | "From Date" | "To Date" | "Transaction Type" | "Reseller Type" | ""     | "Reseller Id" | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Date"  | "ERS Reference" | "Client Reference" | "Sender MSISDN" | "Sender Balance" | "Receiver MSISDN" | "Transaction Amount" | "Transaction Profile" | "Product Name/Denomination" | "Status" | "Sender Reseller Id" | "Currency" | "Sender Region" | "Latitude" | "Longitude" | "Cell ID" | "Cell Name" | "Site Name" | "Area"   | "City"   | "State"  | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-28 Performing validation of search fields, columns and download functionality in Transaction Details By Hierarchy Report available in the Sales Reports menu for MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        When I click on submit button
        Then I verify all the column names are available in Transaction Details Grid <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13> <COLUMN14> <COLUMN15> <COLUMN16> <COLUMN17> <COLUMN18> <COLUMN19> <COLUMN20> <COLUMN21>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME           | RESELLER_TYPE      | RESELLER_ID | FIELD1      | FIELD2    | FIELD3                | FIELD4          | FIELD5 | FIELD6        | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2         | COLUMN3            | COLUMN4         | COLUMN5          | COLUMN6           | COLUMN7              | COLUMN8               | COLUMN9                     | COLUMN10 | COLUMN11             | COLUMN12   | COLUMN13        | COLUMN14   | COLUMN15    | COLUMN16  | COLUMN17    | COLUMN18    | COLUMN19 | COLUMN20 | COLUMN21 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD1"    | "2023"   | "Sales Reports" | "Transaction Details" | "Main Distributor" | "MD1"       | "From Date" | "To Date" | "transaction_profile" | "Reseller Type" | ""     | "Reseller Id" | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Date"  | "ERS Reference" | "Client Reference" | "Sender MSISDN" | "Sender Balance" | "Receiver MSISDN" | "Transaction Amount" | "Transaction Profile" | "Product Name/Denomination" | "Status" | "Sender Reseller Id" | "Currency" | "Sender Region" | "Latitude" | "Longitude" | "Cell ID" | "Cell Name" | "Site Name" | "Area"   | "City"   | "State"  | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-29 User is able to fetch Extended Transaction Details Report as per Date, Transaction Type, Reseller Type and Reseller Id
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> <TRANSACTION_TYPE> ""
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                           | TRANSACTION_TYPE  | RESELLER_TYPE      | RESELLER_ID |
            | "Operator" | "2023"   | "Sales Reports" | "Extended Transaction Details Report" | "CREDIT_TRANSFER" | "Main Distributor" | "MD1"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-29 User is able to fetch Transaction Details Report as per Date, Transaction Type, Reseller Type and Reseller Id
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> <TRANSACTION_TYPE> ""
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  | TRANSACTION_TYPE  | RESELLER_TYPE      | RESELLER_ID |
            | "Operator" | "2023"   | "Sales Reports" | "Transaction Details Report" | "CREDIT_TRANSFER" | "Main Distributor" | "MD1"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-30 User is able to fetch Transaction Details By Hierarchy Report as per as per Date, Transaction Profile, Reseller Type and Reseller Id
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Transaction Profile to fetch report data <TRANSACTION_PROFILE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> "" <TRANSACTION_PROFILE>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME           | TRANSACTION_PROFILE | RESELLER_ID | RESELLER_TYPE      |
            | "MD1"    | "2023"   | "Sales Reports" | "Transaction Details" | "CREDIT_TRANSFER"   | "MD1"       | "Main Distributor" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-04 Performing validation of search fields, columns and download functionality in Hourly Usage Statistics Sales Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter Date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                     | FIELD1 | FIELD2 | FIELD3    | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2 | COLUMN3   | COLUMN4               | COLUMN5  | COLUMN6    | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Hourly Usage Statistics Sales" | "Date" | ""     | "Channel" | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "Date"  | "Hours" | "Channel" | "No. of Transactions" | "Amount" | "Currency" | ""      | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-05 Verify that Hourly Usage Statistics Sales Report is not available for unauthorised user
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        Then I verify that the sub report is not available <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME                     |
            | "MD1"    | "2023"   | "Sales Reports" | "Hourly Usage Statistics Sales" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-06 User is able to fetch Hourly Usage Statistics Sales Report as per Date and Channel
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter Date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Channel to fetch report data <CHANNEL>
        And I click on submit button
        Then Data should be available in the grid <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                     | CHANNEL |
            | "Operator" | "2023"   | "Sales Reports" | "Hourly Usage Statistics Sales" | "WEB"   |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-07 Performing validation of search fields, columns and download functionality in Daily Transaction Count Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME               | FIELD1      | FIELD2    | FIELD3    | FIELD4          | FIELD5   | FIELD6 | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2   | COLUMN3         | COLUMN4  | COLUMN5             | COLUMN6    | COLUMN7                    | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Daily Transaction Count" | "From Date" | "To Date" | "Channel" | "Reseller Type" | "Region" | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "Date"  | "Channel" | "Reseller Type" | "Region" | "Transaction Count" | "Currency" | "Total Transaction Amount" | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-08 Verify that Daily Transaction Count Report is not available for unauthorised user
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        Then I verify that the sub report is not available <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME               |
            | "MD1"    | "2023"   | "Sales Reports" | "Daily Transaction Count" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-09 User is able to fetch Daily Transaction Count Report as per Date, Channel, Reseller Type and Region
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Channel to fetch report data <CHANNEL>
        And I click on submit button
        Then Data should be available in the grid <REPORT_NAME>
        When I click on Navigation Toolbar Icon
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Region to fetch report data <REGION>
        When I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_TYPE> "" <REGION>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME               | CHANNEL | RESELLER_TYPE | REGION    |
            | "Operator" | "2023"   | "Sales Reports" | "Daily Transaction Count" | "WEB"   | "Distributor" | "Central" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-10 Performing validation of search fields, columns and download functionality in Region Based Reseller Account Statement Report available in the Reseller menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT     | REPORT_NAME                               | FIELD1      | FIELD2    | FIELD3          | FIELD4        | FIELD5   | FIELD6 | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1   | COLUMN2         | COLUMN3         | COLUMN4           | COLUMN5           | COLUMN6        | COLUMN7       | COLUMN8  | COLUMN9    | COLUMN10          | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Reseller" | "Region Based Reseller Account Statement" | "From Date" | "To Date" | "Reseller Type" | "Reseller Id" | "Region" | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "User Id" | "Reseller Name" | "Reseller Type" | "Account Type Id" | "Current Balance" | "transfer_out" | "transfer_in" | "Region" | "Currency" | "opening_balance" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Reseller" | "Region Based Reseller Account Statement" | "From Date" | "To Date" | "Reseller Type" | "Reseller Id" | "Region" | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "User Id" | "Reseller Name" | "Reseller Type" | "Account Type Id" | "Current Balance" | "transfer_out" | "transfer_in" | "Region" | "Currency" | "opening_balance" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-11 User is able to fetch Region Based Reseller Account Statement as per Date, Reseller ID, Reseller Type and Region
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        When I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Region to fetch report data <REGION>
        When I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_TYPE> <RESELLER_ID> <REGION>
        Examples:
            | USERNAME   | PASSWORD | REPORT     | REPORT_NAME                               | RESELLER_ID | RESELLER_TYPE     | REGION    |
            | "Operator" | "2023"   | "Reseller" | "Region Based Reseller Account Statement" | "MD1"       | "MainDistributor" | "Central" |
            | "MD1"      | "2023"   | "Reseller" | "Region Based Reseller Account Statement" | "MD1"       | "MainDistributor" | "Central" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-31 Performing validation of search fields, columns and download functionality in Transaction Summary Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And  I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_TYPE      | RESELLER_ID | FIELD1      | FIELD2    | FIELD3             | FIELD4        | FIELD5          | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1       | COLUMN2           | COLUMN3         | COLUMN4            | COLUMN5           | COLUMN6           | COLUMN7             | COLUMN8    | COLUMN9              | COLUMN10        | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Transaction Summary Report" | "Main Distributor" | "MD1"       | "From Date" | "To Date" | "Transaction Type" | "Reseller Id" | "Reseller Type" | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Reseller Id" | "Reseller MSISDN" | "Reseller Type" | "Transaction Type" | "Current Balance" | "Reseller Parent" | "Transaction Count" | "Currency" | "Transaction Amount" | "Reseller Path" | "Region" | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-32 User is able to fetch Transaction Summary Report as per Date, Reseller ID and Transaction Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> <TRANSACTION_TYPE> <RESELLER_LEVEL>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_TYPE      | RESELLER_ID | TRANSACTION_TYPE  | RESELLER_LEVEL    |
            | "Operator" | "2023"   | "Sales Reports" | "Transaction Summary Report" | "Main Distributor" | "MD1"       | "CREDIT_TRANSFER" | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-33 Performing validation of search fields, columns and download functionality in Transaction Summary By Hierarchy Report available in the Reseller menu for MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter From date and To date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT     | REPORT_NAME           | RESELLER_TYPE      | FIELD1      | FIELD2    | FIELD3                | FIELD4        | FIELD5          | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | RESELLER_ID | COLUMN1       | COLUMN2           | COLUMN3         | COLUMN4            | COLUMN5           | COLUMN6           | COLUMN7             | COLUMN8    | COLUMN9              | COLUMN10        | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD1"    | "2023"   | "Reseller" | "Transaction Summary" | "Main Distributor" | "From Date" | "To Date" | "transaction_profile" | "Reseller Id" | "Reseller Type" | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "MD1"       | "Reseller Id" | "Reseller MSISDN" | "Reseller Type" | "Transaction Type" | "Current Balance" | "Reseller Parent" | "Transaction Count" | "Currency" | "Transaction Amount" | "Reseller Path" | "Region" | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-34 User is able to fetch Transaction Summary By Hierarchy Report as per Date, Reseller ID and Transaction Profile
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        When I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Transaction Profile to fetch report data <TRANSACTION_PROFILE>
        When I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <TRANSACTION_PROFILE> <RESELLER_ID> <RESELLER_LEVEL>
        Examples:
            | USERNAME | PASSWORD | REPORT     | REPORT_NAME           | RESELLER_ID | RESELLER_TYPE      | TRANSACTION_PROFILE | RESELLER_LEVEL    |
            | "MD1"    | "2023"   | "Reseller" | "Transaction Summary" | "MD1"       | "Main Distributor" | "CREDIT_TRANSFER"   | "MainDistributor" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-12 Performing validation of search fields, columns and download functionality in Bulk Topup-transfer Report available in the Sales Reports menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  | FIELD1      | FIELD2    | FIELD3          | FIELD4     | FIELD5        | FIELD6 | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1                 | COLUMN2    | COLUMN3     | COLUMN4         | COLUMN5         | COLUMN6       | COLUMN7           | COLUMN8  | COLUMN9               | COLUMN10             | COLUMN11           | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Bulk Topup-transfer Report" | "From Date" | "To Date" | "VMS Reference" | "Batch Id" | ""            | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "transaction_reference" | "batch_id" | "seller_id" | "seller_msisdn" | "seller_region" | "receiver_id" | "Receiver Msisdn" | "Amount" | "transaction_profile" | "transaction_status" | "transaction_date" | ""       | ""       | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Sales Reports" | "Bulk Topup-transfer Report" | "From Date" | "To Date" | "VMS Reference" | "Batch Id" | "Reseller Id" | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "transaction_reference" | "batch_id" | "seller_id" | "seller_msisdn" | "seller_region" | "receiver_id" | "Receiver Msisdn" | "Amount" | "transaction_profile" | "transaction_status" | "transaction_date" | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-13 User is able to fetch Bulk Topup-transfer Report as per Date, ERS Reference and Batch Id
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        And I fetch the Transaction Number from first row and enter it in search field to get report data <REPORT_NAME>
        When I click on submit button
        Then Data should be visible inside table
        And I fetch the Batch Id from first row and enter it in search field to get report data <REPORT_NAME>
        And I click on submit button
        Then Data should be visible inside table
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                  |
            | "Operator" | "2023"   | "Sales Reports" | "Bulk Topup-transfer Report" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-14 User is able to fetch Bulk Topup-transfer By Hierarchy Report as per Date, ERS Reference, Batch Id and Reseller Id
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        And I fetch the Transaction Number from first row and enter it in search field to get report data <REPORT_NAME>
        When I click on submit button
        Then Data should be visible inside table
        And I fetch the Batch Id from first row and enter it in search field to get report data <REPORT_NAME>
        And I click on submit button
        Then Data should be visible inside table
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME                  | RESELLER_ID |
            | "MD1"    | "2023"   | "Sales Reports" | "Bulk Topup-transfer Report" | "MD1"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-15 Performing validation of search fields, columns and download functionality in Reseller Performance Report available in the Sales Reports menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                   | FIELD1      | FIELD2    | FIELD3             | FIELD4          | FIELD5        | FIELD6 | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1         | COLUMN2       | COLUMN3         | COLUMN4   | COLUMN5  | COLUMN6            | COLUMN7             | COLUMN8            | COLUMN9    | COLUMN10     | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Reseller Performance Report" | "From Date" | "To Date" | "Transaction Type" | "Reseller Type" | ""            | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "Sender MSISDN" | "Sender Name" | "Reseller Type" | "User Id" | "Region" | "Transaction Type" | "Transaction Count" | "Unique Receivers" | "Currency" | "Sum Amount" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Sales Reports" | "Reseller Performance Report" | "From Date" | "To Date" | "Transaction Type" | "Reseller Type" | "Reseller Id" | ""     | "Size" | "File Type" | "CSV"     | "200" | "100"            | "Sender MSISDN" | "Sender Name" | "Reseller Type" | "User Id" | "Region" | "Transaction Type" | "Transaction Count" | "Unique Receivers" | "Currency" | "Sum Amount" | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-16 User is able to fetch Reseller Performance Report as Date, Transaction Type and Reseller Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <TRANSACTION_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_TYPE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                   | TRANSACTION_TYPE  | RESELLER_TYPE     |
            | "Operator" | "2023"   | "Sales Reports" | "Reseller Performance Report" | "CREDIT_TRANSFER" | "MainDistributor" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: STD-17 User is able to fetch Reseller Performance By Hierarchy Report as Date, Reseller Id, Transaction Type and Reseller Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Transaction Type to fetch report data <TRANSACTION_TYPE>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <TRANSACTION_TYPE>
        When I click on Navigation Toolbar Icon
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> <TRANSACTION_TYPE> <RESELLER_TYPE>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME                   | RESELLER_ID | TRANSACTION_TYPE  | RESELLER_TYPE     |
            | "MD1"    | "2023"   | "Sales Reports" | "Reseller Performance Report" | "MD1"       | "CREDIT_TRANSFER" | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-35 - Performing validation of search fields, columns and download functionality in Sales Trend Report available in the Sales Reports menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME          | RESELLER_TYPE      | RESELLER_ID | FIELD1          | FIELD2                | FIELD3        | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1       | COLUMN2         | COLUMN3           | COLUMN4         | COLUMN5         | COLUMN6     | COLUMN7   | COLUMN8  | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Sales Trend Report" | "Main Distributor" | "MD1"       | "Reseller Type" | "Deviation Threshold" | "Reseller Id" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Reseller Id" | "Reseller Name" | "Reseller MSISDN" | "Reseller Type" | "Average Trend" | "Last Week" | "Change%" | "Region" | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-36 User is able to fetch Sales Trend Report as per Reseller Type, Reseller Id and Deviation Threshold
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select Reseller Type to fetch report data <RESELLER_TYPE>
        When I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Deviation Threshold to fetch report data <DEVIATION_THRESHOLD>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> "" <RESELLER_LEVEL>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME          | RESELLER_TYPE      | RESELLER_ID | DEVIATION_THRESHOLD | RESELLER_LEVEL    |
            | "Operator" | "2023"   | "Sales Reports" | "Sales Trend Report" | "Main Distributor" | "MD1"       | "399"               | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-37 Performing validation of search fields, columns and download functionality in Sales Trend By Hierarchy Report available in the Sales Reports menu for both Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME          | RESELLER_TYPE      | FIELD1          | FIELD2                | FIELD3        | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | RESELLER_ID | COLUMN1       | COLUMN2         | COLUMN3           | COLUMN4         | COLUMN5         | COLUMN6     | COLUMN7   | COLUMN8  | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD1"    | "2023"   | "Sales Reports" | "Sales Trend Report" | "Main Distributor" | "Reseller Type" | "Deviation Threshold" | "Reseller Id" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "MD1"       | "Reseller Id" | "Reseller Name" | "Reseller MSISDN" | "Reseller Type" | "Average Trend" | "Last Week" | "Change%" | "Region" | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-38 User is able to fetch Sales Trend By Hierarchy Report as per Reseller Type, Reseller Id and Deviation Threshold
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Deviation Threshold to fetch report data <DEVIATION_THRESHOLD>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> "" <RESELLER_LEVEL>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME          | RESELLER_ID | RESELLER_TYPE      | DEVIATION_THRESHOLD | RESELLER_LEVEL    |
            | "MD1"    | "2023"   | "Sales Reports" | "Sales Trend Report" | "MD1"       | "Main Distributor" | "399"               | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-39 Performing validation of search fields, columns and download functionality in Purchase Trend Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME             | RESELLER_TYPE      | RESELLER_ID | FIELD1          | FIELD2                | FIELD3        | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1       | COLUMN2         | COLUMN3           | COLUMN4         | COLUMN5         | COLUMN6     | COLUMN7   | COLUMN8  | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Purchase Trend Report" | "Main Distributor" | "MD1"       | "Reseller Type" | "Deviation Threshold" | "Reseller Id" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Reseller Id" | "Reseller Name" | "Reseller MSISDN" | "Reseller Type" | "Average Trend" | "Last Week" | "Change%" | "Region" | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-40 User is able to fetch Purchase Trend Report as per Reseller Type, Reseller Id and Deviation Threshold
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Deviation Threshold to fetch report data <DEVIATION_THRESHOLD>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> "" <RESELLER_TYPE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME             | RESELLER_TYPE     | DEVIATION_THRESHOLD | RESELLER_ID |
            | "Operator" | "2023"   | "Sales Reports" | "Purchase Trend Report" | "Sub-Distributor" | "399"               | "subdist2"  |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-41 Performing validation of search fields, columns and download functionality in Purchase Trend By Hierarchy Report available in the Sales Reports menu for MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME             | RESELLER_TYPE     | FIELD1          | FIELD2                | FIELD3        | FIELD4 | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | RESELLER_ID | COLUMN1       | COLUMN2         | COLUMN3           | COLUMN4         | COLUMN5         | COLUMN6     | COLUMN7   | COLUMN8  | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "MD1"    | "2023"   | "Sales Reports" | "Purchase Trend Report" | "Sub-Distributor" | "Reseller Type" | "Deviation Threshold" | "Reseller Id" | ""     | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "subdist2"  | "Reseller Id" | "Reseller Name" | "Reseller MSISDN" | "Reseller Type" | "Average Trend" | "Last Week" | "Change%" | "Region" | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-42 User is able to fetch Purchase Trend By Hierarchy Report as per Reseller Type and Deviation Threshold
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I select Reseller Type to fetch report data <RESELLER_TYPE>
        When I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I enter Deviation Threshold to fetch report data <DEVIATION_THRESHOLD>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> "" <RESELLER_TYPE>
        Examples:
            | USERNAME | PASSWORD | REPORT          | REPORT_NAME             | RESELLER_ID | RESELLER_TYPE     | DEVIATION_THRESHOLD |
            | "MD1"    | "2023"   | "Sales Reports" | "Purchase Trend Report" | "subdist2"  | "Sub-Distributor" | "399"               |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: SS-43 Performing validation of search fields, columns and download functionality in Commission Summary Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        When I enter From date and To date to fetch report data
        And I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                 | RESELLER_TYPE      | RESELLER_ID | FIELD1      | FIELD2    | FIELD3             | FIELD4        | FIELD5          | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1       | COLUMN2         | COLUMN3           | COLUMN4         | COLUMN5               | COLUMN6                        | COLUMN7                         | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Commission Summary Report" | "PoS Machine Apps" | "PMA4"      | "From Date" | "To Date" | "Transaction Type" | "Reseller Id" | "Reseller Type" | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Reseller Id" | "Reseller Name" | "Reseller MSISDN" | "Reseller Type" | "Transaction Profile" | "Successful Transaction Count" | "Successful Transaction Amount" | ""      | ""      | ""       | ""       | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: SS-44 User is able to fetch Commission Summary Report as per Date, Reseller ID, Reseller Type and Transaction Type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I select Reseller Type to fetch report data <RESELLER_TYPE>
        And I select Reseller Id to fetch report data <RESELLER_ID>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <RESELLER_ID>
        When I click on Navigation Toolbar Icon
        And I select Transaction Type field to fetch report data <TRANSACTION_TYPE>
        And I click on submit button
        Then Specific Data should be available in grid <REPORT_NAME> <RESELLER_ID> <TRANSACTION_TYPE> <RESELLER_LEVEL>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                 | RESELLER_TYPE      | RESELLER_ID | TRANSACTION_TYPE    | RESELLER_LEVEL   |
            | "Operator" | "2023"   | "Sales Reports" | "Commission Summary Report" | "PoS Machine Apps" | "PMA4"      | "COMMISSION_REPORT" | "PoSMachineApps" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-45 Performing validation of Audit reports for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Audit Reports Page
        Then I verify reports page header is visible <HEADER>
        And I verify available reports <REPORT>
        Examples:
            | USERNAME   | PASSWORD | HEADER               | REPORT  |
            | "Operator" | "2023"   | "Reports Management" | "Audit" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-46 Verify Audit Reports are not displayed for unauthorised user
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Audit Reports Page
        Then I verify reports page header is visible <HEADER>
        And I verify available reports list are not shown
        Examples:
            | USERNAME | PASSWORD | HEADER               |
            | "MD1"    | "2023"   | "Reports Management" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-47 Performing validation of search fields, columns and download functionality in Audit Log Report available in the Audit menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Audit Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8> <FIELD9>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT  | REPORT_NAME        | FIELD1      | FIELD2    | FIELD3               | FIELD4       | FIELD5 | FIELD6 | FIELD7 | FIELD8 | FIELD9      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2      | COLUMN3         | COLUMN4   | COLUMN5       | COLUMN6       | COLUMN7   | COLUMN8           | COLUMN9    | COLUMN10         | COLUMN11        | COLUMN12 | COLUMN13 | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Audit" | "Audit Log Report" | "From Date" | "To Date" | "Transaction Number" | "Event Name" | ""     | ""     | ""     | "Size" | "File Type" | "CSV"     | "200" | "5000"           | "Date"  | "Event Name" | "VMS Reference" | "Channel" | "Result Code" | "Reseller Id" | "User ID" | "Reseller MSISDN" | "targetId" | "Result Message" | "fromAndToDiff" | ""       | ""       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-48 Operator is able to fetch Audit Log Report as per Date, Transaction Number and Event Name
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Audit Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I enter From date and To date to fetch report data
        When I click on submit button
        Then Data should be visible inside table
        When I click on Navigation Toolbar Icon
        And I enter Event Name to fetch report data <EVENT_NAME>
        And I click on submit button
        Then Data should be available in grid <REPORT_NAME> <EVENT_NAME>
        And I fetch the Transaction Number from first row and enter it in search field to get report data <REPORT_NAME>
        And I click on submit button
        Then Data should be visible inside table
        Examples:
            | USERNAME   | PASSWORD | REPORT  | REPORT_NAME        | EVENT_NAME |
            | "Operator" | "2023"   | "Audit" | "Audit Log Report" | "Login"    |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39485, TC-39750 - Performing validation of search fields, columns and download functionality in Stock Holding Report Daily Parent Child available in the Sales Reports menu for Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        And I enter From date and To date to fetch report data
        And I select fields value to fetch stock holding report daily data <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <RESELLER_TYPE> <RESELLER_ID>
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                               | FIELD1      | FIELD2    | FIELD3             | FIELD4         | FIELD5        | FIELD6          | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1      | COLUMN2        | COLUMN3  | COLUMN4     | COLUMN5 | COLUMN6           | COLUMN7       | COLUMN8      | COLUMN9         | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Daily Parent Child" | "From Date" | "To Date" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "ResellerID" | "ResellerType" | "Region" | "SalesArea" | "Date"  | "ProductCategory" | "ProductName" | "ProductSku" | "StockQuantity" | ""       | ""       | ""       | ""       | "ALL"            | "ALL"        | "ALL"       | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       |
            | "MD1"      | "2023"   | "Sales Reports" | "Stock Holding Report Daily Parent Child" | "From Date" | "To Date" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "ResellerID" | "ResellerType" | "Region" | "SalesArea" | "Date"  | "ProductCategory" | "ProductName" | "ProductSku" | "StockQuantity" | ""       | ""       | ""       | ""       | "ALL"            | "ALL"        | "ALL"       | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       |


    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39496 - Performing validation of mandatory fields in Stock Holding Report Daily Parent Child available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I enter From date and To date to fetch report data
        When I click on submit button
        Then I am able to validate error message <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                               | FIELD1      | FIELD2    | FIELD3             | FIELD4         | FIELD5        | FIELD6          | FIELD7 | FIELD8      | ERROR_MESSAGE                  |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Daily Parent Child" | "From Date" | "To Date" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "Product Category is required" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39720 - Verifying the report should not be downloaded if mandatory fields are missing in Stock Holding Report Daily Parent Child available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I enter From date and To date to fetch report data
        And I select fields value to fetch stock holding report daily data <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <RESELLER_TYPE> <RESELLER_ID>
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                               | FIELD1      | FIELD2    | FIELD3             | FIELD4         | FIELD5        | FIELD6          | FIELD7 | FIELD8      | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | ERROR_MESSAGE     |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Daily Parent Child" | "From Date" | "To Date" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "ALL"            | "ALL"        | "ALL"       | ""            | ""          | "Downloading in progress" | "NO_RECORD_FOUND" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39505 - Reseller Id field should fetch data as per Reseller Type selected in Stock Holding Report Daily Parent Child available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I enter From date and To date to fetch report data
        And I select reseller id fields value as per reseller type selected <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <RESELLER_TYPE> <RESELLER_ID>
        Then I click on submit button
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                               | FIELD1      | FIELD2    | FIELD3             | FIELD4         | FIELD5        | FIELD6          | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE         | RESELLER_ID   |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Daily Parent Child" | "From Date" | "To Date" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "ALL"            | "ALL"        | "ALL"       | "Sub MainDistributor" | "SUB-DIST1-1" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39558 - Performing validation of search fields, columns and download functionality in Stock Holding Report Weekly Parent Child available in the Sales Reports menu for Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        And I enter From year and To year to fetch report data <FROM_YEAR> <TO_YEAR>
        And I enter From week and To week to fetch report data <FROM_WEEK> <TO_WEEK>
        And I select fields value to fetch stock holding report daily data <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <RESELLER_TYPE> <RESELLER_ID>
        When I click on submit button
        Then I verify all the column names are available <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                                | FIELD1      | FIELD2    | FIELD3      | FIELD4    | FIELD5             | FIELD6         | FIELD7        | FIELD8          | FIELD9 | FIELD10     | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1      | COLUMN2        | COLUMN3 | COLUMN4      | COLUMN5 | COLUMN6           | COLUMN7       | COLUMN8      | COLUMN9         | COLUMN10 | COLUMN11    | COLUMN12 | COLUMN13 | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE | FROM_YEAR | TO_YEAR | FROM_WEEK | TO_WEEK |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Weekly Parent Child" | "From Year" | "To Year" | "From Week" | "To Week" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "ResellerID" | "ResellerType" | "Year"  | "WeekNumber" | ""      | "ProductCategory" | "ProductName" | "ProductSku" | "StockQuantity" | "Region" | "SalesArea" | ""       | ""       | "ALL"            | "ALL"        | "ALL"       | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       | "2022"    | "2025"  | "1"       | "52"    |
            | "DIST1"    | "2023"   | "Sales Reports" | "Stock Holding Report Weekly Parent Child" | "From Year" | "To Year" | "From Week" | "To Week" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "ResellerID" | "ResellerType" | "Year"  | "WeekNumber" | ""      | "ProductCategory" | "ProductName" | "ProductSku" | "StockQuantity" | "Region" | "SalesArea" | ""       | ""       | "ALL"            | "ALL"        | "ALL"       | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       | "2022"    | "2025"  | "1"       | "52"    |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39571 - The authorised user (operator) may click on Reset before fetching the Stock Holding Report Weekly to clear all defined criteria back to default
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I enter From year and To year to fetch report data <FROM_YEAR> <TO_YEAR>
        And I enter From week and To week to fetch report data <FROM_WEEK> <TO_WEEK>
        And I select fields value to fetch stock holding report daily data <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <RESELLER_TYPE> <RESELLER_ID>
        And I click on reset
        Then I verify size is reset <SIZE_AFTER_RESET>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                                | FIELD1      | FIELD2    | FIELD3      | FIELD4    | FIELD5             | FIELD6         | FIELD7        | FIELD8          | FIELD9 | FIELD10     | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1      | COLUMN2        | COLUMN3 | COLUMN4      | COLUMN5 | COLUMN6           | COLUMN7       | COLUMN8      | COLUMN9         | COLUMN10 | COLUMN11    | COLUMN12 | COLUMN13 | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE | FROM_YEAR | TO_YEAR | FROM_WEEK | TO_WEEK |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Weekly Parent Child" | "From Year" | "To Year" | "From Week" | "To Week" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "ResellerID" | "ResellerType" | "Year"  | "WeekNumber" | ""      | "ProductCategory" | "ProductName" | "ProductSku" | "StockQuantity" | "Region" | "SalesArea" | ""       | ""       | "ALL"            | "ALL"        | "ALL"       | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       | "2022"    | "2025"  | "1"       | "52"    |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39719 - Verifying the report should not be downloaded if mandatory fields are missing in Stock Holding Report Weekly Parent Child available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I enter From year and To year to fetch report data <FROM_YEAR> <TO_YEAR>
        And I enter From week and To week to fetch report data <FROM_WEEK> <TO_WEEK>
        And I select fields value to fetch stock holding report daily data <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <RESELLER_TYPE> <RESELLER_ID>
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                                | FIELD1      | FIELD2    | FIELD3      | FIELD4    | FIELD5             | FIELD6         | FIELD7        | FIELD8          | FIELD9 | FIELD10     | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | ERROR_MESSAGE     | FROM_YEAR | TO_YEAR | FROM_WEEK | TO_WEEK |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Weekly Parent Child" | "From Year" | "To Year" | "From Week" | "To Week" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "ALL"            | "ALL"        | "ALL"       | ""            | ""          | "Downloading in progress" | "NO_RECORD_FOUND" | "2022"    | "2025"  | "1"       | "52"    |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: TC-39570 - Reseller Id field should fetch data as per Reseller Type selected in Stock Holding Report Weekly Parent Child available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I enter From year and To year to fetch report data <FROM_YEAR> <TO_YEAR>
        And I enter From week and To week to fetch report data <FROM_WEEK> <TO_WEEK>
        And I select reseller id fields value as per reseller type selected <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <RESELLER_TYPE> <RESELLER_ID>
        Then I click on submit button
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME                                | FIELD1      | FIELD2    | FIELD3      | FIELD4    | FIELD5             | FIELD6         | FIELD7        | FIELD8          | FIELD9 | FIELD10     | FILE_TYPE | SIZE  | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE         | RESELLER_ID   | FROM_YEAR | TO_YEAR | FROM_WEEK | TO_WEEK |
            | "Operator" | "2023"   | "Sales Reports" | "Stock Holding Report Weekly Parent Child" | "From Year" | "To Year" | "From Week" | "To Week" | "Product Category" | "Product Name" | "Product SKU" | "Reseller Type" | "Size" | "File Type" | "CSV"     | "200" | "ALL"            | "ALL"        | "ALL"       | "Sub MainDistributor" | "SUB-DIST1-1" | "2022"    | "2025"  | "1"       | "52"    |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Performing validation of search fields functionality in All Orders Parent Child available in the Sales Reports menu for Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME               | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE | SIZE_AFTER_RESET | COLUMN1 | COLUMN2 | COLUMN3 | COLUMN4 | COLUMN5 | COLUMN6 | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "All Orders Parent Child" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | ""        | ""   | ""               | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | ""               | ""           | ""          | ""            | ""          | ""               | ""              |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Performing validation of columns fields functionality in All Orders Parent Child available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        And I enter From date and To date to fetch report data
        And I select fields value for all order report to fetch data <RESELLER_TYPE> <RESELLER_ID> <STATUS_TYPE> <STATUS> <REGION> <SALES_AREA>
        When I click on submit button
        Then I verify all the column names in all order report <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13> <COLUMN14> <COLUMN15> <COLUMN16> <COLUMN17>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME               | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1     | COLUMN2                   | COLUMN3                 | COLUMN4                   | COLUMN5                   | COLUMN6              | COLUMN7  | COLUMN8      | COLUMN9  | COLUMN10     | COLUMN11       | COLUMN12       | COLUMN13           | COLUMN14               | COLUMN15              | COLUMN16            | COLUMN17               | REGION | SALES_AREA | STATUS_TYPE | STATUS | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "All Orders Parent Child" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "TransDate" | "Initiator Reseller Type" | "Initiator Reseller Id" | "Initiator Reseller Path" | "Initiator Reseller Name" | "Sender Reseller Id" | "Region" | "Sales Area" | "Status" | "Order Type" | "Total Orders" | "Total Amount" | "Initiator Region" | "Initiator Sales Area" | "Initiator Cell Name" | "Initiator Cell Id" | "Receiver Reseller Id" | "ALL"  | "ALL"      | "ALL"       | "ALL"  | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Performing validation of download functionality in All Orders Parent Child available in the Sales Reports menu for Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        And I enter From date and To date to fetch report data
        And I select fields value for all order report to fetch data <RESELLER_TYPE> <RESELLER_ID> <STATUS_TYPE> <STATUS> <REGION> <SALES_AREA>
        When I click on submit button
        Then I verify all the column names in all order report <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13> <COLUMN14> <COLUMN15> <COLUMN16> <COLUMN17>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME               | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1     | COLUMN2                   | COLUMN3                 | COLUMN4                   | COLUMN5                   | COLUMN6              | COLUMN7  | COLUMN8      | COLUMN9  | COLUMN10     | COLUMN11       | COLUMN12       | COLUMN13           | COLUMN14               | COLUMN15              | COLUMN16            | COLUMN17               | REGION | SALES_AREA | STATUS_TYPE | STATUS | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "All Orders Parent Child" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "TransDate" | "Initiator Reseller Type" | "Initiator Reseller Id" | "Initiator Reseller Path" | "Initiator Reseller Name" | "Sender Reseller Id" | "Region" | "Sales Area" | "Status" | "Order Type" | "Total Orders" | "Total Amount" | "Initiator Region" | "Initiator Sales Area" | "Initiator Cell Name" | "Initiator Cell Id" | "Receiver Reseller Id" | "ALL"  | "ALL"      | "ALL"       | "ALL"  | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Verifying the report should not be downloaded if mandatory fields are missing in All Orders Parent Child available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I enter From date and To date to fetch report data
        And I select fields value for all order report to fetch data <RESELLER_TYPE> <RESELLER_ID> <STATUS_TYPE> <STATUS> <REGION> <SALES_AREA>
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME               | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1 | COLUMN2 | COLUMN3 | COLUMN4 | COLUMN5 | COLUMN6 | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | COLUMN14 | COLUMN15 | COLUMN16 | REGION | SALES_AREA | STATUS_TYPE | STATUS | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | ERROR_MESSAGE     |
            | "Operator" | "2023"   | "Sales Reports" | "All Orders Parent Child" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | "CSV"     | "200" | "100"            | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | ""       | ""       | ""       | "ALL"  | "ALL"      | "ALL"       | "ALL"  | ""            | ""          | "Downloading in progress" | "NO_RECORD_FOUND" |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Performing validation of search fields functionality in Order Details Report available in the Sales Reports menu for Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME            | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE | SIZE_AFTER_RESET | COLUMN1 | COLUMN2 | COLUMN3 | COLUMN4 | COLUMN5 | COLUMN6 | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | PRODUCT_CATEGORY | PRODUCT_NAME | PRODUCT_SKU | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Order Details Report" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | ""        | ""   | ""               | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | ""               | ""           | ""          | ""            | ""          | ""               | ""              |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Performing validation of columns fields functionality in Order Details Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        And I enter From date and To date to fetch report data
        And I select fields value for all order report to fetch data <RESELLER_TYPE> <RESELLER_ID> <STATUS_TYPE> <STATUS> <REGION> <SALES_AREA>
        When I click on submit button
        Then I verify all the column names in all order report <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13> <COLUMN14> <COLUMN15> <COLUMN16> <COLUMN17>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME            | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1     | COLUMN2                   | COLUMN3                 | COLUMN4                   | COLUMN5                   | COLUMN6              | COLUMN7  | COLUMN8      | COLUMN9  | COLUMN10     | COLUMN11   | COLUMN12       | COLUMN13           | COLUMN14               | COLUMN15              | COLUMN16            | COLUMN17               | REGION | SALES_AREA | STATUS_TYPE | STATUS | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Order Details Report" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "TransDate" | "Initiator Reseller Type" | "Initiator Reseller Id" | "Initiator Reseller Path" | "Initiator Reseller Name" | "Sender Reseller Id" | "Region" | "Sales Area" | "Status" | "Order Type" | "Order ID" | "Order Amount" | "Initiator Region" | "Initiator Sales Area" | "Initiator Cell Name" | "Initiator Cell Id" | "Receiver Reseller Id" | "ALL"  | "ALL"      | "ALL"       | "ALL"  | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Performing validation of download functionality in Order Details Report available in the Sales Reports menu for Operator and MainDistributor
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I verify submit, download and reset buttons
        Then I select Size <SIZE>
        And I click on reset
        And I verify size is reset <SIZE_AFTER_RESET>
        And I enter From date and To date to fetch report data
        And I select fields value for all order report to fetch data <RESELLER_TYPE> <RESELLER_ID> <STATUS_TYPE> <STATUS> <REGION> <SALES_AREA>
        When I click on submit button
        Then I verify all the column names in all order report <COLUMN1> <COLUMN2> <COLUMN3> <COLUMN4> <COLUMN5> <COLUMN6> <COLUMN7> <COLUMN8> <COLUMN9> <COLUMN10> <COLUMN11> <COLUMN12> <COLUMN13> <COLUMN14> <COLUMN15> <COLUMN16> <COLUMN17>
        When I click on Navigation Toolbar Icon
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <SUCCESS_MESSAGE>
        And I delete the file name <REPORT_NAME>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME            | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1     | COLUMN2                   | COLUMN3                 | COLUMN4                   | COLUMN5                   | COLUMN6              | COLUMN7  | COLUMN8      | COLUMN9  | COLUMN10     | COLUMN11   | COLUMN12       | COLUMN13           | COLUMN14               | COLUMN15              | COLUMN16            | COLUMN17               | REGION | SALES_AREA | STATUS_TYPE | STATUS | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | SUCCESS_MESSAGE |
            | "Operator" | "2023"   | "Sales Reports" | "Order Details Report" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "TransDate" | "Initiator Reseller Type" | "Initiator Reseller Id" | "Initiator Reseller Path" | "Initiator Reseller Name" | "Sender Reseller Id" | "Region" | "Sales Area" | "Status" | "Order Type" | "Order ID" | "Order Amount" | "Initiator Region" | "Initiator Sales Area" | "Initiator Cell Name" | "Initiator Cell Id" | "Receiver Reseller Id" | "ALL"  | "ALL"      | "ALL"       | "ALL"  | "ALL"         | "ALL"       | "Downloading in progress" | "SUCCESS"       |

    @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-report-not-applicable
    Scenario Outline: Verifying the report should not be downloaded if mandatory fields are missing in Order Details Report available in the Sales Reports menu for Operator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Standard Reports Page
        And I click on report tab <REPORT>
        And I select the sub report <REPORT_NAME>
        Then I verify all the search fields are visible <FIELD1> <FIELD2> <FIELD3> <FIELD4> <FIELD5> <FIELD6> <FIELD7> <FIELD8>
        And I enter From date and To date to fetch report data
        And I select fields value for all order report to fetch data <RESELLER_TYPE> <RESELLER_ID> <STATUS_TYPE> <STATUS> <REGION> <SALES_AREA>
        And I click on download button
        Then I am able to validate Download's success message <DOWNLOAD_MESSAGE> <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REPORT          | REPORT_NAME            | FIELD1      | FIELD2    | FIELD3          | FIELD4   | FIELD5 | FIELD6         | FIELD7 | FIELD8      | FILE_TYPE | SIZE  | SIZE_AFTER_RESET | COLUMN1     | COLUMN2 | COLUMN3 | COLUMN4 | COLUMN5 | COLUMN6 | COLUMN7 | COLUMN8 | COLUMN9 | COLUMN10 | COLUMN11 | COLUMN12 | COLUMN13 | COLUMN14 | COLUMN15 | COLUMN16 | REGION | SALES_AREA | STATUS_TYPE | STATUS | RESELLER_TYPE | RESELLER_ID | DOWNLOAD_MESSAGE          | ERROR_MESSAGE     |
            | "Operator" | "2023"   | "Sales Reports" | "Order Details Report" | "From Date" | "To Date" | "Reseller Type" | "Region" | "AS_A" | "Status Types" | "Size" | "File Type" | "CSV"     | "200" | "100"            | "TransDate" | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""      | ""       | ""       | ""       | ""       | ""       | ""       | ""       | "ALL"  | "ALL"      | "ALL"       | "ALL"  | ""            | ""          | "Downloading in progress" | "NO_RECORD_FOUND" |

    @e2e-ss-regression @e2e-ss-smoke @ss-report
    Scenario Outline: SS-02 Verify Standard Reports are not available for unauthorised user
        When Provide <USERNAME> and <PASSWORD> and login into system without BI Call
        Then I verify Report node is not available in left navigation bar <NODE>
        And I logout
        Examples:
            | USERNAME | PASSWORD | NODE     |
            | "MD1"    | "2023"   | "REPORT" |