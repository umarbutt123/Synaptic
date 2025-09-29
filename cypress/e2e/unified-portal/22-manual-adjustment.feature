Feature: 25-Manual Adjustment Feature

    As a user on the unified portal Application
    I want to perform manual adjustment operation

    Background: Enter UserId and Password and perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-manual-adjustment
    Scenario Outline: Operator is able to do the manual adjustment with valid sender and receiver reseller ID
        When Session is enabled for user <USER_ID> and password <PASSWORD>
        And I navigate to manual adjustment Page
        And I enter sender reseller id <SENDER_RESELLER_ID>
        And I enter reveiver reseller id <RECEIVER_RESELLER_ID>
        And I select sender account type <SENDER_ACCOUNT_TYPE>
        And I select receiver account type <RECEIVER_ACCOUNT_TYPE>
        And I enter amount <AMOUNT>
        And I click on continue
        And I click on transfer
        Then I validate the manual adjustment receipt <SENDER_RESELLER_ID> <STATUS> <RESULT_MESSAGE>
        Examples:
            | USER_ID    | PASSWORD | SENDER_RESELLER_ID | RECEIVER_RESELLER_ID | SENDER_ACCOUNT_TYPE | RECEIVER_ACCOUNT_TYPE | AMOUNT | STATUS    | RESULT_MESSAGE |
            | "Operator" | "2023"   | "Operator"         | "MD1"                | "RESELLER"          | "RESELLER"            | "100"  | "Success" | "Success"      |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-manual-adjustment
    Scenario Outline: Reseller other than operator is not able to do the manual adjustment
        When Session is enabled for user <USER_ID> and password <PASSWORD>
        And I navigate to manual adjustment Page and verify not authorized
        Examples:
            | USER_ID | PASSWORD | RESELLER_ID | AMOUNT   | PAYMENT_METHOD | COMMENTS | TITLE               | MESSAGE                                                                                             | MSISDN         |
            | "MD1"   | "2023"   | ""          | "300000" | "cash"         | "topup"  | "Stock Sell Failed" | "You provided an amount outside the margins of the contract. Please try again with a valid amount." | "467000000019" |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-manual-adjustment
    Scenario Outline: Operator is not able to do the manual adjustment with negative amount
        When Session is enabled for user <USER_ID> and password <PASSWORD>
        And I navigate to manual adjustment Page
        And I enter sender reseller id <SENDER_RESELLER_ID>
        And I enter reveiver reseller id <RECEIVER_RESELLER_ID>
        And I select sender account type <SENDER_ACCOUNT_TYPE>
        And I select receiver account type <RECEIVER_ACCOUNT_TYPE>
        And I enter amount <AMOUNT>
        And I click on continue
        And I click on transfer
        Then I validate the manual adjustment receipt <SENDER_RESELLER_ID> <STATUS> <RESULT_MESSAGE>
        Examples:
            | USER_ID    | PASSWORD | SENDER_RESELLER_ID | RECEIVER_RESELLER_ID | SENDER_ACCOUNT_TYPE | RECEIVER_ACCOUNT_TYPE | AMOUNT | STATUS   | RESULT_MESSAGE              |
            | "Operator" | "2023"   | "Operator"         | "MD1"                | "RESELLER"          | "RESELLER"            | "-100" | "Failed" | "Given amount is negative." |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-manual-adjustment
    Scenario Outline: Operator is not able to do the manual adjustment with valid sender and invalid receiver reseller ID
        When Session is enabled for user <USER_ID> and password <PASSWORD>
        And I navigate to manual adjustment Page
        And I enter sender reseller id <SENDER_RESELLER_ID>
        And I enter reveiver reseller id <RECEIVER_RESELLER_ID>
        And I select sender account type <SENDER_ACCOUNT_TYPE>
        Then I am able to validate proper message "Receiver Reseller Id not found"
        Examples:
            | USER_ID    | PASSWORD | SENDER_RESELLER_ID | RECEIVER_RESELLER_ID | SENDER_ACCOUNT_TYPE |
            | "Operator" | "2023"   | "Operator"         | "MD11"               | "RESELLER"          |

    @e2e-ss-regression @ss-transaction @e2e-ss-smoke @ss-manual-adjustment
    Scenario Outline: Operator is not able to do the manual adjustment with invalid sender and invalid receiver reseller ID
        When Session is enabled for user <USER_ID> and password <PASSWORD>
        And I navigate to manual adjustment Page
        And I enter sender reseller id <SENDER_RESELLER_ID>
        And I enter reveiver reseller id <RECEIVER_RESELLER_ID>
        Then I am able to validate proper message "Sender Reseller Id not found"
        And I enter amount <AMOUNT>
        Then I am able to validate proper message "Receiver Reseller Id not found"
        Examples:
            | USER_ID    | PASSWORD | SENDER_RESELLER_ID | RECEIVER_RESELLER_ID | SENDER_ACCOUNT_TYPE | AMOUNT |
            | "Operator" | "2023"   | "Operator1"        | "MD11"               | "RESELLER"          | "100"  |