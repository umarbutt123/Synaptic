Feature: 16-Subscriber TopUp Feature
  As a user on the unified portal Application
  I want to perform subscriber topup operation

  Background: Enter UserId and Password and perform Login
    Given I am on the unified portal login page
  ###################### Sudani ######################

  @ss-transaction @e2e-ss-smoke @ss-topup @e2e-ss-regression
  Scenario Outline: Performing topup transaction without mandatory fields with passing test data as data table
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I verify username <RESELLER_ID>
    And I navigate to the topup Page
    And I click on sell topup button
    Then I am able to validate proper message below field "Recipient mobile no is required!" "Recipient Mobile No"
    Then I am able to validate proper message below field "Amount is required!" "Amount"

    Examples:
      | RESELLER_ID | PASSWORD |
      | "POS13"     | "2023"   |

  @ss-transaction @e2e-ss-smoke @ss-topup @e2e-ss-regression
  Scenario Outline: Performing topup transaction with mobile number by passing test data as data table
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I verify username <RESELLER_ID>
    And I navigate to the topup Page
    When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    And I validate and confirm the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
    Then I validate the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <TITLE> <MESSAGE>

    Examples:
      | RESELLER_ID      | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                    | MESSAGE                         | RECEIVER_ID | TRANSACTION_TYPE | PRODUCT | STATUS    |
      | "POS13"          | "2023"   | "249100000130"      | "100.00" | "cash"         | "topup"  | "Successful Transaction" | "You have topped up 100.00 SDG" | ""          | "TOPUP"          | "topup" | "SUCCESS" |
      | "BankAppDealer1" | "2023"   | "249100000130"      | "100.00" | "cash"         | "topup"  | "Successful Transaction" | "You have topped up 100.00 SDG" | ""          | "TOPUP"          | "topup" | "SUCCESS" |
      | "PMA2"           | "2023"   | "249100000130"      | "100.00" | "cash"         | "topup"  | "Successful Transaction" | "You have topped up 100.00 SDG" | ""          | "TOPUP"          | "topup" | "SUCCESS" |

  @ss-transaction @e2e-ss-smoke @ss-topup @e2e-ss-regression
  Scenario Outline: Performing topup transaction with invalid amount
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I verify username <RESELLER_ID>
    And I navigate to the topup Page
    When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    And I validate and confirm the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
    Then I validate the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <TITLE> <MESSAGE>

    Examples:
      | RESELLER_ID      | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT | PAYMENT_METHOD | COMMENTS | TITLE                | MESSAGE                    | TRANSACTION_TYPE |
      | "POS13"          | "2023"   | "249100000130"      | "0.00" | "cash"         | "topup"  | "Transaction Failed" | "Given amount is negative" | "TOPUP"          |
      | "BankAppDealer1" | "2023"   | "249100000130"      | "0.00" | "cash"         | "topup"  | "Transaction Failed" | "Given amount is negative" | "TOPUP"          |
      | "PMA2"           | "2023"   | "249100000130"      | "0.00" | "cash"         | "topup"  | "Transaction Failed" | "Given amount is negative" | "TOPUP"          |

  @e2e-ss-smoke @ss-transaction @ss-topup @e2e-ss-regression
  Scenario Outline: Performing topup transaction with invalid mobile number
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I verify username <RESELLER_ID>
    And I navigate to the topup Page
    When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    Then I am able to validate proper message below field "Recipient mobile number is not valid!" "Recipient Mobile No"

    Examples:
      | RESELLER_ID      | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT   | PAYMENT_METHOD | COMMENTS | TRANSACTION_TYPE |
      | "POS13"          | "2023"   | "24910"             | "100.00" | "cash"         | "topup"  | "TOPUP"          |
      | "BankAppDealer1" | "2023"   | "24910"             | "100.00" | "cash"         | "topup"  | "TOPUP"          |
      | "PMA2"           | "2023"   | "24910"             | "100.00" | "cash"         | "topup"  | "TOPUP"          |

  @e2e-ss-smoke @ss-transaction @ss-topup @e2e-ss-regression
  Scenario Outline: Performing topup transaction with topup amount outside of margin
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I verify username <RESELLER_ID>
    And I navigate to the topup Page
    When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    And I validate and confirm the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
    Then I validate the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <TITLE> <MESSAGE>

    Examples:
      | RESELLER_ID      | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT          | PAYMENT_METHOD | COMMENTS | TITLE                | MESSAGE                                                                                            | TRANSACTION_TYPE |
      | "POS13"          | "2023"   | "249100000130"      | "20,000,000.00" | "cash"         | "topup"  | "Transaction Failed" | "You provided an amount outside the margins of the contract. Please try again with a valid amount" | "TOPUP"          |
      | "BankAppDealer1" | "2023"   | "249100000130"      | "20,000,000.00" | "cash"         | "topup"  | "Transaction Failed" | "You provided an amount outside the margins of the contract. Please try again with a valid amount" | "TOPUP"          |
      | "PMA2"           | "2023"   | "249100000130"      | "20,000,000.00" | "cash"         | "topup"  | "Transaction Failed" | "You provided an amount outside the margins of the contract. Please try again with a valid amount" | "TOPUP"          |

  @e2e-ss-smoke @ss-transaction @ss-topup @e2e-ss-regression
  Scenario Outline: Verify top-up tab is not visible when logged in as OPERATOR
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    Then I click on Transaction tab
    And I validate top-up option is not visible

    Examples:
      | RESELLER_ID | PASSWORD |
      | "OPERATOR"  | "2023"   |

  # @e2e-seamless-one-ss-smoke @e2e-seamless-one-std-transaction @e2e-seamless-one-ss-topup-no @e2e-seamless-one-ss-regression
  # Scenario Outline: STD-TC-28810,28889: Reset data imported through file for bulk top up
  #   #please provide same dataset mentioned in csv file otherwise validation will be failed
  #   When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
  #   And I verify username <RESELLER_ID>
  #   And I navigate to the topup Page
  #   Then I verify page title <PAGE_TITLE>
  #   When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
  #   And I validate Bulk Transaction Number
  #   And I click reset button
  #   And I validate Single Transaction Number

  #   Examples:
  #     | RESELLER_ID | PASSWORD | TRANSACTION_TYPE | UPLOAD_FILE                                   | PAGE_TITLE |
  #     | "POS13"     | "2023"   | ""               | "unified/unifiedBase_sample_topup_import.csv" | "Topup"    |

  # @e2e-seamless-one-ss-smoke @e2e-seamless-one-std-transaction @e2e-seamless-one-ss-topup-no @e2e-seamless-one-ss-regression
  # Scenario Outline: STD-TC-28804: Performing topup bulk transaction operation using add new option by passing test data as data table
  #   When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
  #   And I verify username <RESELLER_ID>
  #   And I navigate to the topup Page
  #   When I perform bulk transaction with mobile number by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
  #   And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
  #   Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
  #   Then I get the bulk transaction reference numbers and close the transactions

  #   Examples:
  #     | RESELLER_ID | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT               | TRANSACTION_TYPE | PRODUCT | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
  #     | "POS13"     | "2023"   | "249100000130"  | "249100000130"   | "249100000130"  | "10"         | "12"          | "15"         | "cash"         | "topup"  | "3"           | "0"           | "You have topped up 10.00" | "You have topped up 12.00" | "You have topped up 15.00" | "TOPUP"          | "topup" | "Completed"  | "Completed"   | "Completed"  |

  # @e2e-seamless-one-ss-smoke @e2e-seamless-one-std-transaction @e2e-seamless-one-ss-topup-no @e2e-seamless-one-ss-regression
  # Scenario Outline: STD-TC-28862, 28809 Performing topup bulk transaction using file upload option by passing test data as data table
  #   #please provide same dataset mentioned in csv file otherwise validation will be failed
  #   When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
  #   And I verify username <RESELLER_ID>
  #   And I navigate to the topup Page
  #   When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
  #   And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
  #   Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
  #   Then I get the bulk transaction reference numbers and close the transactions

  #   Examples:
  #     | RESELLER_ID | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS  | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT               | TRANSACTION_TYPE | PRODUCT | UPLOAD_FILE                                   | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
  #     | "POS13"     | "2023"   | "249100000130"  | "249100000131"   | "249100000132"  | "12"         | "10"          | "15"         | "cash"         | "comment" | "3"           | "0"           | "You have topped up 12.00" | "You have topped up 10.00" | "You have topped up 15.00" | "TOPUP"          | "topup" | "unified/unifiedBase_sample_topup_import.csv" | "Completed"  | "Completed"   | "Completed"  |

  @e2e-ss-smoke @ss-transaction @ss-topup @e2e-ss-regression
  Scenario Outline: User is able to reset the input fields on topup screen
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I verify username <RESELLER_ID>
    And I navigate to the topup Page
    When I enter mobile number, amount and comments <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS>
    And I click reset button
    And I verify mobile number, amount and comments fields are reset

    Examples:
      | RESELLER_ID | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                         | RECEIVER_ID | TRANSACTION_TYPE | PRODUCT | STATUS    |
      | "POS13"     | "2023"   | "249100000130"      | "100.00" | "cash"         | "topup"  | "Succesful Transaction" | "You have topped up 100.00 SDG" | ""          | "TOPUP"          | "topup" | "SUCCESS" |

  @e2e-ss-smoke @ss-transaction @ss-topup @e2e-ss-regression
  Scenario Outline: Validation of mobile number input field
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I verify username <RESELLER_ID>
    And I navigate to the topup Page
    When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
    And I verify warning message <WARNING>

    Examples:
      | RESELLER_ID | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT   | COMMENTS | TITLE                   | MESSAGE                         | RECEIVER_ID | TRANSACTION_TYPE | PRODUCT | STATUS    | WARNING                            |
      | "POS13"     | "2023"   | ""                  | "100.00" | "topup"  | "Succesful Transaction" | "You have topped up 100.00 SDG" | ""          | "TOPUP"          | "topup" | "SUCCESS" | "Recipient mobile no is required!" |

  # @e2e-seamless-one-ss-smoke @e2e-seamless-one-std-transaction @e2e-seamless-one-ss-topup-no @e2e-seamless-one-ss-regression
  # Scenario Outline: STD-TC-28806: Bulk Topup transaction with all invalid mobile numbers
  #   When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
  #   And I verify username <RESELLER_ID>
  #   And I navigate to the topup Page
  #   When I perform bulk transaction with mobile number by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
  #   And I verify warning message <WARNING>

  #   Examples:
  #     | RESELLER_ID | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT               | TRANSACTION_TYPE | PRODUCT | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS | WARNING                                 |
  #     | "POS13"     | "2023"   | "46700000w2"    | "46700000w2"     | "46700000w2"    | "10"         | "12"          | "15"         | "cash"         | "topup"  | "3"           | "0"           | "You have topped up 10.00" | "You have topped up 12.00" | "You have topped up 15.00" | "TOPUP"          | "topup" | "Completed"  | "Completed"   | "Completed"  | "Recipient mobile number is not valid!" |

  # @e2e-seamless-one-ss-smoke @e2e-seamless-one-std-transaction @e2e-seamless-one-ss-topup-no @e2e-seamless-one-ss-regression
  # Scenario Outline: STD-TC-28808: Reset all transactions data in bulk using reset button
  #   When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
  #   And I verify username <RESELLER_ID>
  #   And I navigate to the topup Page
  #   When I perform bulk transaction with mobile number by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
  #   And I click reset button
  #   And I verify mobile number, amount and comments fields are reset
  #   And I validate Single Transaction Number

  #   Examples:
  #     | RESELLER_ID | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT               | TRANSACTION_TYPE | PRODUCT | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS | WARNING                                 |
  #     | "POS13"     | "2023"   | "46700000w2"    | "46700000w2"     | "46700000w2"    | "10"         | "12"          | "15"         | "cash"         | "topup"  | "3"           | "0"           | "You have topped up 10.00" | "You have topped up 12.00" | "You have topped up 15.00" | "TOPUP"          | "topup" | "Completed"  | "Completed"   | "Completed"  | "Recipient mobile number is not valid!" |

  # @e2e-seamless-one-ss-smoke @e2e-seamless-one-std-transaction @e2e-seamless-one-ss-topup-no @e2e-seamless-one-ss-regression
  # Scenario Outline: STD-TC-28807: Delete a transaction before sending in bulk
  #   When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
  #   And I verify username <RESELLER_ID>
  #   And I navigate to the topup Page
  #   When I perform bulk transaction with mobile number by add new option having following parameters <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
  #   And I delete transaction number <TRANSACTION_NO3>
  #   And I delete transaction number <TRANSACTION_NO2>
  #   And I validate Single Transaction Number

  #   Examples:
  #     | RESELLER_ID | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT               | TRANSACTION_TYPE | PRODUCT | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS | WARNING                                 | TRANSACTION_NO3 | TRANSACTION_NO2 |
  #     | "POS13"     | "2023"   | "46700000w2"    | "46700000w2"     | "46700000w2"    | "10"         | "12"          | "15"         | "cash"         | "topup"  | "3"           | "0"           | "You have topped up 10.00" | "You have topped up 12.00" | "You have topped up 15.00" | "TOPUP"          | "topup" | "Completed"  | "Completed"   | "Completed"  | "Recipient mobile number is not valid!" | "3"             | "2"             |

  @e2e-ss-smoke @ss-transaction @ss-topup @e2e-ss-regression
  Scenario Outline: Reseller other than operator is not able to view pending transactions tab
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to pending transaction page
    And I verify not authorized screen

    Examples:
      | RESELLER_ID | PASSWORD |
      | "subdist1"  | "2023"   |

  @e2e-ss-smoke @ss-transaction @ss-topup @e2e-ss-regression
  Scenario Outline: Distributor, Sub distributor, agent , POS, Franchise shops and bank POS reseller is able to sell standard bundle to the subscriber with valid MSISDN
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to standard bundle page
    And I click on cart button
    And I enter subscriber MSISDN <MSISDN>
    And I click on submit button
    Then I validate the transaction <MSISDN> <AMOUNT> <TITLE> <MESSAGE>

    Examples:
      | RESELLER_ID | PASSWORD | MSISDN         | AMOUNT | TITLE | MESSAGE                                                       |
      | "POS13"     | "2023"   | "249100000130" | ""     | ""    | "You have successfully activated BUNDLE_DAILY_DATA_40 bundle" |

