Feature: 16-Account Types Feature

    As a user on the Unified Portal Application
    I want to Validate all Account Types Operations

    Background: Enter UserId and Password and perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline:TC-43339 Performing Create Account type operation with passing test data as data table
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account Types Page
        And Click on Create Account Type button
        When I perform Create Account Type having following parameters <ACCOUNT_TYPE_ID> <DESCRIPTION> <MINIMUM_ACCOUNT_BALANCE> <MAXIMUM_ACCOUNT_BALANCE> <MINIMUM_TRANSACTION_AMOUNT> <MAXIMUM_TRANSACTION_AMOUNT> <CREDIT_LIMIT> <COUNT_LIMIT> <PAY_LIMIT> <URL> <EXPIRY_DATE>
        And I click on Submit button
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | ACCOUNT_TYPE_ID | DESCRIPTION        | MINIMUM_ACCOUNT_BALANCE | MAXIMUM_ACCOUNT_BALANCE | MINIMUM_TRANSACTION_AMOUNT | MAXIMUM_TRANSACTION_AMOUNT | CREDIT_LIMIT | COUNT_LIMIT | PAY_LIMIT | URL                     | EXPIRY_DATE  | MESSAGE              | SELECT_COLUMN   | SELECT_OPERATOR | FILTER_VALUE |
            | "OPERATOR" | "2023"   | "Test-20"       | "Test-Description" | "100"                   | "10000000"              | "1000"                     | "100000"                   | "100000000"  | "90000"     | "90000"   | "http://localhost:8099" | "03/06/2025" | "Account type added" | "accountTypeId" | "equals"        | "Test-20"    |

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline:TC-43415 Performing View Existing Account type operation
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account Types Page
        When I perform click on filter to search the Account Id <SELECT_COLUMN> <SELECT_OPERATOR> <FILTER_VALUE>
        And I click on view button inside the table
        Then I am able validate the Account type inside the view page <ACCOUNT_TYPE_ID> <DESCRIPTION> <MINIMUM_ACCOUNT_BALANCE> <MAXIMUM_ACCOUNT_BALANCE> <MINIMUM_TRANSACTION_AMOUNT> <MAXIMUM_TRANSACTION_AMOUNT> <CREDIT_LIMIT> <COUNT_LIMIT> <PAY_LIMIT> <URL> <EXPIRY_DATE>
        Examples:
            | USERNAME   | PASSWORD | ACCOUNT_TYPE_ID | DESCRIPTION | MINIMUM_ACCOUNT_BALANCE | MAXIMUM_ACCOUNT_BALANCE | MINIMUM_TRANSACTION_AMOUNT | MAXIMUM_TRANSACTION_AMOUNT | CREDIT_LIMIT | COUNT_LIMIT | PAY_LIMIT | URL | SELECT_COLUMN     | SELECT_OPERATOR | FILTER_VALUE | EXPIRY_DATE  |
            | "OPERATOR" | "2023"   | "AIRTIME"       | "AIRTIME"   | "0"                     | "100000"                | "0"                        | "1000000"                  | "0"          | "0"         | "0"       | "-" | "Account Type Id" | "equals"        | "AIRTIME"    | "14/11/2023" |

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline:TC-43338 Account Types tab should not be visible to any reseller other than opeator
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account type Page and verify not authorized screen is visible
        Examples:
            | USERNAME | PASSWORD |
            | "MD1"    | "2023"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline:TC-43359 Operator is able to reset all data using Reset button
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account Types Page
        And Click on Create Account Type button
        When I perform Create Account Type having following parameters <ACCOUNT_TYPE_ID> <DESCRIPTION> <MINIMUM_ACCOUNT_BALANCE> <MAXIMUM_ACCOUNT_BALANCE> <MINIMUM_TRANSACTION_AMOUNT> <MAXIMUM_TRANSACTION_AMOUNT> <CREDIT_LIMIT> <COUNT_LIMIT> <PAY_LIMIT> <URL> <EXPIRY_DATE>
        And I click reset button
        When I verify account types id and description are reset to blank
        Examples:
            | USERNAME   | PASSWORD | ACCOUNT_TYPE_ID | DESCRIPTION        | MINIMUM_ACCOUNT_BALANCE | MAXIMUM_ACCOUNT_BALANCE | MINIMUM_TRANSACTION_AMOUNT | MAXIMUM_TRANSACTION_AMOUNT | CREDIT_LIMIT | COUNT_LIMIT | PAY_LIMIT | URL                     | EXPIRY_DATE  |
            | "OPERATOR" | "2023"   | "Test-20"       | "Test-Description" | "100"                   | "10000000"              | "1000"                     | "100000"                   | "100000000"  | "90000"     | "90000"   | "http://localhost:8099" | "03/06/2025" |

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline:TC-43340 Operator is not able to Create a account type without mandatory fields
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account Types Page
        And Click on Create Account Type button
        And I click on Submit button
        Then I am able to validate error message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | ACCOUNT_TYPE_ID | MESSAGE                      |
            | "OPERATOR" | "2023"   | ""              | "Account TypeID is Required" |

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline: TC-43343 Validate that account related fields should accept only numeric values
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account Types Page
        And Click on Create Account Type button
        When I perform Create Account Type having following parameters <ACCOUNT_TYPE_ID> <DESCRIPTION> <MINIMUM_ACCOUNT_BALANCE> <MAXIMUM_ACCOUNT_BALANCE> <MINIMUM_TRANSACTION_AMOUNT> <MAXIMUM_TRANSACTION_AMOUNT> <CREDIT_LIMIT> <COUNT_LIMIT> <PAY_LIMIT> <URL> <EXPIRY_DATE>
        And I click on Submit button
        Then I am able to validate proper message below field <MINIMUM_ACCOUNT_BALANCE_MESSAGE> <FIELD_NAME1>
        Then I am able to validate proper message below field <MAXIMUM_ACCOUNT_BALANCE_MESSAGE> <FIELD_NAME2>
        Then I am able to validate proper message below field <MINIMUM_TRANSACTION_AMOUNT_MESSAGE> <FIELD_NAME3>
        Then I am able to validate proper message below field <MAXIMUM_TRANSACTION_AMOUNT_MESSAGE> <FIELD_NAME4>
        Then I am able to validate proper message below field <CREDIT_LIMIT_MESSAGE> <FIELD_NAME5>
        Then I am able to validate proper message below field <COUNT_LIMIT_MESSAGE> <FIELD_NAME6>
        Then I am able to validate proper message below field <PAY_LIMIT_MESSAGE> <FIELD_NAME7>
        Examples:
            | USERNAME   | PASSWORD | ACCOUNT_TYPE_ID | DESCRIPTION        | MINIMUM_ACCOUNT_BALANCE | MAXIMUM_ACCOUNT_BALANCE | MINIMUM_TRANSACTION_AMOUNT | MAXIMUM_TRANSACTION_AMOUNT | CREDIT_LIMIT | COUNT_LIMIT | PAY_LIMIT | URL                     | EXPIRY_DATE  | MINIMUM_ACCOUNT_BALANCE_MESSAGE             | FIELD_NAME1               | MAXIMUM_ACCOUNT_BALANCE_MESSAGE             | FIELD_NAME2               | MINIMUM_TRANSACTION_AMOUNT_MESSAGE             | FIELD_NAME3                  | MAXIMUM_TRANSACTION_AMOUNT_MESSAGE             | FIELD_NAME4                  | CREDIT_LIMIT_MESSAGE                  | COUNT_LIMIT_MESSAGE                  | PAY_LIMIT_MESSAGE                  | FIELD_NAME5    | FIELD_NAME6   | FIELD_NAME7 |
            | "OPERATOR" | "2023"   | "Test-20"       | "Test-Description" | "abc"                   | "abc"                   | "xyz"                      | "xyz"                      | "qwe"        | "qwe"       | "qwe"     | "http://localhost:8099" | "03/06/2025" | "minAccountBalance must be a `number` type" | "Minimum Account Balance" | "maxAccountBalance must be a `number` type" | "Maximum Account Balance" | "minTransactionAmount must be a `number` type" | "Minimum Transaction Amount" | "maxTransactionAmount must be a `number` type" | "Maximum Transaction Amount" | "creditLimit must be a `number` type" | "countLimit must be a `number` type" | "payLimit must be a `number` type" | "Credit Limit" | "Count Limit" | "Pay Limit" |

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline: TC-43342 Validate that Account Type id field should not accept other than Alphanumeric, Underscore and Dash values
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account Types Page
        And Click on Create Account Type button
        When I perform Create Account Type having following parameters <ACCOUNT_TYPE_ID> <DESCRIPTION> <MINIMUM_ACCOUNT_BALANCE> <MAXIMUM_ACCOUNT_BALANCE> <MINIMUM_TRANSACTION_AMOUNT> <MAXIMUM_TRANSACTION_AMOUNT> <CREDIT_LIMIT> <COUNT_LIMIT> <PAY_LIMIT> <URL> <EXPIRY_DATE>
        And I click on Submit button
        Then I am able to validate proper message below field <ACCOUNT_TYPE_ID_MESSAGE> <FIELD_NAME>
        Examples:
            | USERNAME   | PASSWORD | ACCOUNT_TYPE_ID   | DESCRIPTION        | MINIMUM_ACCOUNT_BALANCE | MAXIMUM_ACCOUNT_BALANCE | MINIMUM_TRANSACTION_AMOUNT | MAXIMUM_TRANSACTION_AMOUNT | CREDIT_LIMIT | COUNT_LIMIT | PAY_LIMIT | URL                     | EXPIRY_DATE  | MESSAGE              | SELECT_COLUMN   | SELECT_OPERATOR | FILTER_VALUE | ACCOUNT_TYPE_ID_MESSAGE                             | FIELD_NAME        |
            | "OPERATOR" | "2023"   | "Test-20$!#$%^&&" | "Test-Description" | "100"                   | "10000000"              | "1000"                     | "100000"                   | "100000000"  | "90000"     | "90000"   | "http://localhost:8099" | "03/06/2025" | "Account type added" | "accountTypeId" | "equals"        | "Test-20"    | "Only allow alphabets and numbers, dash underscore" | "Account Type Id" |

    @e2e-ss-regression @e2e-ss-smoke @ss-account
    Scenario Outline: TC-43341 Validate that user should not be able to create account type with existing account type id
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Account Types Page
        And Click on Create Account Type button
        When I perform Create Account Type having following parameters <ACCOUNT_TYPE_ID> <DESCRIPTION> <MINIMUM_ACCOUNT_BALANCE> <MAXIMUM_ACCOUNT_BALANCE> <MINIMUM_TRANSACTION_AMOUNT> <MAXIMUM_TRANSACTION_AMOUNT> <CREDIT_LIMIT> <COUNT_LIMIT> <PAY_LIMIT> <URL> <EXPIRY_DATE>
        And I click on Submit button
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | ACCOUNT_TYPE_ID | DESCRIPTION        | MINIMUM_ACCOUNT_BALANCE | MAXIMUM_ACCOUNT_BALANCE | MINIMUM_TRANSACTION_AMOUNT | MAXIMUM_TRANSACTION_AMOUNT | CREDIT_LIMIT | COUNT_LIMIT | PAY_LIMIT | URL                     | EXPIRY_DATE  | MESSAGE                        | SELECT_COLUMN   | SELECT_OPERATOR | FILTER_VALUE |
            | "OPERATOR" | "2023"   | "RESELLER"      | "Test-Description" | "100"                   | "10000000"              | "1000"                     | "100000"                   | "100000000"  | "90000"     | "90000"   | "http://localhost:8099" | "03/06/2025" | "Account type already exists." | "accountTypeId" | "equals"        | "Test-20"    |
