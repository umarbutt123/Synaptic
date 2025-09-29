Feature: 01-Login Feature
    As a user on the Unified Portal Application
    I want to test the login page

    Background:
        Given I am on the unified portal login page

    ##################### Sudani ##########################

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Performing login operation with passing test data as data table
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        Examples:
            | RESELLER_ID | PASSWORD |
            | "MD1"       | "2023"   |

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

    @e2e-ss-regression @e2e-ss-smoke @ss-login1
    Scenario Outline: Login via User ID into UBP Portal without credentials
        When Provide <RESELLER_ID> and login into system with blank userId
        # Then I am able to validate proper message <MESSAGE>
        Then I am able to validate error message below the field "User ID is required" "userId"
        Then I am able to validate error message below the field "Password is required" "password"
        Examples:
            | RESELLER_ID | MESSAGE         | LOGIN_TYPE                    |
            | ""          | "Enter User Id" | "userTypeBasedAuthentication" |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Change Password with same password entered in all fields
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD | ERROR_MESSAGE                                     |
            | "MD1"       | "2023"   | "2023"       | "2023"           | "Password is not allowed to be same as previous." |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Change Password with valid old password and matched new/confirm password without conformance to min/max length requirement
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | NEW_PASSWORD  | CONFIRM_PASSWORD | ERROR_MESSAGE                                    |
            | "MD1"       | "2023"   | "20241111sem" | "20241111sem"    | "password has to be max 4, current length is 11" |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: STD-TC-28030 Change Password with valid old password and mismatched new/confirm password once password is expired
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD | ERROR_MESSAGE          |
            | "MD1"       | "2023"   | "2024"       | "2025"           | "Passwords must match" |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Change Password with invalid old password and matched new/confirm password once password is expired
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <OLD_PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | OLD_PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD | ERROR_MESSAGE                      |
            | "MD1"       | "2023"   | "1111"       | "2024"       | "2024"           | "The old password is not correct." |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Change Password with empty old password and new/confirm password once password is expired
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <OLD_PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Then I am able to validate proper message below field <OLD_PASSWORD_ERROR> <OLD_FIELD>
        Then I am able to validate proper message below field <NEW_PASSWORD_ERROR> <NEW_FIELD>
        Then I am able to validate proper message below field <CONFIRM_PASSWORD_ERROR> <CONFIRM_FIELD>
        Examples:
            | RESELLER_ID | PASSWORD | OLD_PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD | ERROR_MESSAGE                     | OLD_PASSWORD_ERROR        | NEW_PASSWORD_ERROR        | CONFIRM_PASSWORD_ERROR       | OLD_FIELD      | NEW_FIELD      | CONFIRM_FIELD      |
            | "MD1"       | "2023"   | ""           | ""           | ""               | "newPassword is a required field" | "Enter your old password" | "Enter your new password" | "Enter Confirm New Password" | "Old Password" | "New Password" | "Confirm Password" |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    #issue in portal #need to modify this test case
    Scenario Outline: Change Password with Password History Limit greater than 1 once password is expired
        When Provide "Operator" and "2023" and login into system without BI Call
        And I navigate to the Reseller Password Policy Page
        And Password Policy created should be visible inside table "Reseller web user"
        When I update Password Policy with following parameters "Reseller web user" "Edit password policy" "" "4" "4" "" "" "" "" "" "" and ""
        And I enter password controls details "" "" "" "" "2" ""
        Then I click on update button
        Then I am able to validate proper message "Password policy updated successfully"
        Then I logout
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Then I logout
        When Provide "Operator" and "2023" and login into system without BI Call
        And I navigate to the Reseller Password Policy Page
        And Password Policy created should be visible inside table "Reseller web user"
        When I update Password Policy with following parameters "Reseller web user" "Edit password policy" "" "4" "4" "" "" "" "" "" "" and ""
        And I enter password controls details "" "" "" "" "1" ""
        Then I click on update button
        Then I am able to validate proper message "Password policy updated successfully"
        Examples:
            | RESELLER_ID | PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD | ERROR_MESSAGE                                                   |
            | "MD1"       | "2023"   | "2024"       | "2024"           | "user cannot update password as it already present in history!" |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Change Password with valid old password and banned password in new/confirm password fields once password is expired
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD | ERROR_MESSAGE      |
            | "MD1"       | "2023"   | "1234"       | "1234"           | "Banned password!" |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: STD-TC-28038 Change Password with valid old password and alphanumeric new/confirm password without conformance to Numeric Regex requirement once password is expired
        When Provide <RESELLER_ID> and <PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        And I perform Change Password operation having following parameters <PASSWORD> <NEW_PASSWORD> <CONFIRM_PASSWORD>
        When Provide <RESELLER_ID> and <NEW_PASSWORD> and login into system without BI Call
        Then I should see the message <RESELLER_ID> on the Home page
        Examples:
            | RESELLER_ID | PASSWORD | NEW_PASSWORD | CONFIRM_PASSWORD |
            | "MD1"       | "2023"   | "1a2a"       | "1a2a"           |
            | "MD1"       | "1a2a"   | "2023"       | "2023"           |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Forgot Password workflow via User ID with Invalid OTP verification code
        When I click on Having trouble signing in option
        And I click on forgot password
        And I enter userId <RESELLER_ID>
        And I click via SMS option
        When I enter invalid otp
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | ERROR_MESSAGE       |
            | "MD1"       | "OTP is not valid." |

    @e2e-ss-regression @e2e-ss-smoke @ss-login
    Scenario Outline: Forgot Password workflow via Invalid Reseller ID
        When I click on Having trouble signing in option
        And I click on forgot password
        And I enter userId <RESELLER_ID>
        And I click via SMS option
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | ERROR_MESSAGE                               |
            | "POS000"    | "Could not fetched Reseller Info from DMS." |

    ######################################################### ERS 5.0 FRAMEWORK ##################################################

    @e2e-seamless-one-ers5.0 @e2e-seamless-one-std-not-in-use @e2e-seamless-one-std-login
    Scenario Outline: UBP-2215: Login via User ID into UBP Web Portal by entering valid details after verifying language selection at password entry screen
        When I enter userID <RESELLER_ID>
        Then I verify Application Language label is available as per user's language <LANGUAGE_LABEL>
        And I verify Application Language value is selected as per user's language <LANGUAGE_VALUE>
        When I enter password <PASSWORD>
        And I click on Login button
        Then I should see the message <RESELLER_ID> on the Home page
        And I verify page title <PAGE_TITLE>
        And I logout
        Examples:
            | RESELLER_ID | PASSWORD | LANGUAGE_LABEL            | LANGUAGE_VALUE  | PAGE_TITLE                |
            | "DIST3"     | "2023"   | "Langue de l'application" | "FR - Français" | "Bienvenue à Seamless !!" |

    @e2e-seamless-one-ers5.0 @e2e-seamless-one-std-not-in-use @e2e-seamless-one-std-login
    Scenario Outline: UBP-2215: Login via User ID into UBP Web Portal by entering invalid details after verifying language selection at password entry screen
        When I enter userID <RESELLER_ID>
        Then I verify Application Language label is available as per user's language <LANGUAGE_LABEL>
        And I verify Application Language value is selected as per user's language <LANGUAGE_VALUE>
        When I enter password <PASSWORD>
        And I click on Login button
        Then I am able to validate proper message <ERROR_MESSAGE>
        Examples:
            | RESELLER_ID | PASSWORD | LANGUAGE_LABEL            | LANGUAGE_VALUE  | ERROR_MESSAGE                              |
            | "DIST3"     | "2024"   | "Langue de l'application" | "FR - Français" | "ID utilisateur ou mot de passe invalide." |