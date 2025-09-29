Feature: 08-Reseller Types Feature
    As a user on the unified portal Application
    I want to Create Reseller Types

    Background: Enter UserId and Password annd perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41166 Operator or web admin user should be able to create multiple reseller types in the system
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        When I enter reseller type information <IMPORT_ID> <NAME> <DESCRIPTION> <ROLE> <SELECT_MPOS_SUPPORT_TYPE> <SELECT_REPORT_GROUP>
        And I click next button
        And I select reseller type settings <SETTING1> <SETTING2> <SETTING3>
        And I click next button
        And I select sub-reseller types <SUB_RESELLER_TYPE1> <SUB_RESELLER_TYPE2>
        And I select allowed-reseller types <ALLOWED_RESELLER_TYPE>
        And I click submit button
        Then I am able to validate proper message <MESSAGE>
        And Reseller Types created should be visible inside table <IMPORT_ID>
        Examples:
            | USERNAME   | PASSWORD | IMPORT_ID  | NAME         | DESCRIPTION                   | ROLE      | SELECT_MPOS_SUPPORT_TYPE | SELECT_REPORT_GROUP | MESSAGE                               | SUB_RESELLER_TYPE1 | SUB_RESELLER_TYPE2  | ALLOWED_RESELLER_TYPE | SETTING1          | SETTING2 | SETTING3          |
            | "OPERATOR" | "2023"   | "test-1-1" | "Test Type1" | "This is test reseller type1" | "webuser" | ""                       | ""                  | "Reseller Type created successfully." | "Sub Distributor"  | "BanksandAppDealer" | "PoS"                 | "Allow Web login" | "Used"   | "Allow Terminals" |
            | "OPERATOR" | "2023"   | "test-1-2" | "Test Type2" | "This is test reseller type2" | "webuser" | ""                       | ""                  | "Reseller Type created successfully." | "Sub Distributor"  | "BanksandAppDealer" | "PoS"                 | "Allow Web login" | "Used"   | "Allow Terminals" |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41166 Operator user should not be able to create reseller type without reseller role in the system
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        When I enter reseller type information <IMPORT_ID> <NAME> <DESCRIPTION> <ROLE> <SELECT_MPOS_SUPPORT_TYPE> <SELECT_REPORT_GROUP>
        And I click next button
        Examples:
            | USERNAME   | PASSWORD | IMPORT_ID  | NAME         | DESCRIPTION                   | ROLE | SELECT_MPOS_SUPPORT_TYPE | SELECT_REPORT_GROUP | MESSAGE                         | SUB_RESELLER_TYPE1 | SUB_RESELLER_TYPE2  | ALLOWED_RESELLER_TYPE | SETTING1          | SETTING2 | SETTING3          |
            | "OPERATOR" | "2023"   | "test-1-3" | "Test Type3" | "This is test reseller type3" | ""   | ""                       | ""                  | "User Role is a required field" | "Sub Distributor"  | "BanksandAppDealer" | "PoS"                 | "Allow Web login" | "Used"   | "Allow Terminals" |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline: Create reseller type with other than operator i.e. MainDistributor, sub-distributor etc
        Given Provide <USERNAME> and <PASSWORD> and login into system without BI Call
        And I click on Reseller tab
        And I verify Reseller Type Option is not visible <OPTION>
        Examples:
            | USERNAME | PASSWORD | OPTION           |
            | "ESD1"   | "2023"   | "RESELLER TYPES" |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41188 All operators (contains, ends with, starts with and equal) are visible under filters option
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        Then I click on filters
        And I verify filter options
        Examples:
            | USERNAME   | PASSWORD | IMPORT_ID   | NAME                   | DESCRIPTION                   | SELECT_MPOS_SUPPORT_TYPE  | SELECT_REPORT_GROUP | MESSAGE                               | SUB_RESELLER_TYPE |
            | "OPERATOR" | "2023"   | "newRType3" | "New Resellert Type 3" | "This is new reseller type 3" | "Sync all MPOS terminals" | "Web"               | "Reseller Type created successfully." | " "               |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41171 Create reseller type with empty importID and name
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        When I enter reseller type information <IMPORT_ID> <NAME> <DESCRIPTION> <ROLE> <SELECT_MPOS_SUPPORT_TYPE> <SELECT_REPORT_GROUP>
        And I click next button
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | IMPORT_ID | NAME | DESCRIPTION                   | ROLE      | SELECT_MPOS_SUPPORT_TYPE | SELECT_REPORT_GROUP | MESSAGE                         | SUB_RESELLER_TYPE1 | SUB_RESELLER_TYPE2 | ALLOWED_RESELLER_TYPE | SETTING1          | SETTING2 | SETTING3          |
            | "OPERATOR" | "2023"   | ""        | ""   | "This is test reseller type1" | "webuser" | ""                       | ""                  | "Import Id is a required field" | "Sub Distributor"  | "FranchiseShop"    | "PoS"                 | "Allow Web login" | "Used"   | "Allow Terminals" |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41188 Operator is able to search reseller types with valid Name
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        Then I click on filters
        And I select filter column <FILTER_COLUMN>
        And I select filter option <FILTER_OPTION>
        And I enter filter value <FILTER_VALUE>
        Then Reseller type with name <FILTER_VALUE> should be visible on the screen
        Examples:
            | USERNAME   | PASSWORD | FILTER_COLUMN | FILTER_OPTION | FILTER_VALUE      |
            | "OPERATOR" | "2023"   | "Name"        | "equals"      | "MainDistributor" |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41188 Operator is able to search reseller types with valid reseller type ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        Then I click on filters
        And I select filter column <FILTER_COLUMN>
        And I select filter option <FILTER_OPTION>
        And I enter filter value <FILTER_VALUE>
        Then Reseller type with name <FILTER_VALUE> should be visible on the screen
        Examples:
            | USERNAME   | PASSWORD | FILTER_COLUMN | FILTER_OPTION | FILTER_VALUE |
            | "OPERATOR" | "2023"   | "ID"          | "equals"      | "PoS"        |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41188 Operator is not able to search reseller types with invalid reseller type ID
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        Then I click on filters
        And I select filter column <FILTER_COLUMN>
        And I select filter option <FILTER_OPTION>
        And I enter filter value <FILTER_VALUE>
        Then Reseller types table should be empty
        Examples:
            | USERNAME   | PASSWORD | FILTER_COLUMN | FILTER_OPTION | FILTER_VALUE |
            | "OPERATOR" | "2023"   | "ID"          | "equals"      | "123"        |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41188 Operator is not able to search reseller types with invalid reseller type Name
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        Then I click on filters
        And I select filter column <FILTER_COLUMN>
        And I select filter option <FILTER_OPTION>
        And I enter filter value <FILTER_VALUE>
        Then Reseller types table should be empty
        Examples:
            | USERNAME   | PASSWORD | FILTER_COLUMN | FILTER_OPTION | FILTER_VALUE |
            | "OPERATOR" | "2023"   | "Name"        | "equals"      | "TestName"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41177 Operator is able to edit Reseller type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        And I search for reseller type with import ID <IMPORT_ID>
        And I click on edit button <IMPORT_ID>
        And I verify import id is disabled
        When I edit fields <NAME> <DESCRIPTION> <SELECT_MPOS_SUPPORT_TYPE> <SELECT_REPORT_GROUP> <RESELLER_TYPE_SETTINGS>
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | IMPORT_ID | NAME          | DESCRIPTION | SELECT_MPOS_SUPPORT_TYPE | SELECT_REPORT_GROUP | MESSAGE                               | RESELLER_TYPE_SETTINGS |
            | "OPERATOR" | "2023"   | "PoS"     | "PoS_updated" | "updated"   | ""                       | ""                  | "Reseller Type updated successfully." | ""                     |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41184 Operator is able to view Reseller type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        When I perform View Reseller Types having following parameters <IMPORT_ID> <NAME> <DESCRIPTION> <SELECT_MPOS_SUPPORT_TYPE> <SELECT_REPORT_GROUP> <RESELLER_TYPE_SETTINGS>
        Examples:
            | USERNAME   | PASSWORD | IMPORT_ID | NAME          | DESCRIPTION | SELECT_MPOS_SUPPORT_TYPE | SELECT_REPORT_GROUP | RESELLER_TYPE_SETTINGS |
            | "OPERATOR" | "2023"   | "PoS"     | "PoS_updated" | "updated"   | ""                       | ""                  | "true"                 |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41190 Operator is able to apply COLUMNS filter on reseller type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        And I click on columns button
        And I toggle off the button for column <TOGGLE>
        And I search for any column <COLUMN>
        Then Column with toggle option should be visible <COLUMN>
        And I click on hide all button
        Then I verify all columns are hidden on screen
        And I perform Show all columns operation
        Then I verify all columns are visible on screen
        Examples:
            | USERNAME   | PASSWORD | TOGGLE | COLUMN |
            | "OPERATOR" | "2023"   | "id"   | "ID"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41192 Operator is able to Export reseller types
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        And I click on export button
        And I click on download button
        And I read file name <FILE_NAME>
        Then I delete file name <FILE_NAME>
        Examples:
            | USERNAME   | PASSWORD | FILE_NAME  |
            | "OPERATOR" | "2023"   | "data.csv" |

    @e2e-ss-regression @e2e-ss-smoke @ss-reseller @ss-type
    Scenario Outline:TC-41195 Operator is able to view parent Reseller type
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Reseller Types Page
        And I search for reseller type with import ID <IMPORT_ID>
        And I click on view reseller parent button
        And I search for reseller type with import ID <PARENT_IMPORT_ID>
        Then Reseller type with name <PARENT_IMPORT_ID> should be visible on the screen
        Examples:
            | USERNAME   | PASSWORD | IMPORT_ID | NAME          | DESCRIPTION | SELECT_MPOS_SUPPORT_TYPE | SELECT_REPORT_GROUP | RESELLER_TYPE_SETTINGS | PARENT_IMPORT_ID  |
            | "OPERATOR" | "2023"   | "PoS"     | "PoS_updated" | "updated"   | ""                       | ""                  | "true"                 | "Sub-Distributor" |