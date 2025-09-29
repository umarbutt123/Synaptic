Feature: 19-KYC Feature

  As a user on the unified portal Application
  I want to Register kyc

  Background: Enter UserId and Password annd perform Login
    Given I am on the unified portal login page

  ##################### Sudani ##########################

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42046 Only Operator can Register Main Distributor type of Reseller.
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I select reseller type <RESELLER_TYPE>
    When I enter personal information and click next button <RESELLER_TYPE> <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
    And I enter address information and click next button <ADDRESS> <COUNTRY> <CITY> <REGION> <STATE> <AREA> <DEALER_ZONE>
    And I enter additional information and click next button <STATUS> <USER_SUB_TYPE> <PASSWORD> <DOCUMENT_TYPE> <FILE_NAME>
    Then I am able to validate proper message <MESSAGE>
    And I navigate to the Search KYC page
    And I select search key <SEARCH_KEY>
    And I enter search value <RESELLER_MSISDN>
    And I click search button
    And I verify reseller status in table <COLUMN_NAME> <RESELLER_STATUS>
    And I click on view button
    And I verify view page should have same data <NAME_OF_COLUMN> <FIRST_NAME> <RESELLER_ID> <RESELLER_MSISDN> <JURDICAL_NAME>
    And I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_MSISDN>
    And I verify reseller status in table <COLUMN_NAME2> <RESELLER_STATUS2>
    Examples:
      | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE      | MESSAGE                         | FIRST_NAME    | RESELLER_ID   | RESELLER_LANGUAGE | EMAIL                | RESELLER_MSISDN | JURDICAL_NAME   | ADDRESS        | CITY        | COUNTRY | REGION    | STATE     | AREA    | DEALER_ZONE      | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE   | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN |
      | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Main Distributor" | "Customer created successfully" | "MD-1-3-test" | "MD-1-3-test" | "English"         | "MD-1-1@seamless.se" | "249101800138"  | "DIST-1-3-test" | "test_address" | "test_city" | "SUDAN" | "Central" | "AlGZIRA" | "TABAT" | "Al-Hasahisa-DZ" | "Operator (Operator)" | "Active" | ""            | "2023"    | "Date of birth" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42048 Only Operator can Register Banks And App Dealer type of Resellers
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I verify Search and Register options are visible <MENU1> <MENU2>
    And I select reseller type <RESELLER_TYPE>
    When I enter personal information and click next button <RESELLER_TYPE> <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
    And I enter address information and click next button <ADDRESS> <COUNTRY> <CITY> <REGION> <STATE> <AREA> <DEALER_ZONE>
    And I enter additional information and click next button <STATUS> <USER_SUB_TYPE> <PASSWORD> <DOCUMENT_TYPE> <FILE_NAME>
    Then I am able to validate proper message <MESSAGE>
    And I navigate to the Search KYC page
    And I select search key <SEARCH_KEY>
    And I enter search value <RESELLER_MSISDN>
    And I click search button
    And I verify reseller status in table <COLUMN_NAME> <RESELLER_STATUS>
    And I click on view button
    And I verify view page should have same data <NAME_OF_COLUMN> <FIRST_NAME> <RESELLER_ID> <RESELLER_MSISDN> <JURDICAL_NAME>
    And I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_MSISDN>
    And I verify reseller status in table <COLUMN_NAME2> <RESELLER_STATUS2>
    Examples:
      | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE          | MESSAGE                         | FIRST_NAME           | RESELLER_ID          | RESELLER_LANGUAGE | EMAIL                 | RESELLER_MSISDN | JURDICAL_NAME  | ADDRESS        | CITY        | COUNTRY | REGION    | STATE     | AREA    | DEALER_ZONE      | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE    | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN |
      | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Banks and App Dealer" | "Customer created successfully" | "BADDealer-1-3-test" | "BADDealer-1-3-test" | "English"         | "BAD-1-1@seamless.se" | "249101800139"  | "BAD-1-3-test" | "test_address" | "test_city" | "SUDAN" | "Central" | "AlGZIRA" | "TABAT" | "Al-Hasahisa-DZ" | "Operator (Operator)" | "Active" | ""            | "2023"    | "Identity Proof" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42050 Only Operator can Register PoS type of Reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I verify Search and Register options are visible <MENU1> <MENU2>
    And I select reseller type <RESELLER_TYPE>
    When I enter personal information and click next button <RESELLER_TYPE> <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
    And I enter address information and click next button <ADDRESS> <COUNTRY> <CITY> <REGION> <STATE> <AREA> <DEALER_ZONE>
    And I enter additional information and click next button <STATUS> <USER_SUB_TYPE> <PASSWORD> <DOCUMENT_TYPE> <FILE_NAME>
    Then I am able to validate proper message <MESSAGE>
    And I navigate to the Search KYC page
    And I select search key <SEARCH_KEY>
    And I enter search value <RESELLER_MSISDN>
    And I click search button
    And I verify reseller status in table <COLUMN_NAME> <RESELLER_STATUS>
    And I click on view button
    And I verify view page should have same data <NAME_OF_COLUMN> <FIRST_NAME> <RESELLER_ID> <RESELLER_MSISDN> <JURDICAL_NAME>
    And I navigate to the Resellers Page
    And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_MSISDN>
    And I verify reseller status in table <COLUMN_NAME2> <RESELLER_STATUS2>
    Examples:
      | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE | MESSAGE                         | FIRST_NAME     | RESELLER_ID    | RESELLER_LANGUAGE | EMAIL                 | RESELLER_MSISDN | JURDICAL_NAME  | ADDRESS        | CITY        | COUNTRY | REGION    | STATE     | AREA    | DEALER_ZONE      | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE    | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN |
      | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "PoS"         | "Customer created successfully" | "POS-1-3-test" | "POS-1-3-test" | "English"         | "POS-1-1@seamless.se" | "249101800140"  | "POS-1-3-test" | "test_address" | "test_city" | "SUDAN" | "Central" | "AlGZIRA" | "TABAT" | "Al-Hasahisa-DZ" | "subdist2 (subdist2)" | "Active" | ""            | "2023"    | "Identity Proof" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         |

  # @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  # Scenario Outline:TC-42052 Only Operator can Register Adhoc type of Resellers
  #   When Session is enabled for user <USERNAME> and password <PASSWORD>
  #   And I navigate to the Register KYC page
  #   And I verify Search and Register options are visible <MENU1> <MENU2>
  #   And I select reseller type <RESELLER_TYPE>
  #   And I enter personal information for Adhoc User type and click next button <FIRST_NAME> <RESELLER_ID> <EMAIL> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
  #   And I enter user information and click submit button <USER_ROLE> <ROLE_START_DATE> <ROLE_END_DATE>
  #   Then I am able to validate proper message <MESSAGE>
  #   And I navigate to the Search KYC page
  #   And I select search key <SEARCH_KEY>
  #   And I enter search value <RESELLER_MSISDN>
  #   And I click search button
  #   And I verify reseller status in table <COLUMN_NAME> <RESELLER_STATUS>
  #   And I click on view button
  #   And I verify view page for adhoc user type should have same data <NAME_OF_COLUMN> <FIRST_NAME> <RESELLER_MSISDN>
  #   And I navigate to the Resellers Page
  #   And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_MSISDN>
  #   And I verify reseller status in table <COLUMN_NAME2> <RESELLER_STATUS2>
  #   Examples:
  #     | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE | MESSAGE                         | FIRST_NAME       | RESELLER_ID      | RESELLER_LANGUAGE | EMAIL                   | RESELLER_MSISDN |  | DEALER_ZONE      | COUNTRY | RESELLER_PARENT       | STATUS   | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN | USER_ROLE | ROLE_START_DATE | ROLE_END_DATE |
  #     | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Adhoc User"  | "Customer created successfully" | "adhoc-1-3-test" | "adhoc-1-3-test" | "English"         | "adhoc-1-1@seamless.se" | "249101800141"  |  | "Al-Hasahisa-DZ" | "sudan" | "Operator (Operator)" | "Active" | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         | "webuser" | "2024/03/12"    | "2026/04/15"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42061 Verify that user only able navigate to Next page after filling all mandatory fields while Registering a KYC.
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I select reseller type <RESELLER_TYPE>
    When I enter personal information and click next button <RESELLER_TYPE> <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
    And I enter address information <ADDRESS> <COUNTRY> <CITY> <REGION> <STATE> <AREA> <DEALER_ZONE>
    Then I verify next button is disabled
    Examples:
      | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE      | MESSAGE                       | FIRST_NAME     | RESELLER_ID    | RESELLER_LANGUAGE | EMAIL                    | RESELLER_MSISDN | JURDICAL_NAME       | ADDRESS        | CITY        | COUNTRY | REGION | STATE | AREA | DEALER_ZONE | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE   | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN |
      | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Main Distributor" | "Region is a required field!" | "MainDist-2-1" | "MainDist-2-1" | "English"         | "MainDist-2@seamless.se" | "249101800142"  | "MainDIST-1-3-test" | "test_address" | "test_city" | "SUDAN" | ""     | ""    | ""   | ""          | "Operator (Operator)" | "Active" | ""            | "2023"    | "Date of birth" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42055 KYC Registering with duplicate data
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I select reseller type <RESELLER_TYPE>
    When I enter personal information and click next button <RESELLER_TYPE> <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE      | MESSAGE                                                                            | FIRST_NAME    | RESELLER_ID   | RESELLER_LANGUAGE | EMAIL                    | RESELLER_MSISDN | JURDICAL_NAME       | ADDRESS        | CITY        | COUNTRY | REGION | STATE | AREA | DEALER_ZONE | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE   | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN |
      | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Main Distributor" | "You cannot register as a reseller, As this Msisdn already exist in Active state." | "MainDist1-2" | "MainDist1-2" | "English"         | "MainDist-2@seamless.se" | "249100000001"  | "MainDIST-1-2-test" | "test_address" | "test_city" | "SUDAN" | ""     | ""    | ""   | ""          | "Operator (Operator)" | "Active" | ""            | "2023"    | "Date of birth" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline: Verify that Main Distributor,POS,Bank app dealer and EVD Dealer are not able to see KYC menu in portal.
    When Provide <USERNAME> and <PASSWORD> and login into system without BI Call
    And I navigate to the Register KYC page and verify KYC page is not accessible
    Then I logout
    Examples:
      | USERNAME     | PASSWORD |
      | "MD1"        | "2023"   |
      | "EVDDealer1" | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42174 Filter search of KYC using different columns value(contains, equal , starts with and end with) data in KYC SEARCH page.
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Search KYC page
    Then I click on filters
    And I select filter column <COLUMN_NAME>
    And I select filter option <OPERATOR>
    And I enter filter value <VALUE>
    And I verify reseller status in table <COLUMN_NAME> <VALUE>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME     | OPERATOR | VALUE          |
      # | "Operator" | "2023"   | "Customer Id"   | "equals" | "MD-1-3-test"  |
      | "Operator" | "2023"   | "MSISDN"        | "equals" | "249101800139" |
      | "Operator" | "2023"   | "Reseller Name" | "equals" | "POS-1-3-test" |
      | "Operator" | "2023"   | "Creater Id"    | "equals" | "Operator"     |
      | "Operator" | "2023"   | "Kyc Status"    | "equals" | "APPROVED"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42178 User can Search KYC using Search key filter option in KYC SEARCH page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Search KYC page
    And I select search key <SEARCH_KEY>
    And I enter search value <VALUE>
    And I click search button
    And I verify reseller status in table <SEARCH_COLUMN> <VALUE>
    Examples:
      | USERNAME   | PASSWORD | SEARCH_KEY      | SEARCH_COLUMN | VALUE          |
      # | "Operator" | "2023"   | "Customer Id"   | "Customer Id" | "MD-1-3-test"  |
      | "Operator" | "2023"   | "Reseller Name" | "First Name"  | "POS-1-3-test" |
      | "Operator" | "2023"   | "KYC Status"    | "Kyc Status"  | "APPROVED"     |
      | "Operator" | "2023"   | "MSISDN"        | "MSISDN"      | "249101800139" |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline: User can manage the table using Row per page option in KYC page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Search KYC page
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
    Examples:
      | USERNAME   | PASSWORD | COUNT_AS_TEN | COUNT_AS_TWENTY | COUNT_AS_FIFTY | COUNT_AS_HUNDRED |
      | "Operator" | "2023"   | "10"         | "20"            | "50"           | "100"            |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42056 Mobile number validation while registering a Reseller
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I select reseller type <RESELLER_TYPE>
    When I enter personal information <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
    Then I am able to validate error message below the field <MESSAGE> <FIELD_NAME>
    Examples:
      | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE      | MESSAGE                                                                                                                                      | FIRST_NAME    | RESELLER_ID   | RESELLER_LANGUAGE | EMAIL                    | RESELLER_MSISDN | JURDICAL_NAME       | ADDRESS        | CITY        | COUNTRY | REGION | STATE | AREA | DEALER_ZONE | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE   | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN | FIELD_NAME         |
      | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Main Distributor" | "You've entered invalid Reseller MSISDN, It doesn't match with required pattern or entered characters exceeds more than allowed characters." | "MainDist1-2" | "MainDist1-2" | "English"         | "MainDist-2@seamless.se" | "247100000001"  | "MainDIST-1-2-test" | "test_address" | "test_city" | "SUDAN" | ""     | ""    | ""   | ""          | "Operator (Operator)" | "Active" | ""            | "2023"    | "Date of birth" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         | "msisdn-input-box" |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42177 User can modify columns of the table using Columns option
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Search KYC page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    And I enter column title <COLUMN_NAME2>
    And I verify toggle list is filtered <COLUMN_NAME2>
    Then I click on toggle button <TOGGLE_COLUMN2>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME2>
    And I enter column title <COLUMN_NAME3>
    And I verify toggle list is filtered <COLUMN_NAME3>
    Then I click on toggle button <TOGGLE_COLUMN3>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME3>
    And I click on columns button
    And I perform Hide all columns operation
    Then I validate columns should not be displayed in the table
    And I perform Show all columns operation
    Then I validate columns should be displayed in the table
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME   | TOGGLE_COLUMN | RESELLER_TYPE | COLUMN_NAME2    | COLUMN_NAME3 | TOGGLE_COLUMN2 | TOGGLE_COLUMN3 |
      | "OPERATOR" | "2023"   | "Customer Id" | "customerId"  | "Distributor" | "Reseller Name" | "Creater Id" | "firstName"    | "createrId"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline:TC-42175 User can Download KYC Report in csv format
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Search KYC page
    And I select search key <SEARCH_KEY>
    And I enter search value <SEARCH_VALUE>
    And I click search button
    And I verify reseller status in table <COLUMN_NAME> <KYC_STATUS>
    And I click on export button
    And I click on download button
    And I read file name <FILE_NAME>
    Then I delete file name <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | FILE_NAME  | COLUMN_NAME  | KYC_STATUS | SEARCH_VALUE | SEARCH_KEY   |
      | "OPERATOR" | "2023"   | "data.csv" | "Kyc Status" | "APPROVED" | "APPROVED"   | "KYC Status" |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline: Verify Special Character in Name field is visible in Search Screen Properly and able to View it in Details page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I select reseller type <RESELLER_TYPE>
    When I enter personal information and click next button <RESELLER_TYPE> <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
    And I enter address information and click next button <ADDRESS> <COUNTRY> <CITY> <REGION> <STATE> <AREA> <DEALER_ZONE>
    And I enter additional information and click next button <STATUS> <USER_SUB_TYPE> <PASSWORD> <DOCUMENT_TYPE> <FILE_NAME>
    Then I am able to validate proper message <MESSAGE>
    And I navigate to the Search KYC page
    And I select search key <SEARCH_KEY>
    And I enter search value <RESELLER_MSISDN>
    And I click search button
    And I verify reseller status in table <COLUMN_NAME> <RESELLER_STATUS>
    And I click on view button
    And I verify view page should have same data <NAME_OF_COLUMN> <FIRST_NAME> <RESELLER_ID> <RESELLER_MSISDN> <JURDICAL_NAME>
    Examples:
      | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE      | MESSAGE                         | FIRST_NAME       | RESELLER_ID | RESELLER_LANGUAGE | EMAIL                | RESELLER_MSISDN | JURDICAL_NAME | ADDRESS        | CITY        | COUNTRY | REGION    | STATE     | AREA    | DEALER_ZONE      | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE   | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN |
      | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Main Distributor" | "Customer created successfully" | "D-@1234-#$%^&*" | "MD-1-3-5"  | "English"         | "MD-1-3@seamless.se" | "249101801262"  | "MD-1-3-test" | "test_address" | "test_city" | "SUDAN" | "Central" | "AlGZIRA" | "TABAT" | "Al-Hasahisa-DZ" | "Operator (Operator)" | "Active" | ""            | "2023"    | "Date of birth" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline: User can Search KYC using Search key filter option in KYC SEARCH page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Search KYC page
    And I verify edit button is not available
    And I verify view button is available
    Examples:
      | USERNAME   | PASSWORD |
      | "Operator" | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-kyc
  Scenario Outline: Verify that only Operator user should have SEARCH and REGISTER page .
    When Session is enabled for user <RESELLER_ID> and password <PASSWORD>
    And I navigate to the Register KYC page
    And I verify Search and Register options are visible <MENU1> <MENU2>
    Examples:
      | RESELLER_ID | PASSWORD | MENU1    | MENU2      |
      | "Operator"  | "2023"   | "SEARCH" | "REGISTER" |


