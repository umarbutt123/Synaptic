Feature: 22-Airtime Stock Feature

    As a user on the unified portal Application
    I want to transfer airtime stock

    Background: Enter UserId and Password and perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Reseller is able to do airtime stock from the airtime stock transaction receipt
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                       | MSISDN |
            | "MD1"    | "2023"   | "Subdist1"  | "100.00" | "cash"         | "topup"  | "Stock Sell Successful" | "You have transferred 100.00" | ""     |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Reseller is able to do reversal of airtime stock from the airtime stock transaction receipt
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        And I get the transaction reference number
        And I click transfer button for reversal
        And I enter comments for reversal <REVERSAL_COMMENTS>
        Then I click confirm for reversal
        Then I am able to validate proper message "You successfully reversed"
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                       | MSISDN | REVERSAL_COMMENTS |
            | "MD1"    | "2023"   | "subdist1"  | "100.00" | "cash"         | "topup"  | "Stock Sell Successful" | "You have transferred 100.00" | ""     | "reversal"        |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Airtime stock transaction with a valid reseller ID and invalid amount
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT | PAYMENT_METHOD | COMMENTS | TITLE               | MESSAGE                     | MSISDN |
            | "MD1"    | "2023"   | "subdist1"  | "0.00" | "cash"         | "topup"  | "Stock Sell Failed" | "Given amount is negative." | ""     |

    # @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock-no
    # Scenario Outline: Performing airtime stock bulk transaction operation using add new option by passing with valid MSISDN as test data as data table
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the airtime stock Page
    #     And I perform bulk transaction with msisdn by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    #     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
    #     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
    #     Then I get the bulk transaction reference numbers and close the transactions
    #     Examples:
    #         | USERNAME | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT                 | SECOND_RESULT                | THIRD_RESULT                 | TRANSACTION_TYPE  | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
    #         | "MD1"    | "2023"   | "249100000004"  | "249100000004"   | "249100000004"  | "10"         | "12"          | "15"         | "cash"         | "topup"  | "3"           | "0"           | "You have transferred 10.00" | "You have transferred 12.00" | "You have transferred 15.00" | "CREDIT_TRANSFER" | "Completed"  | "Completed"   | "Completed"  |

    # @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock-no
    # Scenario Outline: Performing airtime stock bulk transaction operation using add new option by passing with valid Reseller Id as test data as data table
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the airtime stock Page
    #     When I perform bulk transaction with resellerId by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    #     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
    #     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
    #     Then I get the bulk transaction reference numbers and close the transactions
    #     Examples:
    #         | USERNAME | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT                 | SECOND_RESULT                | THIRD_RESULT                 | TRANSACTION_TYPE  | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
    #         | "MD1"    | "2023"   | "subdist1"      | "subdist1"       | "subdist1"      | "10"         | "12"          | "15"         | "cash"         | "topup"  | "3"           | "0"           | "You have transferred 10.00" | "You have transferred 12.00" | "You have transferred 15.00" | "CREDIT_TRANSFER" | "Completed"  | "Completed"   | "Completed"  |

    # @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock-no
    # Scenario Outline: Performing airtime stock bulk transaction using file upload option by using MSISDN and Reseller Id by passing test data as data table
    #     #please provide same dataset mentioned in csv file otherwise validation will be failed
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the airtime stock Page
    #     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
    #     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
    #     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
    #     Then I get the bulk transaction reference numbers and close the transactions
    #     Examples:
    #         | USERNAME | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS  | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT                 | SECOND_RESULT                | THIRD_RESULT                 | TRANSACTION_TYPE  | PRODUCT | STATUS    | UPLOAD_FILE                                                      | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
    #         | "MD1"    | "2023"   | "249100000004"  | "249100000004"   | "249100000004"  | "12"         | "10"          | "15"         | "cash"         | "comment" | "3"           | "0"           | "You have transferred 12.00" | "You have transferred 10.00" | "You have transferred 15.00" | "CREDIT_TRANSFER" | "topup" | "SUCCESS" | "unified/unifiedBase_sample_msisdn_airtime_stock_import.csv"     | "Completed"  | "Completed"   | "Completed"  |
    #         | "MD1"    | "2023"   | "subdist1"      | "subdist1"       | "subdist1"      | "12"         | "10"          | "15"         | "cash"         | "comment" | "3"           | "0"           | "You have transferred 12.00" | "You have transferred 10.00" | "You have transferred 15.00" | "CREDIT_TRANSFER" | "topup" | "SUCCESS" | "unified/unifiedBase_sample_resellerId_airtime_stock_import.csv" | "Completed"  | "Completed"   | "Completed"  |

    # @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock-no
    # Scenario Outline: Performing airtime stock bulk transaction with one valid and one invalid MSISDN by passing test data as data table
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the airtime stock Page
    #     When I perform bulk transaction with one valid and one invalid <TRASACTION_DATA_TYPE> by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    #     And I click on confirm button
    #     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
    #     Then I close the transaction receipt
    #     Examples:
    #         | USERNAME | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS | PAYMENT_METHOD | COMMENTS  | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT                 | SECOND_RESULT                                            | THIRD_RESULT | TRANSACTION_TYPE  | TRASACTION_DATA_TYPE |
    #         | "MD1"    | "2023"   | "249100000004"  | "000000000000"   | ""              | "12"         | "10"          | ""           | "Completed"  | "Failed"      | ""           | "cash"         | "comment" | "1"           | "1"           | "You have transferred 12.00" | "The receiving reseller is not registered in the system" | ""           | "CREDIT_TRANSFER" | "MSISDN"             |

    # @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock-no
    # Scenario Outline: Performing airtime stock bulk transaction with one valid and one invalid Reseller Id by passing test data as data table
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the airtime stock Page
    #     When I perform bulk transaction with one valid and one invalid <TRASACTION_DATA_TYPE> by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    #     And I click on confirm button
    #     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
    #     Then I close the transaction receipt
    #     Examples:
    #         | USERNAME | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT   | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS | PAYMENT_METHOD | COMMENTS  | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT                 | SECOND_RESULT                 | THIRD_RESULT | TRANSACTION_TYPE  | TRASACTION_DATA_TYPE |
    #         | "MD1"    | "2023"   | "subdist1"      | "UNKNOWN_RESELLER" | ""              | "12"         | "10"          | ""           | "Completed"  | "Failed"      | ""           | "cash"         | "comment" | "1"           | "1"           | "You have transferred 12.00" | "Receiver account not found." | ""           | "CREDIT_TRANSFER" | "RESELLER_ID"        |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Airtime stock transaction with an invalid reseller ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE               | MESSAGE                                                   | MSISDN |
            | "MD1"    | "2023"   | "MD1234"    | "100.00" | "cash"         | "topup"  | "Stock Sell Failed" | "The receiving reseller is not registered in the system." | ""     |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Airtime stock transaction with a valid reseller ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                                        | MSISDN |
            | "MD1"    | "2023"   | "subdist1"  | "100.00" | "cash"         | "topup"  | "Stock Sell Successful" | "You have transferred 100.00 SDG to subdist1." | ""     |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Airtime stock transaction to not an immediate children
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE               | MESSAGE                                                      | MSISDN |
            | "MD1"    | "2023"   | "POS13"     | "100.00" | "cash"         | "topup"  | "Stock Sell Failed" | "You are not allowed to transfer to the specified receiver." | ""     |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Airtime stock transaction with a valid reseller ID and outside the margin amount
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT       | PAYMENT_METHOD | COMMENTS | TITLE               | MESSAGE                                                                                             | MSISDN |
            | "MD1"    | "2023"   | "subdist1"  | "300,000.00" | "cash"         | "topup"  | "Stock Sell Failed" | "You provided an amount outside the margins of the contract. Please try again with a valid amount." | ""     |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Airtime stock transaction with a valid reseller ID and amount greater than the available balance
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT     | PAYMENT_METHOD | COMMENTS | TITLE               | MESSAGE                                                   | MSISDN |
            | "MD3"    | "2023"   | "subdist6"  | "30000.00" | "cash"         | "topup"  | "Stock Sell Failed" | "You do not have sufficient credit for this transaction." | ""     |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Airtime stock transaction with a leaf node
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page and verify not authorized screen
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT | PAYMENT_METHOD | COMMENTS | TITLE | MESSAGE | MSISDN |
            | "pos13"  | "2023"   | "subdist1"  | ""     | ""             | ""       | ""    | ""      | ""     |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Two step Airtime stock transaction with valid MSISDN
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <MSISDN> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <MSISDN> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                           | MSISDN         |
            | "MD1"    | "2023"   | ""          | "100.00" | "cash"         | "topup"  | "Stock Sell Successful" | "You have transferred 100.00 SDG" | "249100000004" |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Operator is able to initiate reversal request of topup from search transaction page
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        And I navigate to search transaction page and verify search transaction page title visible
        When I provide transaction reference and click on search button
        And I click on view button
        And I click on reverse transaction button
        And I verify confirm button is disabled
        And I enter comments for request reversal in search transaction <COMMENTS>
        And I click confirm for reversal
        Then I am able to validate proper message "The reversal is awaiting approval"
        And I click on reverse transaction button
        And I enter comments for request reversal in search transaction <COMMENTS>
        And I click on confirm button again
        Then I am able to validate proper message "Transaction reversal already requested."
        Examples:
            | USERNAME   | PASSWORD | USER_ID2   | PASSWORD2 | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                       | MSISDN | TRANSACTION_TYPE  | PRODUCT    | STATUS    | RECEIVER_MSISDN |
            | "Operator" | "2023"   | "Operator" | "2023"    | "md1"       | "100.00" | "cash"         | "topup"  | "Stock Sell Successful" | "You have transferred 100.00" | ""     | "CREDIT_TRANSFER" | "transfer" | "SUCCESS" | "467000000011"  |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Reseller other than operator is able to search heirarchy transactions using heirarchy transactions with reference number
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        When Session is enabled for user <USER_ID2> and password <PASSWORD>
        And I navigate to search transaction page and verify search transaction page title visible
        When I provide transaction reference and click on search button
        And I click on view button
        Examples:
            | USERNAME | PASSWORD | USER_ID2   | PASSWORD2 | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                       | MSISDN | TRANSACTION_TYPE  | PRODUCT    | STATUS    | RECEIVER_MSISDN |
            | "MD1"    | "2023"   | "Operator" | "2023"    | "subdist1"  | "100.00" | "cash"         | "topup"  | "Stock Sell Successful" | "You have transferred 100.00" | ""     | "CREDIT_TRANSFER" | "transfer" | "SUCCESS" | "467000000011"  |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Admin is able to reject a transaction from pending transactions
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <MSISDN> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <MSISDN> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide transaction reference and click on search button
        And I click on view button
        And I click on reverse transaction button
        And I enter comments for request reversal in search transaction <COMMENTS>
        And I click confirm for reversal
        Then I am able to validate proper message "Reversal initiated"
        When Session is enabled for user <USER_ID2> and password <PASSWORD>
        And I navigate to pending transactions page
        And I wait for "1800" miliseconds
        And I click on reject pending button
        And I enter comments for reversal <COMMENTS>
        And I click on reject button
        Then I am able to validate proper message "The reversal of  100.00 SDG  from account MD1 to account Operator was cancelled."
        Examples:
            | USERNAME   | PASSWORD | USER_ID2 | PASSWORD2 | MSISDN         | COMMENTS      | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | TITLE                   | MESSAGE                       |
            | "operator" | "2023"   | "Admin"  | "2023"    | "249100000001" | "test reject" | "MD1"       | "100.00" | "cash"         | "Stock Sell Successful" | "You have transferred 100.00" |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    Scenario Outline: Operator is able to approve a transaction from pending transactions
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <MSISDN> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <MSISDN> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide transaction reference and click on search button
        And I click on view button
        And I click on reverse transaction button
        And I enter comments for request reversal in search transaction <COMMENTS>
        And I click confirm for reversal
        Then I am able to validate proper message "Reversal initiated"
        When Session is enabled for user <USER_ID2> and password <PASSWORD>
        And I navigate to pending transactions page
        And I wait for "1200" miliseconds
        And I click on approve pending button
        And I enter comments for reversal <COMMENTS>
        And I click on approve button
        Then I am able to validate proper message "You successfully reversed  100.00 SDG  from account MD1 to account Operator."
        Examples:
            | USERNAME   | PASSWORD | USER_ID2 | PASSWORD2 | MSISDN         | COMMENTS       | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | TITLE                   | MESSAGE                       |
            | "Operator" | "2023"   | "Admin"  | "2023"    | "249100000001" | "test approve" | "MD1"       | "100.00" | "cash"         | "Stock Sell Successful" | "You have transferred 100.00" |

    # @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-airtime-stock
    # Scenario Outline: Reset data imported through file for bulk airtime stock
    #     #please provide same dataset mentioned in csv file otherwise validation will be failed
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the airtime stock Page
    #     Then I verify page title <PAGE_TITLE>
    #     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
    #     And I validate Bulk Transaction Number
    #     Then I click on the close button
    #     And I click reset button
    #     And I validate Single Transaction Number
    #     Examples:
    #         | USERNAME | PASSWORD | TRANSACTION_TYPE | UPLOAD_FILE                                                  | PAGE_TITLE           |
    #         | "MD1"    | "2023"   | ""               | "unified/unifiedBase_sample_msisdn_airtime_stock_import.csv" | "Sell Airtime Stock" |

    ########################################################### ERS 5.0 FRAMEWORK ##############################################

    @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-airtime-stock @e2e-seamless-one-ss-not-in-use
    Scenario Outline: Perform Transfer transaction to verify language of this monetary transaction message as per selected user
        When I enter userID <RESELLER_ID>
        And I enter password <PASSWORD>
        And I click on Login button
        Then I should see the message <RESELLER_ID> on the Home page
        And I navigate to the Airtime Stock Page to per credit transfer transaction <PAGE_TITLE>
        When I perform airtime stock transaction having following parameters <SUB_RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <SUB_RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <SUB_RESELLER_ID> <AMOUNT> <RECEIPT_TITLE> <MESSAGE>
        And I get the transaction reference number and close the transaction
        And I logout
        Examples:
            | RESELLER_ID | PASSWORD | PAGE_TITLE                  | SUB_RESELLER_ID | AMOUNT | PAYMENT_METHOD | COMMENTS | RECEIPT_TITLE            | MESSAGE                     | MSISDN |
            | "DIST3"     | "2023"   | "Vendre du temps d'antenne" | "SUB-DIST2-5"   | "10"   | "cash"         | "Test"   | "Vente de stock réussie" | "Vous avez transféré 10.00" | ""     |
