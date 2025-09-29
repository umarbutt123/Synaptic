Feature: 06-Reseller Feature

  As a user on the unified portal Application
  I want to add Reseller with multiple types

  Background: Enter UserId and Password and perform Login
    Given I am on the unified portal login page

  ###################### Sudani ######################

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Block Reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME> and expect "1" rows
    And I Click on the eye icon against any reseller from the list
    Then I Click on the block button
    And  I Enter a reason and click on Yes button
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_NAME |
      | "OPERATOR" | "2023"   | "resellerId" | "MD3"         |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Searching of a blocked reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME> and expect "1" rows
    And I Click on the eye icon against any reseller from the list
    Then I verify the status of Reseller <STATUS>
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_NAME | STATUS    |
      | "Operator" | "2023"   | "resellerId" | "MD3"         | "Blocked" |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: STD-TC-28082 Blocked reseller should not be able to login
    When Provide <USERNAME> and <PASSWORD> and login into system with invalid data
    Then I am able to validate proper message "You are blocked to use this service. Please contact operator to unblock"
    Examples:
      | USERNAME | PASSWORD |
      | "MD3"    | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to UnBlock Reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME> and expect "1" rows
    And I Click on the eye icon against any reseller from the list
    Then I Click on the unblock button
    Then I Enter a reason and click on Yes button
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_NAME |
      | "OPERATOR" | "2023"   | "resellerId" | "MD3"         |


  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Freeze Reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME> and expect "1" rows
    And I Click on the eye icon against any reseller from the list
    Then I Click on the freeze button
    And  I Enter a reason and click on Yes button
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_NAME |
      | "OPERATOR" | "2023"   | "resellerId" | "MD3"         |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Searching of a freezed reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_ID> and expect "1" rows
    And I Click on the eye icon against any reseller from the list
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_ID |
      | "Operator" | "2023"   | "resellerId" | "MD3"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Unfreeze a freezed reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_ID> and expect "1" rows
    And I Click on the eye icon against any reseller from the list
    Then I Click on the unfreeze button
    Then I Enter a reason and click on Yes button
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_ID |
      | "Operator" | "2023"   | "resellerId" | "MD3"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Edit Reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME>
    And I click on edit reseller option
    And I Edit various fields Name, MSISDN, email, Parent, city, contractID <NAME> <MSISDN> <EMAIL> <PARENT> <RESELLER_LANGUAGE> <CITY> <ADDRESS_INFO> <REGION> <STATE> <AREA> <DEALER_ZONE> <CONTRACT_ID>
    Then I am able to validate proper message "Reseller Updated Successfully."
    Then User should navigate to manage reseller children screen
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD   | RESELLER_NAME | RESELLER_MENU1 | RESELLER_MENU2 | RESELLER_MENU3 | RESELLER_MENU4 | RESELLER_MENU5 | RESELLER_MENU6 | NAME                     | MSISDN | EMAIL                                  | PARENT | RESELLER_LANGUAGE | CITY   | ADDRESS_INFO   | REGION    | STATE     | AREA    | DEALER_ZONE      | CONTRACT_ID |
      | "OPERATOR" | "2023"   | "resellerName" | "subdist1"    | "RESELLERS"    | "LINK/DE-LINK" | ""             | ""             | ""             | ""             | "SubDistributor1-update" | ""     | "SubDistributor1-3-update@seamless.se" | ""     | "English"         | "test" | "test address" | "Central" | "AlGZIRA" | "TABAT" | "Al-Hasahisa-DZ" | ""          |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to Edit MSISDN of a Reseller If its already taken
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I click on edit reseller option
    And I Edit various fields Name, MSISDN, email, Parent, city, contractID <NAME> <MSISDN> <EMAIL> <PARENT> <RESELLER_LANGUAGE> <CITY> <ADDRESS_INFO> <REGION> <STATE> <AREA> <DEALER_ZONE> <CONTRACT_ID>
    Then I am able to validate proper message "MSISDN is already taken"
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_NAME | NAME | MSISDN         | EMAIL | PARENT | CITY | ADDRESS_INFO | REGION | STATE | AREA | DEALER_ZONE | CONTRACT_ID | RESELLER_LANGUAGE |
      | "OPERATOR" | "2023"   | "resellerId" | "MD1"         | ""   | "249100000004" | ""    | ""     | ""   | ""           | ""     | ""    | ""   | ""          | ""          | "English"         |

  # @e2e-ss-regression-not-now @ss-reseller-not-now @test-not-now
  # Scenario Outline: Reseller is able to Change a parent of a reseller
  #   When Provide <USERNAME> and <PASSWORD> and login into system
  #   Then I click on reseller and verify different reseller menu options should be visible <RESELLER_MENU1> <RESELLER_MENU2> <RESELLER_MENU3> <RESELLER_MENU4> <RESELLER_MENU5> <RESELLER_MENU6>
  #   When I navigate to the Resellers Page
  #   And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME>
  #   And I click on edit reseller option
  #   And I Edit various fields Name, MSISDN, email, Parent, city, street, contractID <NAME> <MSISDN> <EMAIL> <PARENT> <CITY> <STREET> <REGION> <SALES_AREA> <CONTRACT_ID>
  #   Then I am able to validate proper message "Reseller Updated Successfully."
  #   Then User should navigate to manage reseller children screen
  #   Then I logout
  #   Examples:
  #     | USERNAME | PASSWORD | SEARCH_FIELD   | RESELLER_NAME       | RESELLER_MENU1 | RESELLER_MENU2 | RESELLER_MENU3 | RESELLER_MENU4 | RESELLER_MENU5 | RESELLER_MENU6 | NAME | MSISDN | EMAIL | PARENT | CITY | STREET | REGION | SALES_AREA | CONTRACT_ID |
  #     | "DIST1"  | "2023"   | "resellerName" | "SubDistributor1-3" | "RESELLERS"    | "LINK/DE-LINK" | ""             | ""             | ""             | ""             | ""   | ""     | ""    | ""     | ""   | ""     | ""     | ""         | ""          |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to self Block
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I Click on the profile button at the top right corner
    And I Click on the profile option
    And I Click on the block button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "You are not allowed to block yourself"
    # And I Click on the unblock button
    # Then I Enter a reason and click on Yes button
    # Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME | PASSWORD |
      | "MD4"    | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to self freeze
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I Click on the profile button at the top right corner
    And I Click on the profile option
    And I Click on the freeze button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "You are not allowed to freeze yourself"
    # And I Click on the unfreeze button
    # Then I Enter a reason and click on Yes button
    # Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME | PASSWORD |
      | "MD4"    | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to Search reseller with invalid Reseller Name
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME>
    Then I am able to validate proper message "Reseller not found"
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD   | RESELLER_NAME |
      | "Operator" | "2023"   | "resellerName" | "t3st"        |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: STD-TC-28095 Reseller is able to Search reseller with valid Reseller MSISDN
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_MSISDN> and expect "1" rows
    And I Click on the eye icon against any reseller from the list
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD     | RESELLER_MSISDN |
      | "Operator" | "2023"   | "resellerMSISDN" | "249100000001"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to Search reseller with invalid Reseller ID
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_ID>
    Then I am able to validate proper message "Reseller Not Found."
    Examples:
      | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_ID |
      | "Operator" | "2023"   | "resellerId" | "t3st"      |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Export resellers
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I click on export button
    And I click on download button
    And I read file name <FILE_NAME>
    Then I delete file name <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | FILE_NAME  |
      | "OPERATOR" | "2023"   | "data.csv" |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Performing Show or Hide all columns operation with passing test data as data table
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    And I perform Hide all columns operation
    Then I validate columns should not be displayed in the table
    And I perform Show all columns operation
    Then I validate columns should be displayed in the table
    Examples:
      | RESELLER_ID | PASSWORD |
      | "OPERATOR"  | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Operator is able to Reset Search result
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    And I select reseller status in advanced search <STATUS>
    And I click on search button
    Then I validate the the status is deactivated <COLUMN_NAME> <STATUS>
    And I click on reset search
    And I verify status dropdown should be reset to All
    Examples:
      | RESELLER_ID | PASSWORD | STATUS   | COLUMN_NAME |
      | "OPERATOR"  | "2023"   | "Active" | "Status"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to delink its immediate children (Leaf node) in the hierarchy
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Link-De-Link Page
    And I enter reseller id to link-delink <RESELLER_ID>
    And I click on Delink button
    Then I am able to validate proper message "You have successfully removed"
    Examples:
      | USERNAME   | PASSWORD | RESELLER_ID |
      | "subdist1" | "2023"   | "POS14"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to delink its immediate children if it has children in the hierarchy
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Link-De-Link Page
    And I enter reseller id to link-delink <RESELLER_ID>
    And I click on Delink button
    Then I am able to validate proper message "Reseller must not have Children to be de-linked."
    Examples:
      | USERNAME | PASSWORD | RESELLER_ID |
      | "MD1"    | "2023"   | "subdist2"  |


  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to link a reseller which does not come under the same heirarchy and is not linked with any other reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Link-De-Link Page
    And I enter reseller id to link-delink <RESELLER_ID>
    And I click on Link button
    Then I am able to validate proper message "You are not allowed to add this reseller to your distribution hierarchy tree."
    Examples:
      | USERNAME     | PASSWORD | RESELLER_ID |
      | "EVDDealer1" | "2023"   | "POS14"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to link a reseller which comes under the same and immediate heirarchy and is not linked with any other reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Link-De-Link Page
    And I enter reseller id to link-delink <RESELLER_ID>
    And I click on Link button
    Then I am able to validate proper message "249100000031 is now registered to you as a sub-reseller."
    #And I approve Link request <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | RESELLER_ID | MESSAGE                                           |
      | "subdist1" | "2023"   | "POS14"     | "You are now registered to the distribution tree" |

  # @e2e-seamless-one-ss-regression-not-now @e2e-seamless-one-ss-reseller-not-now
  # Scenario Outline: Reseller is not able to link a reseller if it is not a parent in the heirarchy
  #   When Provide <USERNAME> and <PASSWORD> and login into system
  #   When I navigate to the Link-De-Link Page
  #   And I enter reseller id to link-delink <RESELLER_ID>
  #   And I click on Link button
  #   Then I am able to validate proper message "You are not able to perform the operation as you are not the parent in the hierarchy."
  #   Then I logout
  #   Examples:
  #     | USERNAME   | PASSWORD | RESELLER_ID  |
  #     | "OPERATOR" | "2023"   | "postest-18" |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to delink its children which is not an immediate in the hierarchy
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Link-De-Link Page
    And I enter reseller id to link-delink <RESELLER_ID>
    And I click on Delink button
    Then I am able to validate proper message "You are not able to perform the operation as you are not the parent in the hierarchy."
    Examples:
      | USERNAME | PASSWORD | RESELLER_ID |
      | "MD1"    | "2023"   | "POS16"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to link a reseller which is already associated with other reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Link-De-Link Page
    And I enter reseller id to link-delink <RESELLER_ID>
    And I click on Link button
    Then I am able to validate proper message "You are not able to perform the operation as the provided account is already assigned to a parent."
    Examples:
      | USERNAME | PASSWORD | RESELLER_ID |
      | "MD1"    | "2023"   | "subdist1"  |
      | "MD1"    | "2023"   | "subdist2"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Operator is able to view heirachy
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the View Hierarchy Page
    And I verify view hierarchy page
    And I verify hierarchy chart is visible
    Examples:
      | USERNAME   | PASSWORD |
      | "OPERATOR" | "2023"   |

  ######### block/unblock test cases ########

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to block resellers in bulk with only 1 reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the block button
    Then I Enter a reason and click on Yes button
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Search reseller from Blocked Status filter
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    And I select reseller status in advanced search <STATUS>
    And I click on search button
    Then I validate the the status is deactivated <COLUMN_NAME> <STATUS>
    Examples:
      | RESELLER_ID | PASSWORD | STATUS    | COLUMN_NAME |
      | "OPERATOR"  | "2023"   | "Blocked" | "Status"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller cannot unblock some already unblocked reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the unblock button
    And I click on Individual reasons tab
    Then I Enter individual reason and click on Yes button <NUMBER_OF_RESELLERS>
    Then I am able to validate proper message "Reseller is already active"
    Examples:
      | USERNAME   | PASSWORD | TYPE               | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "PoS Machine Apps" | "4"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to unblock resellers in bulk with only 1 reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the unblock button
    Then I Enter a reason and click on Yes button
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to block resellers in bulk with different individual reasons
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the block button
    And I click on Individual reasons tab
    Then I Enter individual reason and click on Yes button <NUMBER_OF_RESELLERS>
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to unblock resellers in bulk with different individual reasons
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the unblock button
    And I click on Individual reasons tab
    Then I Enter individual reason and click on Yes button <NUMBER_OF_RESELLERS>
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  ####### Freeze/Un-freeze test cases #######

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to freeze resellers in bulk with only 1 reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the freeze button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Search reseller from Frozen Status filter
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    And I select reseller status in advanced search <STATUS>
    And I click on search button
    Then I validate the the status is deactivated <COLUMN_NAME> <STATUS>
    Examples:
      | RESELLER_ID | PASSWORD | STATUS   | COLUMN_NAME |
      | "OPERATOR"  | "2023"   | "Frozen" | "Status"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to freeze some already freezed resellers in bulk
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the freeze button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "Reseller is already frozen"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to unfreeze resellers in bulk
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the unfreeze button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to freeze resellers in bulk with different individual reasons
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the freeze button
    And I click on Individual reasons tab
    Then I Enter individual reason and click on Yes button <NUMBER_OF_RESELLERS>
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to unfreeze resellers in bulk with individual reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the unfreeze button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  ######## Activate/De-activate test cases ###############

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to deactivate resellers in bulk with only 1 reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the deactivate button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Search reseller from Deactivated Status filter
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    And I select reseller status in advanced search <STATUS>
    And I click on search button
    Then I validate the the status is deactivated <COLUMN_NAME> <STATUS>
    Examples:
      | RESELLER_ID | PASSWORD | STATUS        | COLUMN_NAME |
      | "OPERATOR"  | "2023"   | "Deactivated" | "Status"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to activate resellers in bulk with only 1 reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the activate button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to activate some already activated resellers in bulk
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the activate button
    Then I Enter a reason and click on Yes button
    Then I am able to validate proper message "Reseller is already active"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to deactivate resellers in bulk with different individual reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the deactivate button
    And I click on Individual reasons tab
    Then I Enter individual reason and click on Yes button <NUMBER_OF_RESELLERS>
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to activate resellers in bulk with different individual reason
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I Click on Add More Filters button
    And I select reseller type <TYPE>
    And I click on Done changes button
    And I click on search button
    And I select multiple resellers <NUMBER_OF_RESELLERS>
    Then I Click on the activate button
    And I click on Individual reasons tab
    Then I Enter individual reason and click on Yes button <NUMBER_OF_RESELLERS>
    Then I am able to validate proper message "SUCCESS"
    Examples:
      | USERNAME   | PASSWORD | TYPE         | NUMBER_OF_RESELLERS |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "2"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Operator is able to search reseller types with valid reseller type ID
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    When I click on filter by providing filter column,operation and filter value <FILTER_COLUMN> <OPERATION> <FILTER_VALUE>
    And I wait for "1000" miliseconds
    Then I verify the Reseller Id is present inside the table <FILTER_VALUE>
    Examples:
      | RESELLER_ID | PASSWORD | FILTER_COLUMN | OPERATION | FILTER_VALUE |
      | "operator"  | "2023"   | "resellerId"  | "Equal"   | "MD1"        |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Operator is able to search reseller types with invalid reseller type ID
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    When I click on filter by providing filter column,operation and filter value <FILTER_COLUMN> <OPERATION> <FILTER_VALUE>
    Then I am able to validate proper message "Reseller Not Found."
    Examples:
      | RESELLER_ID | PASSWORD | FILTER_COLUMN | OPERATION | FILTER_VALUE |
      | "operator"  | "2023"   | "resellerId"  | "Equal"   | "abcd"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is able to Search resellers with valid MSISDN
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    When I click on filter by providing filter column,operation and filter value <FILTER_COLUMN> <OPERATION> <FILTER_VALUE>
    And I wait for "1000" miliseconds
    Then I verify the Reseller Id is present inside the table <NAME>
    Examples:
      | RESELLER_ID | PASSWORD | FILTER_COLUMN    | OPERATION | FILTER_VALUE   | NAME  |
      | "operator"  | "2023"   | "resellerMSISDN" | "Equal"   | "249100000001" | "MD1" |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Reseller is not able to Search resellers with invalid MSISDN
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Resellers Page
    When I click on filter by providing filter column,operation and filter value <FILTER_COLUMN> <OPERATION> <FILTER_VALUE>
    Then I am able to validate proper message "Reseller not found"
    Examples:
      | RESELLER_ID | PASSWORD | FILTER_COLUMN    | OPERATION | FILTER_VALUE |
      | "operator"  | "2023"   | "resellerMSISDN" | "Equal"   | "abcd12345"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Operator is able to Change a parent of a reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <SEARCH_VALUE>
    And I click on change parent reseller option
    And I select change parent reseller for UBP <CHANGE_PARENT_NAME>
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | SEARCH_VALUE | SEARCH_FIELD   | MESSAGE                                | SELECT_COLUMN | SELECT_OPERATOR | CHANGE_PARENT_NAME    |
      | "OPERATOR" | "2023"   | "POS17"      | "resellerName" | "Reseller Parent Changed Successfully" | "Reseller Id" | "Equal"         | "subdist2 (subdist2)" |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: STD-TC-28381 Operator is able to Edit Reseller of Main Distributor type
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <SEARCH_VALUE>
    And I click on edit reseller option
    And I Edit various fields Name, MSISDN, email, Parent, city, contractID <NAME> <MSISDN> <EMAIL> <PARENT> <RESELLER_LANGUAGE> <CITY> <ADDRESS_INFO> <REGION> <STATE> <AREA> <DEALER_ZONE> <CONTRACT_ID>
    Then I am able to validate proper message "Reseller Updated Successfully."
    Examples:
      | USERNAME   | PASSWORD | TYPE               | SEARCH_FIELD | SEARCH_VALUE | NAME                    | MSISDN | EMAIL                              | PARENT | RESELLER_LANGUAGE | CITY | ADDRESS_INFO | REGION | STATE | AREA | DEALER_ZONE | CONTRACT_ID |
      | "OPERATOR" | "2023"   | "Main Distributor" | "resellerId" | "MD3"        | "Main Distrib 3 Update" | ""     | "maindistrib3_updated@seamless.se" | ""     | "English"         | ""   | ""           | ""     | ""    | ""   | ""          | ""          |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: STD-TC-28389 Reseller is able to Edit Reseller of EVD Dealer type
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <SEARCH_VALUE>
    And I click on edit reseller option
    And I Edit various fields Name, MSISDN, email, Parent, city, contractID <NAME> <MSISDN> <EMAIL> <PARENT> <RESELLER_LANGUAGE> <CITY> <ADDRESS_INFO> <REGION> <STATE> <AREA> <DEALER_ZONE> <CONTRACT_ID>
    Then I am able to validate proper message "Reseller Updated Successfully."
    Then User should navigate to manage reseller children screen
    Examples:
      | USERNAME   | PASSWORD | TYPE         | SEARCH_FIELD | SEARCH_VALUE | NAME                | MSISDN | EMAIL                            | PARENT | RESELLER_LANGUAGE | CITY | ADDRESS_INFO | REGION | STATE | AREA | DEALER_ZONE | CONTRACT_ID |
      | "OPERATOR" | "2023"   | "EVD Dealer" | "resellerId" | "EVDDealer1" | "EVDDealer1 Update" | ""     | "EvdDealer1_updated@seamless.se" | ""     | "English"         | ""   | ""           | ""     | ""    | ""   | ""          | ""          |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: STD-TC-28392 Reseller is not able to Change reseller type of a reseller which is not a leaf node
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_ID> and expect "1" rows
    And I click on change reseller type option
    Then I am able to validate proper message <RESELLER_NAME>
    And I select reseller type Id <RESELLER_TYPE>
    And I click on next button
    And I click on submit button
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | RESELLER_ID | RESELLER_NAME    | SEARCH_FIELD | MESSAGE                                          | SELECT_COLUMN | SELECT_OPERATOR | RESELLER_TYPE     |
      | "OPERATOR" | "2023"   | "MD1"       | "Main Distrib 1" | "resellerId" | "reseller has children so it cannot be updated." | "Reseller Id" | "Equal"         | "Sub-Distributor" |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: Operator is able to Change reseller type of leaf node only
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_ID> and expect "1" rows
    And I click on change reseller type option
    Then I am able to validate proper message <RESELLER_NAME>
    And I select reseller type Id <RESELLER_TYPE>
    And I click on next button
    And I click on submit button
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | RESELLER_ID | RESELLER_NAME | SEARCH_FIELD | MESSAGE                               | SELECT_COLUMN | SELECT_OPERATOR | RESELLER_TYPE |
      | "OPERATOR" | "2023"   | "MD4"       | "MD4"         | "resellerId" | "Reseller Type updated successfully." | "Reseller Id" | "Equal"         | "EVD Dealer"  |

  #there is no approval mechanism for link/delink for sudani now so this test case is not applicable
  # @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  # Scenario Outline: Reseller is not able to link a reseller if reseller is not active
  #   When Session is enabled for user <USERNAME> and password <PASSWORD>
  #   When I navigate to the Resellers Page
  #   And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_ID>
  #   And I select multiple resellers <NUMBER_OF_RESELLERS>
  #   Then I Click on the block button
  #   Then I Enter a reason and click on Yes button
  #   Then I am able to validate proper message "SUCCESS"
  #   When I navigate to the Link-De-Link Page
  #   And I enter reseller id to link-delink <RESELLER_ID>
  #   And I click on Delink button
  #   Then I am able to validate proper message "You have successfully removed 249100000031 from your distribution tree."
  #   And I enter reseller id to link-delink <RESELLER_ID>
  #   And I click on Link button
  #   Then I am able to validate proper message "249100000031 is now registered to you as a sub-reseller."
  #   # And I approve Link request <MESSAGE>
  #   Examples:
  #     | USERNAME   | PASSWORD | SEARCH_FIELD | RESELLER_ID | TYPE              | NUMBER_OF_RESELLERS | MESSAGE         |
  #     | "subdist1" | "2023"   | "resellerId" | "POS14"     | "Sub Distributor" | "1"                 | "Access Denied" |

  @e2e-ss-regression @e2e-ss-smoke @ss-reseller
  Scenario Outline: All operators (equal) are visible under filters option
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Resellers Page
    Then I click on filters button
    And I select filter option <FILTER_OPTION>
    Examples:
      | USERNAME   | PASSWORD | FILTER_OPTION |
      | "Operator" | "2023"   | "Equal"       |

  ######################################################### ERS 5.0 FRAMEWORK ##################################################

  @e2e-seamless-one-ers5.0 @e2e-seamless-one-std-not-in-use @e2e-seamless-one-std-reseller
  Scenario Outline: UBP-2215: Edit Reseller to verify language of this non-monetary transaction message as per selected user
    When I enter userID <RESELLER_ID>
    And I enter password <PASSWORD>
    And I click on Login button
    Then I should see the message <RESELLER_ID> on the Home page
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME>
    And I click on edit reseller option
    And I Edit various fields Name, MSISDN, email, Parent, city, street, contractID <NAME> <MSISDN> <EMAIL> <PARENT> <CITY> <STREET> <REGION> <SALES_AREA> <CONTRACT_ID>
    Then I am able to validate proper message <MESSAGE>
    And User should navigate to manage reseller children screen
    And I logout
    Examples:
      | RESELLER_ID | PASSWORD | SEARCH_FIELD   | RESELLER_NAME       | NAME                       | MSISDN | EMAIL                                  | PARENT | CITY        | STREET                 | REGION | SALES_AREA | CONTRACT_ID | MESSAGE                             |
      | "DIST3"     | "2023"   | "resellerName" | "SubDistributor2-5" | "SubDistributor2-5-update" | ""     | "SubDistributor2-5-update@seamless.se" | ""     | "Stockholm" | "201 Stockholm Street" | ""     | ""         | ""          | "Revendeur mis à jour avec succès." |

  @e2e-seamless-one-ers5.0 @e2e-seamless-one-std-not-in-use @e2e-seamless-one-std-reseller
  Scenario Outline: UBP-2215: Edit Reseller via UBP Web Portal to update its language to a DMS's supported option
    When I enter userID <RESELLER_ID>
    And I enter password <PASSWORD>
    And I click on Login button
    Then I should see the message <RESELLER_ID> on the Home page
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME>
    And I click on edit reseller option
    And I edit Language field <LANGUAGE>
    Then I am able to validate proper message <MESSAGE>
    And User should navigate to manage reseller children screen
    And I logout
    Examples:
      | RESELLER_ID | PASSWORD | SEARCH_FIELD   | RESELLER_NAME       | LANGUAGE | MESSAGE                             |
      | "DIST3"     | "2023"   | "resellerName" | "SubDistributor2-5" | "French" | "Revendeur mis à jour avec succès." |

  @e2e-seamless-one-ers5.0 @e2e-seamless-one-std-not-in-use @e2e-seamless-one-std-reseller
  Scenario Outline: UBP-2215: Edit Reseller via UBP Web Portal to update its language to a DMS's non-supported option
    When I enter userID <RESELLER_ID>
    And I enter password <PASSWORD>
    And I click on Login button
    Then I should see the message <RESELLER_ID> on the Home page
    When I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME>
    And I click on edit reseller option
    And I edit Language field <LANGUAGE>
    Then I am able to validate proper message <ERROR_MESSAGE>
    And I logout
    Examples:
      | RESELLER_ID | PASSWORD | SEARCH_FIELD   | RESELLER_NAME       | LANGUAGE | ERROR_MESSAGE                                                  |
      | "DIST3"     | "2023"   | "resellerName" | "SubDistributor2-5" | "Arabic" | "La langue demandée n'est pas prise en charge par le système." |
