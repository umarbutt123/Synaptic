Feature: 01-Login Feature
    As a user on the Synaptic flow Application
    I want to test the login page

    Background:
        Given I am on the Synaptic login page

    ##################### Synaptic ##########################

    @login
    Scenario Outline: Performing login operation with passing test data as data table
        When Provide <EMAIL> and <PASSWORD> and login into system
        Then I should see the message <NAME> on the Home page
        Examples:
            | EMAIL                              | PASSWORD    | NAME         |
            | "voulleddayeimei-2462@yopmail.com" | "Test@1234" | "Nisar Test" |

    @login
    Scenario Outline: Performing login operation with passing invalid username as data table
        When Provide <RESELLER_ID> and <PASSWORD> and login into system with invalid user
        Then I am able to validate proper message <MESSAGE>
        Examples:
            | EMAIL                                | PASSWORD    | MESSAGE               |
            | "voullaaeddayeimei-2462@yopmail.com" | "Test@1234" | "Invalid credentials" |