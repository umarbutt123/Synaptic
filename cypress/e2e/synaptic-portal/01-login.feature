Feature: 01-Login Feature
    As a user on the Synaptic flow Application
    I want to test the login page

    Background:
        Given I am on the Synaptic login page

    ##################### Synaptic ##########################

    @e2e-ss-regression @e2e-ss-smoke @login1
    Scenario Outline: Performing login operation with passing test data as data table
        When Provide <EMAIL> and <PASSWORD> and login into system
        Then I should see the message <NAME> on the Home page
        Examples:
            | EMAIL                              | PASSWORD    | NAME         |
            | "voulleddayeimei-2462@yopmail.com" | "Test@1234" | "Nisar Test" |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Performing login operation with passing invalid username as data table
        When Provide <RESELLER_ID> and <PASSWORD> and login into system with invalid user
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | MESSAGE                                     |
            | "MD11"      | "2023"   | "Could not fetched Reseller Info from DMS." |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Performing login operation with passing invalid password as data table
        When Provide <RESELLER_ID> and <PASSWORD> and login into system with invalid password
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD   | MESSAGE                       |
            | "MD1"       | "20231122" | "Invalid UserId or Password." |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Performing Change Password operation with passing test data as data table
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        When Provide <RESELLER_ID> and <NEW_PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        Examples:
            | RESELLER_ID | PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD |
            | "MD1"       | "2023"   | "2024"       | "2024"           |
            | "MD1"       | "2024"   | "2023"       | "2023"           |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Login via valid User ID and invalid password until maximum incorrect login attempts are made
        When Provide <RESELLER_ID> and <PASSWORD> and login into system with invalid password
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | RESELLER_ID      | PASSWORD | MESSAGE                                                               |
            | "BankAppDealer2" | "202011" | "Invalid UserId or Password."                                         |
            | "BankAppDealer2" | "202011" | "Invalid UserId or Password."                                         |
            | "BankAppDealer2" | "202011" | "Max incorrect login attempts reached. Please contact administrator." |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Performing Reset Wrong Password attempts operation with passing test data as data table
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        When I navigate to the Resellers Page
        And I enter reseller info with parameters <SEARCH_FIELD> <RESELLER_NAME>
        And I Click on the eye icon against any reseller from the list
        And I click on Reseller User Information
        Then I perform Reset Wrong Password Attempts operation
        Then I am able to validate proper message <MESSAGE>
        Then I logout
        Examples:
            | RESELLER_ID | PASSWORD | SEARCH_FIELD | RESELLER_NAME    | MESSAGE                              |
            | "Operator"  | "2023"   | "resellerId" | "BankAppDealer2" | "Reseller User Updated Successfully" |