Feature: 17-Product Taxes Feature

  As a user on the unified portal Application
  I want to add product taxes

  Background: Enter UserId and Password and perform Login
    Given I am on the unified portal login page

  #bug card UBP-1678
  ##################### Sudani ##########################

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41912,TC-41922,TC-41928,TC-41929:Performing Create Product Tax with percent value by passing test data as data table
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Submit button
    Then I am able to validate proper message <MESSAGE>
    And I am able to search existing Product Tax <TAX_TYPE>
    And Product Tax created should be visible inside table <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE          | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION            | MESSAGE   | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "Automation_Tax1" | "10"          | ""          | "creating product tax" | "Success" | "Test"    | "10"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41912,TC-41922,TC-41928,TC-41929:Performing Create Product Tax with fixed value by passing test data as data table
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Submit button
    Then I am able to validate proper message <MESSAGE>
    And I am able to search existing Product Tax <TAX_TYPE>
    And Product Tax created should be visible inside table <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE          | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION            | MESSAGE   | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "Automation_Tax2" | ""            | "10"        | "creating product tax" | "Success" | "Test"    | "10"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41930:Performing Update Tax with Operator login
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    And I am able to search existing Product Tax <EXSITING_TAX_TYPE>
    When I perform Update Product Tax having following parameters <NEW_TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Update button
    Then I am able to validate proper message <MESSAGE>
    And I am able to search existing Product Tax <NEW_TAX_TYPE>
    And Product Tax created should be visible inside table <NEW_TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE>
    Examples:
      | USERNAME   | PASSWORD | EXSITING_TAX_TYPE | NEW_TAX_TYPE       | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION                    | MESSAGE   | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "Automation_Tax2" | "Automation_Tax02" | ""            | "20"        | "creating product tax updated" | "Success" | "Test1"   | "20"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41946:Performing View Tax with Operator login
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    And I am able to search existing Product Tax <TAX_TYPE>
    When I perform View Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE           | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION                    | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "Automation_Tax02" | ""            | "20"        | "creating product tax updated" | "Test1"   | "20"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41927:Performing Data value and data name field can be deleted
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I Delete data value and data name field
    Then I validate data value and data name should not be visibled
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE           | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION            | MESSAGE   | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "Automation_Tax03" | "50"          | ""          | "creating product tax" | "Success" | "Test"    | "10"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41923:Performing Description length test in Tax
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Submit button
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE           | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | MESSAGE                                               | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "Automation_Tax04" | ""            | "12"        | "20GBdjebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou32rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqvdjebdiebibubucb2fbd3ubfu3bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou2rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqvdjebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23ur" | "description field is must be less than to 255 chars" | "Test"    | "10"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41923:Performing Tax type length test in Tax
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Submit button
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION | MESSAGE                                        | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "20GBdjebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou32rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqvdjebdiebibubucb2fbd3ubfu3bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou2rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqvdjebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23ur" | ""            | "12"        | "TEST"      | "Tax type field must be less than to 60 chars" | "Test"    | "10"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41957:Performing Manage view of Taxes table using Row per page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    # When Provide <USERNAME> and <PASSWORD> and login into system without BI Call
    And I navigate to the Product Tax Page
    When I provide rows per page count <COUNT_AS_TEN>
    # And I scroll to Bottom if area is scrollable
    Then I verify rows per page count inside table less than or equal to <COUNT_AS_TEN>
    When I provide rows per page count <COUNT_AS_TWENTY>
    # And I scroll to Bottom if area is scrollable
    Then I verify rows per page count inside table less than or equal to <COUNT_AS_TWENTY>
    When I provide rows per page count <COUNT_AS_FIFTY>
    # And I scroll to Bottom if area is scrollable
    Then I verify rows per page count inside table less than or equal to <COUNT_AS_FIFTY>
    When I provide rows per page count <COUNT_AS_HUNDRED>
    # And I scroll to Bottom if area is scrollable
    Then I verify rows per page count inside table less than or equal to <COUNT_AS_HUNDRED>
    Examples:
      | USERNAME   | PASSWORD | COUNT_AS_TEN | COUNT_AS_TWENTY | COUNT_AS_FIFTY | COUNT_AS_HUNDRED |
      | "OPERATOR" | "2023"   | "10"         | "20"            | "50"           | "100"            |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41949:Filter search of Tax using invalid data
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    And I am able to search existing Product Tax <PRODUCT_TAX>
    Then I validate Product Tax should not be visible
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_TAX |
      | "OPERATOR" | "2023"   | "100000"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41923:Performing blank Data value and data name field
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I remove data from data value and data name field
    And I click on Submit button
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE           | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION            | MESSAGE                              | DATA_NAME | DATA_VALUE |
      | "OPERATOR" | "2023"   | "Automation_Tax04" | ""            | "12"        | "creating product tax" | "DataName field should not be empty" | "Test"    | "10"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41955:Performing Hide and Show columns of TAX Table
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    And I perform Hide all columns operation
    Then I validate columns should not be displayed in the table
    And I perform Show all columns operation
    Then I validate columns should be displayed in the table
    Examples:
      | USERNAME   | PASSWORD |
      | "OPERATOR" | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41951:Performing Download Tax Report
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    And I click on export button
    And I click on download button
    And I read file name <FILE_NAME>
    Then I delete file name <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | FILE_NAME  |
      | "OPERATOR" | "2023"   | "data.csv" |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41925: Verify that Text field length for Data value should be below 255 character while creating Tax
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Submit button
    Then I am able to validate error message below the field <DATA_VALUE_MESSAGE> <DATA_VALUE_LABEL>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE           | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION            | DATA_NAME | DATA_VALUE                                                                                                                                                                                                                                                                                         | DATA_VALUE_MESSAGE                                  | DATA_VALUE_LABEL                       |
      | "OPERATOR" | "2023"   | "Automation_Tax04" | "10"          | ""          | "creating product tax" | "Test"    | "djebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou32rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqvdjebdiebibubucb2fbd3ubfu" | "Value should be less than equal to 255 characters" | "product-taxes-data-value-input-box-0" |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41924: Verify that Text field length for Data name should be below 255 character while creating Tax
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Submit button
    Then I am able to validate error message below the field <DATA_NAME_MESSAGE> <DATA_NAME_LABEL>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE           | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION            | DATA_VALUE | DATA_NAME                                                                                                                                                                                                                                                                                          | DATA_NAME_MESSAGE                                   | DATA_NAME_LABEL                       |
      | "OPERATOR" | "2023"   | "Automation_Tax04" | "10"          | ""          | "creating product tax" | "Test"     | "djebdiebibubucb2fbd3ubfu32bfciu3r2fbciu32rbfci3ur2bfci3r2bfci32rfbi3rfhbr3uifbu3oribfciu3rbfci3ufbcr3qubvcou3rbcv23fou3rbfcou23bfco23urbvco23rubvc2o3rubvo23ruvbc3or2ubfcou32rbfou23rbfcou32rbvo2ubvcou23rbcvfihcoqhcuqhvcqnqvjnvckjqnvbkjqbvnkqjvbnkdhhdhdhhddhhdhdhdqvdjebdiebibubucb2fbd3ubfu" | "Value should be less than equal to 255 characters" | "product-taxes-data-name-input-box-0" |

  @e2e-ss-regression @e2e-ss-smoke @ss-product @ss-product-tax
  Scenario Outline: TC-41928,TC-41942: User can enter percent value between 0 to 100 while creating and updating Tax
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Product Tax Page
    When I perform Create Product Tax having following parameters <TAX_TYPE> <PERCENT_VALUE> <FIXED_VALUE> <DISCRIPTION> <DATA_NAME> <DATA_VALUE>
    And I click on Submit button
    Then I am able to validate proper message below field <PERCENT_VALUE_MESSAGE> <PERCENT_VALUE_LABEL>
    Examples:
      | USERNAME   | PASSWORD | TAX_TYPE           | PERCENT_VALUE | FIXED_VALUE | DISCRIPTION            | DATA_VALUE | DATA_NAME | PERCENT_VALUE_MESSAGE                                          | PERCENT_VALUE_LABEL |
      | "OPERATOR" | "2023"   | "Automation_Tax04" | "10000"       | ""          | "creating product tax" | "test"     | "test"    | "Value should be more than equal to 0,less then equal to 100!" | "Percent Value"     |
