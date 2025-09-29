Feature: 28-Region And Types Feature

    As a user on the unified portal Application
    I want to verify reports screen

    Background: Enter UserId and Password and perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-01 Operator should be able to create new RegionTypes
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Region Types page
        And I perform Create Region Type having following parameters <REGION_LEVEL> <REGION_TYPE_NAME>
        Then I am able to validate proper message <SUCCESS_MESSAGE>
        And I validate that Region Type is available in search results <REGION_LEVEL> <REGION_TYPE_NAME>
        When I click on View Region Type button
        Then I validate that Region Type details are available on View Region Type page <REGION_LEVEL> <REGION_TYPE_NAME>
        Examples:
            | USERNAME   | PASSWORD | REGION_LEVEL | REGION_TYPE_NAME | SUCCESS_MESSAGE                  |
            | "OPERATOR" | "2023"   | "5"          | "County"         | "Region Type saved successfully" |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-02 Operator should not be able to create a new RegionTypes with Level which is already present
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Region Types page
        And I perform Create Region Type having following parameters <REGION_LEVEL> <REGION_TYPE_NAME>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REGION_LEVEL | REGION_TYPE_NAME | ERROR_MESSAGE                                  |
            | "OPERATOR" | "2023"   | "5"          | "County"         | "Region Type of provided level already exists" |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-03 Operator should not be able to create a new RegionTypes with negative and alphanumeric leval value
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Region Types page
        And I perform Create Region Type having following parameters <REGION_LEVEL> <REGION_TYPE_NAME>
        Then I am able to validate proper message below field <FIELD_ERROR_MESSAGE> <FIELD_NAME>
        Examples:
            | USERNAME   | PASSWORD | REGION_LEVEL | REGION_TYPE_NAME | FIELD_NAME | FIELD_ERROR_MESSAGE                   |
            | "OPERATOR" | "2023"   | "-5"         | "County"         | "Level"    | "Region Level can not be less than 1" |
            | "OPERATOR" | "2023"   | "e5"         | "County"         | "Level"    | "Region Type Level is required"       |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-04 Operator should be able to create new Regions either with or without parent
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Regions page
        And I perform Create Region having following parameters <REGION_LEVEL> <PARENT_REGION_NAME> <REGION_ID> <REGION_NAME> <DATA> <LOCATION>
        Then I am able to validate proper message <SUCCESS_MESSAGE>
        And I validate that Region is available in search results <REGION_ID> <REGION_NAME> <REGION_LEVEL> <PARENT_REGION_NAME>
        Examples:
            | USERNAME   | PASSWORD | REGION_LEVEL | PARENT_REGION_NAME | REGION_ID      | REGION_NAME    | DATA  | LOCATION | SUCCESS_MESSAGE              |
            | "OPERATOR" | "2023"   | "REGION"     | ""                 | "NORTHWESTERN" | "NorthWestern" | "SDG" | "Sudan"  | "Regions hierarchy created." |
            | "OPERATOR" | "2023"   | "STATE"      | "NorthWestern"     | "AMMAYA"       | "Ammaya"       | "SDG" | "Sudan"  | "Regions hierarchy created." |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-05 Operator should not be able to create new Region of any level with ID which is already present
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Regions page
        And I perform Create Region having following parameters <REGION_LEVEL> <PARENT_REGION_NAME> <REGION_ID> <REGION_NAME> <DATA> <LOCATION>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REGION_LEVEL | PARENT_REGION_NAME | REGION_ID      | REGION_NAME    | DATA  | LOCATION | ERROR_MESSAGE                      |
            | "OPERATOR" | "2023"   | "REGION"     | ""                 | "NORTHWESTERN" | "NorthWestern" | "SDG" | "Sudan"  | "region name or id already exists" |
            | "OPERATOR" | "2023"   | "STATE"      | "NorthWestern"     | "AMMAYA"       | "Ammaya"       | "SDG" | "Sudan"  | "region name or id already exists" |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-06 Operator should be able to search via Region ID and view Region details
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Regions page
        And I enter Region ID in Advance Search to filter Region <REGION_ID>
        Then Region ID should be available in the grid <REGION_ID>
        When I click on View Region button
        Then I validate that Region details are available on View Region page <REGION_ID> <REGION_NAME> <REGION_LEVEL> <PARENT_REGION_NAME> <DATA> <LOCATION>
        Examples:
            | USERNAME   | PASSWORD | REGION_LEVEL | PARENT_REGION_NAME | REGION_ID        | REGION_NAME      | DATA | LOCATION |
            | "OPERATOR" | "2023"   | "AREA"       | "Northern-state"   | "DABAHELFOUGARA" | "DABAHELFOUGARA" | ""   | ""       |
            | "OPERATOR" | "2023"   | "REGION"     | ""                 | "CENTRAL"        | "Central"        | ""   | ""       |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-07 Operator should not be able to delete Regions if child hierarchy exists
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Regions page
        And I enter Region ID in Advance Search to filter Region <REGION_ID>
        Then Region ID should be available in the grid <REGION_ID>
        When I click on Delete Region button
        And I click on Delete Region Yes Confirmation button
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REGION_ID      | ERROR_MESSAGE                                                             |
            | "OPERATOR" | "2023"   | "NORTHWESTERN" | "Region cannot be deleted because its child region found in it hierarchy" |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-08 Operator should be able to delete Regions if child hierarchy does not exist
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Regions page
        And I enter Region ID in Advance Search to filter Region <REGION_ID>
        Then Region ID should be available in the grid <REGION_ID>
        When I click on Delete Region button
        And I click on Delete Region Yes Confirmation button
        Then I am able to validate proper message <SUCCESS_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | REGION_ID      | SUCCESS_MESSAGE               |
            | "OPERATOR" | "2023"   | "AMMAYA"       | "Region deleted successfully" |
            | "OPERATOR" | "2023"   | "NORTHWESTERN" | "Region deleted successfully" |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-09 Operator should be able to filter Region data via ID, Name, Parent Region and Level in Advance Search section
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to Regions page
        And I select Region Type in Advance Search to filter Region <REGION_LEVEL>
        Then Region Type should be available in the grid <REGION_LEVEL>
        When I enter Parent Region Name in Advance Search to filter Region <PARENT_REGION_NAME>
        Then Parent Region Name should be available in the grid <PARENT_REGION_NAME>
        When I enter Region ID in Advance Search to filter Region <REGION_ID>
        Then Region ID should be available in the grid <REGION_ID>
        And I click on Reset Search button
        When I enter Region Name in Advance Search to filter Region <REGION_NAME>
        Then Region Name should be available in the grid <REGION_NAME>
        And I click on Reset Search button
        Examples:
            | USERNAME   | PASSWORD | REGION_LEVEL | PARENT_REGION_NAME | REGION_ID | REGION_NAME |
            | "OPERATOR" | "2023"   | "STATE"      | "Southern"         | "ADILA"   | "Adila"     |

    @e2e-ss-regression @e2e-ss-smoke @ss-region
    Scenario Outline: SS-10 Verify Region node is not available for unauthorised user
        When Provide <USERNAME> and <PASSWORD> and login into system without BI Call
        Then I verify Region node is not available in left navigation bar <NODE>
        And I logout
        Examples:
            | USERNAME | PASSWORD | NODE     |
            | "MD1"    | "2023"   | "REGION" |


