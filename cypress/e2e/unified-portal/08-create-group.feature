Feature: 10-Group Feature

    As a user on the unified portal Application
    I want to Create Group

    Background: Enter UserId and Password annd perform Login
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41569 Performing create Group with operator login
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I wait for "1500" miliseconds
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the created Group successfully message <MESSAGE>
        And Group created should be visible inside table <GROUP_NAME>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | DESCRIPTION         | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                | YEAR   |
            | "Operator" | "2023"   | "AutomationGroup01" | "Active" | "AutomationGroup01" | "1"             | "2"             | "Successful operation" | "2026" |
            | "Operator" | "2023"   | "AutomationGroup02" | "Active" | "AutomationGroup02" | "1"             | "2"             | "Successful operation" | "2026" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41568,TC-41578,TC-41585 Edit group with Operator login
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to search existing Group by Group Name<GROUP_NAME>
        When I perform Edit Group having following parameters <GROUP_NAME> <GROUP_TYPE> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <MEMBER> <MANAGER> <ADMIN>
        Then I am able to validate message <MESSAGE>
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        When I click on Edit Button
        Then I validate member , manager and admin listed in the grid <MEMBER> <MANAGER> <ADMIN>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | GROUP_TYPE | STATUS    | DESCRIPTION                 | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                | MEMBER           | MANAGER | ADMIN     |
            | "Operator" | "2023"   | "AutomationGroup02" | "Regular"  | "Blocked" | "AutomationGroup02 updated" | "1"             | "2"             | "Successful operation" | "subdist1,POS13" | ""      | "MD1,MD2" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41653 New members cannot be added due to maximum members limit reached
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        When I perform maximum members limit reached having following parameters <GROUP_NAME> <GROUP_TYPE> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <MEMBER> <MANAGER> <ADMIN>
        Then I am able to validate message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | GROUP_TYPE | STATUS    | DESCRIPTION                 | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                                                              | MEMBER     | MANAGER | ADMIN |
            | "Operator" | "2023"   | "AutomationGroup02" | "Regular"  | "Blocked" | "AutomationGroup02 updated" | "1"             | "2"             | "New member(s) cannot be added due to maximum members limit reached" | "subdist2" | ""      | ""    |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: Reset button Test while filterig Groups data
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I get total group count available in the table
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        Then I validate searched group listed in the table <GROUP_NAME>
        And I click on Reset Button
        Then I validate group count should be as default
        And I am able to filter existing group by Group Name <COLUMN_NAME> <GROUP_NAME>
        Then I validate searched group listed in the table <GROUP_NAME>
        And I click on Reset Button
        Then I validate group count should be as default
        When I click on column button
        And I disable & enable the individual table column <COLUMN_GROUP_ID> view and verify accordingly
        And I disable & enable the individual table column <COLUMN_NAME> view and verify accordingly
        And I disable & enable the individual table column <COlUMN_STATUS> view and verify accordingly
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | COLUMN_GROUP_ID | COLUMN_NAME | COlUMN_STATUS |
            | "Operator" | "2023"   | "AutomationGroup01" | "Active" | "Group Id"      | "Name"      | "Status"      |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: Performing View Group operation for existing Group
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        When I click at view button inside the Group table
        Then I validate all fields inside View Group having following parameters <GROUP_NAME> <GROUP_TYPE> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <MEMBER> <MANAGER>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | GROUP_TYPE  | STATUS   | DESCRIPTION         | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                | MEMBER | MANAGER |
            | "Operator" | "2023"   | "AutomationGroup01" | "EXCLUSIVE" | "Active" | "AutomationGroup01" | "1"             | "2"             | "Successful operation" | ""     | ""      |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41649,TC-41682 Performing Delete Member,Manager and Admin operation for existing Group
        # scenario also covered TC-27963, TC-27961, TC-27959
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        When I perform Delete Group<GROUP_NAME>
        Then I am able to validate message <ERROR_MESSAGE>
        And I click on Cancel button
        When I perform Delete member,admin and manager
        Then I am able to validate message <MESSAGE>
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        When I click on Edit Button
        Then I validate member, manager and admin should not listed in the grid <MEMBER> <MANAGER> <ADMIN>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS    | MESSAGE                | MEMBER     | MANAGER | ADMIN     | ERROR_MESSAGE            |
            | "Operator" | "2023"   | "AutomationGroup02" | "Blocked" | "Successful operation" | "subdist1" | ""      | "MD1,MD2" | "Unable to delete group" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: Performing Delete Group operation for existing Group
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        When I perform Delete Group<GROUP_NAME>
        Then I am able to validate message <MESSAGE>
        And I wait for sometime
        And I am able to search existing Group by Group Name and Status <GROUP_NAME> <STATUS>
        Then I validate deleted group should not exist <GROUP_NAME>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS    | MESSAGE                |
            | "Operator" | "2023"   | "AutomationGroup02" | "Blocked" | "Successful operation" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41657 Minimum members and maximum members accept only Numeric
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the created Group successfully message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | DESCRIPTION                    | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                                     | YEAR   |
            | "Operator" | "2023"   | "AutomationGroup04" | "Active" | "Approver for credit transfer" | "-1"            | "2"             | "Minimum Members should be at least 1"      | "2026" |
            | "Operator" | "2023"   | "AutomationGroup04" | "Active" | "Approver for credit transfer" | "1"             | "-2"            | "Maximum members must be a positive number" | "2026" |
            | "Operator" | "2023"   | "AutomationGroup04" | "Active" | "Approver for credit transfer" | "ABC"           | "-2"            | "Minimum number of members is required"     | "2026" |
            | "Operator" | "2023"   | "AutomationGroup04" | "Active" | "Approver for credit transfer" | "1"             | "ABC"           | "Maximum number of members is required"     | "2026" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: Minimum members must be smaller than maximum members
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the created Group successfully message <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | DESCRIPTION                    | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                                                | YEAR   |
            | "Operator" | "2023"   | "AutomationGroup05" | "Active" | "Approver for credit transfer" | "2"             | "1"             | "Minimum members must be smaller than maximum members" | "2026" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: Performing User can Hide columns of Group Table
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I perform Hide all columns operation
        Then I validate columns should not be displayed in the table
        And I perform Show all columns operation
        Then I validate columns should be displayed in the table
        Examples:
            | USERNAME   | PASSWORD |
            | "Operator" | "2023"   |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: User can Search all Active Groups present in the system
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to search with status only <ACTIVE_STATUS>
        Then I validate groups with <BLOCKED_STATUS> status do not present in the table
        Examples:
            | USERNAME   | PASSWORD | ACTIVE_STATUS | BLOCKED_STATUS |
            | "Operator" | "2023"   | "Active"      | "Blocked"      |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41650 Row per page option in Group page
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I provide rows per page count <COUNT_AS_TEN>
        And I scroll to Bottom if area is scrollable
        Then I verify rows per page count inside table less than or equal to <COUNT_AS_TEN>
        When I provide rows per page count <COUNT_AS_TWENTY>
        And I scroll to Bottom if area is scrollable
        Then I verify rows per page count inside table less than or equal to <COUNT_AS_TWENTY>
        When I provide rows per page count <COUNT_AS_FIFTY>
        And I scroll to Bottom if area is scrollable
        Then I verify rows per page count inside table less than or equal to <COUNT_AS_FIFTY>
        When I provide rows per page count <COUNT_AS_HUNDRED>
        And I scroll to Bottom if area is scrollable
        Then I verify rows per page count inside table less than or equal to <COUNT_AS_HUNDRED>
        Then I click on Reset Button
        And I scroll to Bottom if area is scrollable
        Then I verify rows per page count inside table less than or equal to <COUNT_AS_TWENTY>
        Examples:
            | USERNAME   | PASSWORD | COUNT_AS_TEN | COUNT_AS_TWENTY | COUNT_AS_FIFTY | COUNT_AS_HUNDRED |
            | "Operator" | "2023"   | "10"         | "20"            | "50"           | "100"            |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41665 Verify Group name text field should have character limits
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the fail message after submit the data <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME                                                                                                                                                                                                                                                                 | GROUP_TYPE | STATUS   | DESCRIPTION                    | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                                                                   | YEAR   |
            | "Operator" | "2023"   | "djebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou32rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqv" | "Regular"  | "Active" | "Approver for credit transfer" | "1"             | "2"             | "Invalid input (group.name: Group name must have maximum 255 characters)" | "2026" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41665 Verify Group description text field should have character limits
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the fail message after submit the data <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | GROUP_TYPE | STATUS   | DESCRIPTION                                                                                                                                                                                                                                                                | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                                                                                 | YEAR   |
            | "Operator" | "2023"   | "AutomationGroup06" | "Regular"  | "Active" | "djebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou32rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqv" | "1"             | "2"             | "Invalid input (group.description: Group description must have maximum 255 characters)" | "2026" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41686 Download Group Report
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        Then I should see the message <USERNAME> on the Home page
        And I navigate to the Create Group Page
        And I verify page title <GROUPS_HOME_PAGE_TITLE>
        And I click on export button
        And I click on download button
        And I read file name <FILE_NAME>
        Then I delete file name <FILE_NAME>
        Examples:
            | USERNAME   | PASSWORD | GROUPS_HOME_PAGE_TITLE   | FILE_NAME  |
            | "Operator" | "2023"   | "View and manage groups" | "data.csv" |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41660,TC-41698 Search all Blocked Groups
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to search with status only <BLCOKED_STATUS>
        Then I validate groups with <ACTIVE_STATUS> status do not present in the table
        Examples:
            | USERNAME   | PASSWORD | BLCOKED_STATUS | ACTIVE_STATUS |
            | "Operator" | "2023"   | "Blocked"      | "Active"      |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: TC-41687,TC-41660 Filter search of Group using different columns value data
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the created Group successfully message <MESSAGE>
        And I am able to filter existing group by Group Name <COLUMN_NAME> <GROUP_NAME>
        Then I validate searched group listed in the table <GROUP_NAME>
        And I click on Reset Button
        And I am able to filter existing group by Group Name <COLUMN_MINIMUM_NUMBERS> <MINIMUM_NUMBERS>
        Then I validate searched group listed in the table <GROUP_NAME>
        And I click on Reset Button
        And I am able to filter existing group by Group Name <COLUMN_MAXIMUM_NUMBERS> <MAXIMUM_NUMBERS>
        Then I validate searched group listed in the table <GROUP_NAME>
        And I click on Reset Button
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | DESCRIPTION                    | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                | YEAR   | COLUMN_NAME | COLUMN_STATUS | COLUMN_MINIMUM_NUMBERS | COLUMN_MAXIMUM_NUMBERS |
            | "Operator" | "2023"   | "AutomationGroup07" | "Active" | "Approver for credit transfer" | "11"            | "21"            | "Successful operation" | "2026" | "Name"      | "Status"      | "Minimum Members"      | "Maximum Members"      |

    @e2e-ss-regression @e2e-ss-smoke @ss-group
    Scenario Outline: STD-TC-27966 Filter search of Group using with Invaild data
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        And I am able to filter existing group by Group Name <COLUMN_GROUP_ID> <GROUP_ID>
        Then I validate searched group should not listed in the table <MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_ID  | MESSAGE                                        | YEAR   | COLUMN_GROUP_ID |
            | "Operator" | "2023"   | "1010101" | "No groups found for provided search criteria" | "2026" | "Group Id"      |

    @e2e-seamless-one-ss-regression-not-working @e2e-seamless-one-ss-smoke-not-working @e2e-seamless-one-ss-group-not-working
    Scenario Outline: TC-41688 Add existing Admin to a Group
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the created Group successfully message <MESSAGE>
        And I am able to search existing Group by Group Name<GROUP_NAME>
        When I perform Edit Group having same admin with following parameters <ADMIN1> <MESSAGE> <ADMIN2> <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | DESCRIPTION                    | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                | YEAR   | ADMIN1 | ADMIN2 | ERROR_MESSAGE     |
            | "Operator" | "2023"   | "AutomationGroup08" | "Active" | "Approver for credit transfer" | "1"             | "2"             | "Successful operation" | "2026" | "MD1"  | "MD1"  | "already exists." |

    @e2e-seamless-one-ss-regression-not-working @e2e-seamless-one-ss-smoke-not-working @e2e-seamless-one-ss-group-not-working
    Scenario Outline: TC-41684 Member and Admin should be a different Reseller
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the created Group successfully message <MESSAGE>
        And I am able to search existing Group by Group Name<GROUP_NAME>
        When I perform Edit Group having same admin and member with following parameters <MEMBER> <MESSAGE> <ADMIN> <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | DESCRIPTION                    | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                | YEAR   | MEMBER     | ADMIN      | ERROR_MESSAGE     |
            | "Operator" | "2023"   | "AutomationGroup09" | "Active" | "Approver for credit transfer" | "1"             | "2"             | "Successful operation" | "2026" | "subdist3" | "subdist3" | "already exists." |

    @e2e-ss-regression-not-working @e2e-ss-smoke-not-working @ss-group-not-working
    Scenario Outline: TC-41656 Add existing Member to a Group
        When Session is enabled for user <USERNAME> and password <PASSWORD>
        And I navigate to the Create Group Page
        When I perform Create Group having following parameters <GROUP_NAME> <STATUS> <DESCRIPTION> <MINIMUM_NUMBERS> <MAXIMUM_NUMBERS> <YEAR>
        Then I am able to see the created Group successfully message <MESSAGE>
        And I am able to search existing Group by Group Name<GROUP_NAME>
        When I perform Edit Group having same member with following parameters <MEMBER1> <MESSAGE> <MEMBER2> <ERROR_MESSAGE>
        Examples:
            | USERNAME   | PASSWORD | GROUP_NAME          | STATUS   | DESCRIPTION                    | MINIMUM_NUMBERS | MAXIMUM_NUMBERS | MESSAGE                | YEAR   | MEMBER1    | MEMBER2    | ERROR_MESSAGE     |
            | "Operator" | "2023"   | "AutomationGroup10" | "Active" | "Approver for credit transfer" | "1"             | "2"             | "Successful operation" | "2026" | "subdist3" | "subdist3" | "already exists." |
