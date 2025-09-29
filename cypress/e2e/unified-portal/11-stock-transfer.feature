Feature: 14-Stock Transfer Feature

    As a user on the unified portal Application
    I want to perform stock transfer operation

    Background: Enter UserId and Password annd perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    # @e2e-ss-regression1 @e2e-ss-smoke @ss-stock-transfer
    # Scenario Outline: Inventory Serialised Bulk import for OMS 3
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the bulk import page
    #     When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    #     Then I am able to validate proper message "Successful operation"
    #     And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    #     And I wait for "180000" miliseconds
    #     And I reload the page
    #     And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    #     Then I logout
    #     Examples:
    #         | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                                | INITIAL_STATUS | STATUS      |
    #         | "OPERATOR" | "2023"   | "Inventory Serialized" | "unified/Inventory_Serialized_OMS_3.csv" | "pending"      | "processed" |

    # @e2e-ss-regression1 @e2e-ss-smoke @ss-stock-transfer
    # Scenario Outline: Inventory Non Serialised Bulk import for OMS 1
    #     When Session is enabled for user <USERNAME> and password <PASSWORD>
    #     And I navigate to the bulk import page
    #     When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    #     Then I am able to validate proper message "Successful operation"
    #     And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    #     And I wait for "180000" miliseconds
    #     And I reload the page
    #     And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    #     Then I logout
    #     Examples:
    #         | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                                | INITIAL_STATUS | STATUS      |
    #         | "OPERATOR" | "2023"   | "Inventory Non-serialized" | "unified/Inventory_Non-Serialized_1.csv" | "pending"      | "processed" |


    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer for single product using Serial from Web Application
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having single product <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <INPUT_TYPE> <START_SERIAL>
        And I navigate to the Orders Page
        Then I able to validate the order status on orders page <ORDER_STATE>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU | INPUT_TYPE | START_SERIAL | RECEIVER_ID | ORDER_STATE   |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "SIM_4G"     | "SIM_4G"    | "Serial"   | "6101120"    | "subdist2"  | "TRANSFERRED" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer for multiple product SKU's from Web Application
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having multiple serial products with popup open <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_NAME2> <PRODUCT_SKU> <PRODUCT_SKU2> <INPUT_TYPE> <START_SERIAL1> <START_SERIAL2>
        And I navigate to the Orders Page
        Then I able to validate the order status on orders page <ORDER_STATE>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_NAME2 | PRODUCT_SKU | PRODUCT_SKU2 | INPUT_TYPE | START_SERIAL1 | START_SERIAL2 | RECEIVER_ID | ORDER_STATE   |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "SIM_4G"     | "SIM_5G"      | "SIM_4G"    | "SIM_5G"     | "Serial"   | "6101121"     | "6101134"     | "subdist2"  | "TRANSFERRED" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer with range input type from Web Application
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer with valid range values <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <INPUT_TYPE> <START_SERIAL> <END_SERIAL>
        And I navigate to the Orders Page
        Then I able to validate the order status on orders page <ORDER_STATE>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU | INPUT_TYPE | START_SERIAL | END_SERIAL | RECEIVER_ID | ORDER_STATE   |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "SIM_4G"     | "SIM_4G"    | "Range"    | "6101123"    | "6101125"  | "subdist2"  | "TRANSFERRED" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer from Web Application with invalid range values
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer with invalid start and end serial having following parameters <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <INPUT_TYPE> <START_SERIAL> <END_SERIAL>
        Then I am able to validate proper message below field <ERROR_MESSAGE1> <FIELD_NAME1>
        Then I am able to validate proper message below field <ERROR_MESSAGE2> <FIELD_NAME2>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | RECEIVER_ID | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU | INPUT_TYPE | START_SERIAL | END_SERIAL | FIELD_NAME1    | ERROR_MESSAGE1                                                                                                                            | FIELD_NAME2  | ERROR_MESSAGE2                                                                                                                          |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "subdist2"  | "Physical Products" | "SIM_4G"     | "SIM_4G"    | "Range"    | "test1"      | "test2"    | "Start Serial" | "You've entered invalid Start Serial, It doesn't match with required pattern or entered characters exceeds more than allowed characters." | "End Serial" | "You've entered invalid End Serial, It doesn't match with required pattern or entered characters exceeds more than allowed characters." |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer from Web Application with wrong serial number
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer with invalid serial number <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <INPUT_TYPE> <START_SERIAL>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU | INPUT_TYPE | START_SERIAL | RECEIVER_ID | ERROR_MESSAGE                    |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "SIM_4G"     | "SIM_4G"    | "Serial"   | "6101123"    | "subdist2"  | "Error! Invalid serial provided" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer for non serialised product from Web Application
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having non serialised product <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <QUANTITY>
        And I navigate to the Orders Page
        Then I able to validate the order status on orders page <ORDER_STATE>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU  | RECEIVER_ID | ORDER_STATE   | QUANTITY |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "Cable"      | "Cable_100m" | "subdist2"  | "TRANSFERRED" | "1"      |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer for non serialised product quanity grater than available quantity from Web Application
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having non serialised product quanity grater than available quantity <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <QUANTITY>
        Then I am able to validate proper message below field <ERROR_MESSAGE> <FIELD_NAME>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU  | RECEIVER_ID | ORDER_STATE   | QUANTITY | FIELD_NAME       | ERROR_MESSAGE                                               |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "Cable"      | "Cable_100m" | "subdist2"  | "TRANSFERRED" | "100000" | "Issue Quantity" | "Issue Quantity must not exceed Sender Available Stock Qty" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer for serialised and non serialised product from Web Application
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having serialised and non serialised products <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_NAME2> <PRODUCT_SKU> <PRODUCT_SKU2> <INPUT_TYPE> <START_SERIAL1> <QUANTITY>
        And I navigate to the Orders Page
        Then I able to validate the order status on orders page <ORDER_STATE>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_NAME2 | PRODUCT_SKU | PRODUCT_SKU2 | INPUT_TYPE | START_SERIAL1 | QUANTITY | RECEIVER_ID | ORDER_STATE   |
            | "MD1"       | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "SIM_4G"     | "Cable"       | "SIM_4G"    | "Cable_100m" | "Serial"   | "6101130"     | "1"      | "subdist2"  | "TRANSFERRED" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Instant Sales Order Stock Transfer with Sub Distributor
        When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having single product <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <INPUT_TYPE> <START_SERIAL>
        And I navigate to the Orders Page
        Then I able to validate the order status on orders page <ORDER_STATE>
        Examples:
            | RESELLER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE                           | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU | INPUT_TYPE | START_SERIAL | RECEIVER_ID | ORDER_STATE   |
            | "subdist2"  | "2023"   | "SubDistributor" | "Instant Sales Order Stock Transfer" | "Physical Products" | "SIM_4G"     | "SIM_4G"    | "Serial"   | "6101123"    | "pos15"     | "TRANSFERRED" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: Advanced Search of Instant Sales Order Stock Transfer from Web Application
        When Session is enabled for user <SENDER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having single product <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <INPUT_TYPE> <START_SERIAL>
        And I navigate to the Orders Page
        Then I am able to search the order on orders page <ORDER_TYPE> <SENDER_ID> <RECEIVER_ID> <ORDER_STATE>
        Examples:
            | SENDER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU | INPUT_TYPE | START_SERIAL | RECEIVER_ID | ORDER_STATE   |
            | "MD1"     | "2023"   | "SubDistributor" | "ISO_ST"   | "Physical Products" | "SIM_4G"     | "SIM_4G"    | "Serial"   | "6101131"    | "subdist2"  | "TRANSFERRED" |

    @e2e-ss-regression @e2e-ss-smoke @ss-stock-transfer
    Scenario Outline: User is able to search and view the order details of Instant Sales Order Stock Transfer from Web Application
        When Session is enabled for user <SENDER_ID> and password <PASSWORD>
        And I navigate to the Stock Transfer Page
        When I perform ISOST Stock Transfer having single product <RECEIVER_ID> <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <INPUT_TYPE> <START_SERIAL>
        And I navigate to the Orders Page
        Then I am able to search the order on orders page <ORDER_TYPE> <SENDER_ID> <RECEIVER_ID> <ORDER_STATE>
        Then I click on view action button
        Then I am able to validate the order details on view order page <ORDER_TYPE>
        Examples:
            | SENDER_ID | PASSWORD | RESELLER_TYPE    | ORDER_TYPE | PRODUCT_CATEGORY    | PRODUCT_NAME | PRODUCT_SKU | INPUT_TYPE | START_SERIAL | RECEIVER_ID | ORDER_STATE   |
            | "MD1"     | "2023"   | "SubDistributor" | "ISO_ST"   | "Physical Products" | "SIM_4G"     | "SIM_4G"    | "Serial"   | "6101132"    | "subdist2"  | "TRANSFERRED" |