#Reseller id field is now auto generated, so this test case is not applicable
# @e2e-ss-regression-not-now @e2e-ss-smoke-not-now @test-not-now
# Scenario Outline: Verify that while registering KYC ,Text fields should have maximum 60 characters
#   When Session is enabled for user <USERNAME> and password <PASSWORD>
#   And I navigate to the Register KYC page
#   And I select reseller type <RESELLER_TYPE>
#   When I enter personal information and click next button <RESELLER_TYPE> <FIRST_NAME> <EMAIL> <RESELLER_PARENT> <JURDICAL_NAME> <RESELLER_MSISDN> <RESELLER_LANGUAGE>
#   And I enter address information and click next button <ADDRESS> <COUNTRY> <CITY> <REGION> <STATE> <AREA> <DEALER_ZONE>
#   And I enter additional information and click next button <STATUS> <USER_SUB_TYPE> <PASSWORD> <DOCUMENT_TYPE> <FILE_NAME>
#   Then I am able to validate proper message <MESSAGE>
#   Examples:
#     | USERNAME   | PASSWORD | MENU1    | MENU2      | RESELLER_TYPE      | MESSAGE                                                                           | FIRST_NAME | RESELLER_ID                                                         | RESELLER_LANGUAGE | EMAIL                | RESELLER_MSISDN | JURDICAL_NAME | ADDRESS        | CITY        | COUNTRY | REGION    | STATE     | AREA    | DEALER_ZONE      | RESELLER_PARENT       | STATUS   | USER_SUB_TYPE | PASSWORD1 | DOCUMENT_TYPE   | FILE_NAME         | SCC_STATUS | SEARCH_KEY | COLUMN_NAME  | RESELLER_STATUS | SEARCH_FIELD     | COLUMN_NAME2 | RESELLER_STATUS2 | NAME_OF_COLUMN |
#     | "OPERATOR" | "2023"   | "SEARCH" | "REGISTER" | "Main Distributor" | "Reseller Rollback: Failed to check canCreateAccount.Couldn't insert account Ids" | "MD-1-2"   | "PfgVh9Zoils7vceBWDPpOiapPURAse9EOQtUdNZfFiYRWwapHVZUZz2m1gznCbekH" | "English"         | "MD-1-3@seamless.se" | "249101800098"  | "MD-1-3-test" | "test_address" | "test_city" | "SUDAN" | "Central" | "AlGZIRA" | "TABAT" | "Al-Hasahisa-DZ" | "Operator (Operator)" | "Active" | ""            | "2023"    | "Date of birth" | "unified/DOB.jpg" | "Active"   | "MSISDN"   | "Kyc Status" | "APPROVED"      | "resellerMSISDN" | "Status"     | "Active"         | "Name"         |
