Feature: 24-Search Transaction Feature

    As a user on the unified portal Application
    I want to search all transactions

    Background: Enter UserId and Password and perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-01 Operator is able to search transaction using Transaction Status filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I scroll to right
        Then I validate <STATUS> should be available in the grid
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME   | SEARCH_VALUE |
            | "Operator" | "2023"   | "SUCCESS" | "transactionStatus" | "Success"    |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-02 Operator is able to search transaction using Product Type filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <SEARCH_VALUE> should be available in the grid
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME                          | SEARCH_VALUE |
            | "Operator" | "2023"   | "SUCCESS" | "transaction-search-product-type-dropdown" | "transfer"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-03 Operator is able to search transaction using Transaction Type/Profile filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <GRID_VALUE> should be available in the grid
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME          | SEARCH_VALUE      | GRID_VALUE        |
            | "Operator" | "2023"   | "SUCCESS" | "transactionTypeOrProfile" | "Credit Transfer" | "CREDIT_TRANSFER" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-04 Operator is able to search using search transaction option using Amount
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I scroll to right
        Then I validate <GRID_VALUE> should be available in the grid
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE | GRID_VALUE |
            | "Operator" | "2023"   | "SUCCESS" | "amount"          | "100.00"     | "100.00"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-05 Operator is able to reset all the transactions data using reset
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I scroll to right
        Then I validate <GRID_VALUE> should be available in the grid
        And I click reset button
        Then I validate <SEARCH_FIELD_NAME> <SEARCH_VALUE> should be blank
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE | GRID_VALUE |
            | "Operator" | "2023"   | "SUCCESS" | "amount"          | "100.00"     | "100.00"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-06 Operator is able to search transaction option using Batch Id
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        Then I am able to validate proper message "NO_RECORD_FOUND"
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE | GRID_VALUE |
            | "Operator" | "2023"   | "SUCCESS" | "batchId"         | "null"       | "null"     |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-07 Operator is able to search transaction option using Receiver Reseller Type filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I scroll to the element
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME      | SEARCH_VALUE      | GRID_VALUE |
            | "Operator" | "2023"   | "SUCCESS" | "ReceiverResellerType" | "Sub-Distributor" | "subdist1" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-08 Operator is able to search transaction option using Sender Reseller Type filter from the list
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        When I provide <SEARCH_FIELD_NAME1> <SEARCH_VALUE1> and click on search button
        And I scroll to the element
        # And I scroll to left
        # And I scroll to right
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME    | SEARCH_VALUE       | GRID_VALUE | SEARCH_FIELD_NAME1  | SEARCH_VALUE1 |
            | "Operator" | "2023"   | "SUCCESS" | "SenderResellerType" | "Main Distributor" | "MD1"      | "transactionStatus" | "Success"     |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-09 Operator is able to search transaction with Sender MSISDN
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I scroll to the element
        # And I scroll to
        Then I validate element <GRID_VALUE> should be available in the table
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE   | GRID_VALUE     |
            | "Operator" | "2023"   | "SUCCESS" | "senderMsisdn"    | "249100000001" | "249100000001" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-10 Operator is able to reset all the transactions data using reset
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I click reset button
        Then I validate <SEARCH_FIELD_NAME> <SEARCH_VALUE> should be blank
        Examples:
            | USERNAME   | PASSWORD | STATUS    | SEARCH_FIELD_NAME | SEARCH_VALUE   | GRID_VALUE     |
            | "Operator" | "2023"   | "SUCCESS" | "senderMsisdn"    | "249100000005" | "249100000005" |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-11 Operator is able to search transaction with From and To date filter
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide Date and click on search button
        Then I validate transaction should be available in the table
        Examples:
            | USERNAME   | PASSWORD |
            | "Operator" | "2023"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-transaction @ss-search-transaction
    Scenario Outline: SS-12 Operator is able to search all the transactions using search transaction option with sender reseller ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I navigate to search transaction page and verify search transaction page title visible
        When I provide <SEARCH_FIELD_NAME> <SEARCH_VALUE> and click on search button
        And I scroll to bottom
        And I scroll to center
        Then I validate <SENDER_RESELLER_ID> should be available in the grid
        Examples:
            | USERNAME   | PASSWORD | SENDER_RESELLER_ID | SEARCH_FIELD_NAME  | SEARCH_VALUE |
            | "Operator" | "2023"   | "MD1"              | "senderResellerId" | "MD1"        |