#  @e2e-seamless-one-std @e2e-seamless-one-std-transaction @e2e-seamless-one-ss-topup @e2e-seamless-one-ss-regression
#  Scenario Outline: STD-TC-28829: Reseller other than operator is able to do reversal request of topup from the topup transaction receipt
#    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
#    And I verify username <RESELLER_ID>
#    And I navigate to the topup Page
#   When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
#   And I validate and confirm the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#   And I click on request reversal button
#   And I enter comments for reversal <COMMENTS>
#   And I click confirm for reversal
#    Then I am able to validate proper message "Reversal initiated for"
#   Examples:
#    | RESELLER_ID | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                         | RECEIVER_ID | TRANSACTION_TYPE | PRODUCT | STATUS    |
#   | "POS13"     | "2023"   | "249100000130"      | "100"  | "cash"         | "topup"  | "Succesful Transaction" | "You have topped up 100.00 SEK" | ""          | "TOPUP"          | "topup" | "SUCCESS" |
################################################### ERS 5.0 Framework #######################################################
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: TS-24647: Perform Corporate Topup transaction via Bulk Topup option having initiator of Corporate Type as admin and subscribers as recipients both belong to same group
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I navigate to the topup Page
#     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
#     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
#     And I get the bulk transaction reference numbers and close the transactions
#     And I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT               | TRANSACTION_TYPE | PRODUCT | UPLOAD_FILE                                   | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
#       | "Corporate1" | "2023"   | "467000000001"  | "467000000002"   | "467000000003"  | "12"         | "10"          | "15"         | "cash"         | "Test"   | "3"           | "0"           | "You have topped up 12.00" | "You have topped up 10.00" | "You have topped up 15.00" | "TOPUP"          | "topup" | "ers5.0/Corporate_Topup_Import_Processed.csv" | "Completed"  | "Completed"   | "Completed"  |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: TS-24647: Perform Corporate Topup transaction via Bulk Topup option having initiator of Corporate Type as admin and subscribers as recipients both belong to different groups
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I navigate to the topup Page
#     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
#     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <STATUS> <RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <STATUS> <RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <STATUS> <RESULT>
#     And I get the bulk transaction reference numbers and close the transactions
#     And I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | RESULT                                                      | TRANSACTION_TYPE | PRODUCT | UPLOAD_FILE                                | STATUS   |
#       | "Corporate1" | "2023"   | "467000000031"  | "467000000032"   | "467000000033"  | "12"         | "10"          | "15"         | "cash"         | "Test"   | "0"           | "3"           | "You are not allowed to transfer to the specified receiver" | "TOPUP"          | "topup" | "ers5.0/Corporate_Topup_Import_Failed.csv" | "Failed" |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: TS-24647: Perform Corporate Topup transaction via Bulk Topup option having initiator of Corporate Type as admin and subscribers as recipients of two different groups
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I navigate to the topup Page
#     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
#     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
#     And I get the bulk transaction reference numbers and close the transactions
#     And I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT                                                | TRANSACTION_TYPE | PRODUCT | UPLOAD_FILE                                            | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
#       | "Corporate1" | "2023"   | "467000000001"  | "467000000002"   | "467000000013"  | "12"         | "10"          | "15"         | "cash"         | "Test"   | "2"           | "1"           | "You have topped up 12.00" | "You have topped up 10.00" | "You are not allowed to transfer to the specified receiver" | "TOPUP"          | "topup" | "ers5.0/Corporate_Topup_Import_PartiallyProcessed.csv" | "Completed"  | "Completed"   | "Failed"     |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: TS-24647: Perform Corporate Topup transaction via Bulk Topup option having initiator of Corporate Type as manager and subscribers as recipients both belong to same group
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I navigate to the topup Page
#     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
#     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <STATUS> <RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <STATUS> <RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <STATUS> <RESULT>
#     And I get the bulk transaction reference numbers and close the transactions
#     And I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | RESULT                                                      | TRANSACTION_TYPE | PRODUCT | UPLOAD_FILE                                 | STATUS   |
#       | "Corporate1" | "2023"   | "467000000011"  | "467000000012"   | "467000000013"  | "12"         | "10"          | "15"         | "cash"         | "Test"   | "0"           | "3"           | "You are not allowed to transfer to the specified receiver" | "TOPUP"          | "topup" | "ers5.0/Corporate_Topup_Import_Failed2.csv" | "Failed" |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: TS-24647: Perform Corporate Topup transaction via Bulk Topup option having initiator of Corporate Type as admin and subscribers as recipients both belong to same group (initiate a transaction with other admin in case two corporate-type resellers exist as admin)
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I navigate to the topup Page
#     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
#     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
#     Then I get the bulk transaction reference numbers and close the transactions
#     Then I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT               | TRANSACTION_TYPE | PRODUCT | UPLOAD_FILE                                   | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
#       | "Corporate1" | "2023"   | "467000000001"  | "467000000002"   | "467000000003"  | "12"         | "10"          | "15"         | "cash"         | "Test"   | "3"           | "0"           | "You have topped up 12.00" | "You have topped up 10.00" | "You have topped up 15.00" | "TOPUP"          | "topup" | "ers5.0/Corporate_Topup_Import_Processed.csv" | "Completed"  | "Completed"   | "Completed"  |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: TS-24647: Perform Corporate Topup transaction via Bulk Topup option having initiator of Corporate Type as admin and subscribers which are recently removed from the same group
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I navigate to the topup Page
#     When I perform bulk transaction with mobile number having following parameters <UPLOAD_FILE> <TRANSACTION_TYPE>
#     And I validate and confirm the bulk transaction using mobile transaction <FIRST_RECIPIENT> <FIRST_AMOUNT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the bulk transaction details <SUCCESS_COUNT> <FAILURE_COUNT> <FIRST_RECIPIENT> <FIRST_AMOUNT> <FIRST_STATUS> <FIRST_RESULT> <SECOND_RECIPIENT> <SECOND_AMOUNT> <SECOND_STATUS> <SECOND_RESULT> <THIRD_RECIPIENT> <THIRD_AMOUNT> <THIRD_STATUS> <THIRD_RESULT>
#     Then I get the bulk transaction reference numbers and close the transactions
#     Then I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | FIRST_RECIPIENT | SECOND_RECIPIENT | THIRD_RECIPIENT | FIRST_AMOUNT | SECOND_AMOUNT | THIRD_AMOUNT | PAYMENT_METHOD | COMMENTS | SUCCESS_COUNT | FAILURE_COUNT | FIRST_RESULT               | SECOND_RESULT              | THIRD_RESULT                                                | TRANSACTION_TYPE | PRODUCT | UPLOAD_FILE                                             | FIRST_STATUS | SECOND_STATUS | THIRD_STATUS |
#       | "Corporate1" | "2023"   | "467000000001"  | "467000000002"   | "467000000004"  | "12"         | "10"          | "15"         | "cash"         | "Test"   | "2"           | "1"           | "You have topped up 12.00" | "You have topped up 10.00" | "You are not allowed to transfer to the specified receiver" | "TOPUP"          | "topup" | "ers5.0/Corporate_Topup_Import_PartiallyProcessed2.csv" | "Completed"  | "Completed"   | "Failed"     |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: STD-TC-24648: Perform Topup transaction via Single Topup option having initiator of Corporate Type as admin and subscriber as recipient of same group
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I verify username <RESELLER_ID>
#     And I navigate to the topup Page
#     When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
#     And I validate and confirm the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <TITLE> <MESSAGE>
#     Then I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT | PAYMENT_METHOD | COMMENTS | TITLE                    | MESSAGE                     | RECEIVER_ID | TRANSACTION_TYPE | PRODUCT | STATUS    |
#       | "Corporate1" | "2023"   | "467000000001"      | "100"  | "cash"         | "topup"  | "Successful Transaction" | "You have topped up 100.00" | ""          | "TOPUP"          | "topup" | "SUCCESS" |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: STD-TC-24648: Perform Topup transaction via Single Topup option having initiator of Corporate Type as admin and subscriber as recipient of different group
#     When Provide <RESELLER_ID> and <PASSWORD> and login into system
#     And I verify username <RESELLER_ID>
#     And I navigate to the topup Page
#     When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
#     And I validate and confirm the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <TITLE> <MESSAGE>
#     Then I logout
#     Examples:
#       | RESELLER_ID  | PASSWORD | RECIPIENT_MOBILE_NO | AMOUNT | PAYMENT_METHOD | COMMENTS | TITLE                | MESSAGE                                                      | RECEIVER_ID | TRANSACTION_TYPE | PRODUCT | STATUS    |
#       | "Corporate1" | "2023"   | "467000000021"      | "100"  | "cash"         | "topup"  | "Transaction Failed" | "You are not allowed to transfer to the specified receiver." | ""          | "TOPUP"          | "topup" | "SUCCESS" |
#   @e2e-seamless-one-ers5.0 @e2e-seamless-one-ss-topup @e2e-seamless-one-std-not-in-use
#   Scenario Outline: UBP-2215: Perform Topup transaction to verify language of this monetary transaction message as per selected user
#     When I enter userID <RESELLER_ID>
#     And I enter password <PASSWORD>
#     And I click on Login button
#     Then I should see the message <RESELLER_ID> on the Home page
#     And I navigate to the Topup Page to perform topup transaction <PAGE_TITLE>
#     When I perform transaction with mobile number having following parameters <RECIPIENT_MOBILE_NO> <AMOUNT> <COMMENTS> <TRANSACTION_TYPE>
#     And I validate and confirm the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
#     Then I validate the transaction using mobile transaction <RECIPIENT_MOBILE_NO> <AMOUNT> <RECEIPT_TITLE> <MESSAGE>
#     Then I logout
#     Examples:
#       | RESELLER_ID | PASSWORD | PAGE_TITLE               | RECIPIENT_MOBILE_NO | AMOUNT | PAYMENT_METHOD | COMMENTS | RECEIPT_TITLE         | MESSAGE                    | RECEIVER_ID | TRANSACTION_TYPE | PRODUCT | STATUS    |
#       | "DIST3"     | "2023"   | "Vendre du rechargement" | "467100000123"      | "10"   | "cash"         | "Test"   | "Transaction réussie" | "Vous avez rechargé 10.00" | ""          | "TOPUP"          | "topup" | "SUCCESS" |
