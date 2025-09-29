Feature: 23-Hierarchy Transaction Feature

    As a user on the unified portal Application
    I want to check the hierarchy transactions

    Background: Enter UserId and Password and perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41990: Reseller is able to search transaction using Transaction Status filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I scroll to right
        Then I validate <STATUS> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME   | SEARCH_VALUE |
            | "MD1"    | "2023"   | "SUCCESS" | "transactionStatus" | "Success"    |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: Reseller is able to search transaction using Transaction Type or Profile filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <GRID_VALUE> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME          | SEARCH_VALUE      | GRID_VALUE        |
            | "MD1"    | "2023"   | "SUCCESS" | "transactionTypeOrProfile" | "Credit Transfer" | "CREDIT_TRANSFER" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: Reseller is able to reset all the transactions data using reset
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <GRID_VALUE> should be available in the table
        And I click reset button
        Then I validate <SEARCH_FIELD_NAME> <SEARCH_VALUE> should be blank
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME          | SEARCH_VALUE      | GRID_VALUE        |
            | "MD1"    | "2023"   | "SUCCESS" | "transactionTypeOrProfile" | "Credit Transfer" | "CREDIT_TRANSFER" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41974: Reseller is able to search heirarchy transactions option using From and To date filter
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide Date and click on search button
        Then I validate transaction should be available in the table
        Examples:
            | USERNAME | PASSWORD |
            | "MD1"    | "2023"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41969: Reseller is able to search using search transaction option using Amount
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <GRID_VALUE> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE | GRID_VALUE |
            | "MD1"    | "2023"   | "SUCCESS" | "amount"          | "100.00"     | "100.00"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41976: Reseller is able to search transaction using Product Type filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <SEARCH_VALUE> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME                          | SEARCH_VALUE |
            | "MD1"    | "2023"   | "SUCCESS" | "transaction-search-product-type-dropdown" | "transfer"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41966: Reseller is able to search transaction option using Sender Reseller Type filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        # And I scroll to the elements
        Then I scroll to right
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME    | SEARCH_VALUE       | GRID_VALUE |
            | "MD1"    | "2023"   | "SUCCESS" | "SenderResellerType" | "Main Distributor" | "transfer" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41988: Reseller is able to search transaction option using Receiver Reseller Type filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        # And I scroll to the elements
        Then I scroll to right
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME      | SEARCH_VALUE      | GRID_VALUE |
            | "MD1"    | "2023"   | "SUCCESS" | "ReceiverResellerType" | "Sub-Distributor" | "transfer" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: Reseller is able to search transaction with Receiver MSISDN
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        # And I scroll to the elements
        Then I scroll to right
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE   | GRID_VALUE     |
            | "MD1"    | "2023"   | "SUCCESS" | "receiverMsisdn"  | "249100000004" | "249100000004" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: Reseller is able to search transaction with Sender MSISDN
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        # And I scroll to the element
        Then I scroll to right to specific position
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE   | GRID_VALUE     |
            | "MD1"    | "2023"   | "SUCCESS" | "senderMsisdn"    | "249100000001" | "249100000001" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: Reseller is able to search transaction with Sender Reseller ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        # And I scroll to the elements
        Then I scroll to right
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME  | SEARCH_VALUE | GRID_VALUE |
            | "MD1"    | "2023"   | "SUCCESS" | "senderResellerId" | "MD1"        | "transfer" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: Reseller is able to search transaction with Receiver Reseller ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        # And I scroll to the element
        Then I scroll to right to specific position
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME | PASSWORD | STATUS    | SEARCH_FIELD_NAME    | SEARCH_VALUE | GRID_VALUE |
            | "MD1"    | "2023"   | "SUCCESS" | "receiverResellerId" | "subdist1"   | "subdist1" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41981: Reseller other than operator is able to search heirarchy transactions using heirarchy transactions with sender reseller ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to bottom
        Then I scroll to center
        Then I validate <SENDER_RESELLER_ID> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | SENDER_RESELLER_ID | SEARCH_FIELD_NAME  | SEARCH_VALUE |
            | "MD1"    | "2023"   | "MD1"              | "senderResellerId" | "MD1"        |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41983: Reseller other than operator is able to search heirarchy transactions using heirarchy transactions with receiver reseller ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to bottom
        Then I scroll to center
        Then I validate <SEARCH_VALUE> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | SENDER_RESELLER_ID | SEARCH_FIELD_NAME    | SEARCH_VALUE |
            | "MD1"    | "2023"   | "MD1"              | "receiverResellerId" | "subdist1"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41984: Reseller other than operator is able to search heirarchy transactions using heirarchy transactions with Sender MSISDN
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to the element
        Then I validate <SEARCH_VALUE> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | SENDER_RESELLER_ID | SEARCH_FIELD_NAME | SEARCH_VALUE   |
            | "MD1"    | "2023"   | "MD1"              | "senderMsisdn"    | "249100000001" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: Reseller other than operator is able to search heirarchy transactions using heirarchy transactions with Receiver MSISDN
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <SEARCH_VALUE> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | SENDER_RESELLER_ID | SEARCH_FIELD_NAME | SEARCH_VALUE   |
            | "MD1"    | "2023"   | "MD1"              | "receiverMsisdn"  | "249100000004" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: STD-TC-28855: Reseller other than operator is able to search heirarchy transactions using heirarchy transactions with Receiver MSISDN
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <SEARCH_VALUE> should be available in the grid
        Examples:
            | USERNAME | PASSWORD | SENDER_RESELLER_ID | SEARCH_FIELD_NAME | SEARCH_VALUE |
            | "MD1"    | "2023"   | "MD1"              | "amount"          | "100.00"     |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41970: Reseller other than Operator is able to reset all the transactions data using Reset Search option button
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I click reset button
        Then I validate <SEARCH_FIELD_NAME> <SEARCH_VALUE> should be blank
        Examples:
            | USERNAME | PASSWORD | SENDER_RESELLER_ID | SEARCH_FIELD_NAME | SEARCH_VALUE |
            | "MD1"    | "2023"   | "MD1"              | "amount"          | "100.00"     |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-hierarchy-transaction
    Scenario Outline: TC-41963: Reseller is able search heirarchy transactions with reference number
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the airtime stock Page
        When I perform airtime stock transaction having following parameters <RESELLER_ID> <AMOUNT> <COMMENTS> <MSISDN>
        And I validate and confirm the transaction <RESELLER_ID> <AMOUNT> <PAYMENT_METHOD> <COMMENTS>
        Then I validate the transaction <RESELLER_ID> <AMOUNT> <TITLE> <MESSAGE>
        Then I get the transaction reference number and close the transaction
        And I navigate to hierarchy transaction page and verify search transaction page title visible
        When I provide transaction reference and click on search button
        Then I should able to verify these parameters <USERNAME> <RESELLER_ID> <RECEIVER_MSISDN> <TRANSACTION_TYPE> <PRODUCT> <AMOUNT> <STATUS>
        Examples:
            | USERNAME | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE                   | MESSAGE                       | MSISDN | TRANSACTION_TYPE  | PRODUCT    | STATUS    | RECEIVER_MSISDN |
            | "MD1"    | "2023"   | "subdist2"  | "100.00" | "cash"         | "topup"  | "Stock Sell Successful" | "You have transferred 100.00" | ""     | "CREDIT_TRANSFER" | "transfer" | "SUCCESS" | "249100000005"  |
