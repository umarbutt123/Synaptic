Feature: 15-Inventory Feature

  As a user on the unified portal Application
  I want to perform inventory operation

  Background: Enter UserId and Password annd perform Login
    Given I am on the unified portal login page

  ######################## Sudani ########################

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Self inventory view
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the Inventories Page
    Then I verify different inventory operations
    When I navigate to the Inventories Page
    Then I verify page title "View and Manage Inventories"
    When I navigate to the Detailed Inventory Page
    Then I verify page title "Detailed Inventory View"
    And I click on first view button for inventory
    Then I verify page title "Detailed Inventory View"
    Examples:
      | USERNAME   | PASSWORD |
      | "OPERATOR" | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventories
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    Then I verify searched product availabe in the table with <PRODUCT_NAME> <CATEGORY_PATH> <PRODUCT_SKU> <PRODUCT_TYPE>
    And I click on action button of searched product
    Then I verify page title "Inventory Boxes"
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY    | PRODUCT_NAME | REGION    | STATE     | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH               | PRODUCT_TYPE |
      | "OPERATOR" | "2023"   | "SIM_4G"    | "Physical Products" | "SIM_4G"     | "Central" | "AlGZIRA" | "Warehouse"   | "Warehouse1"  | "Physical Products/SIM_4G/" | "serialised" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventories by region and sales area
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    Then I verify searched product availabe in the table with <PRODUCT_NAME> <CATEGORY_PATH> <PRODUCT_SKU> <PRODUCT_TYPE>
    And I click on action button of searched product
    And I scroll to right
    And I verify region <REGION>
    And I verify state <STATE>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY    | PRODUCT_NAME | REGION    | STATE     | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH               | PRODUCT_TYPE |
      | "OPERATOR" | "2023"   | "SIM_4G"    | "Physical Products" | "SIM_4G"     | "Central" | "AlGZIRA" | ""            | ""            | "Physical Products/SIM_4G/" | "serialised" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by product category
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    Then I verify searched product availabe in the table with <PRODUCT_NAME> <CATEGORY_PATH> <PRODUCT_SKU> <PRODUCT_TYPE>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY    | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH | PRODUCT_TYPE |
      | "OPERATOR" | "2023"   | ""          | "Physical Products" | "SIM_4G"     | ""     | ""    | ""            | ""            | ""            | "serialised" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by multiple product category
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search with multiple product category <PRODUCT_CATEGORY1> <PRODUCT_CATEGORY2>
    And I uncheck Include own inventory
    And I click on search button
    Then I click on filters
    And I select filter column <COLUMN_NAME>
    And I select filter option <OPERATOR>
    And I enter filter value <PRODUCT>
    And I verify product details in table <COLUMN_NAME> <PRODUCT>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY1   | PRODUCT_CATEGORY2  | COLUMN_NAME | OPERATOR | PRODUCT  |
      | "OPERATOR" | "2023"   | ""          | "Physical Products" | "Digital Products" | "Name"      | "equals" | "SIM_4G" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by product name
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    And I verify product details in table <COLUMN_NAME> <PRODUCT_NAME>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH | COLUMN_NAME |
      | "OPERATOR" | "2023"   | ""          | ""               | "SIM_4G"     | ""     | ""    | ""            | ""            | ""            | "Name"      |

  # @e2e-seamless-one-ss-smoke-not-in-use @e2e-seamless-one-ss-inventories-not-in-use
  # Scenario Outline: Search Inventory by product category without self inventory
  #   When Session is enabled for user <USERNAME> and password <PASSWORD>
  #   When I navigate to the Inventories Page
  #   And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
  #   And I uncheck Include own inventory
  #   And I click on search button
  #   And I verify product details in table <COLUMN_NAME> <COLUMN_VALUE>
  #   Examples:
  #     | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY    | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH | PRODUCT_TYPE               | COLUMN_NAME | COLUMN_VALUE                |
  #     | "OPERATOR" | "2023"   | ""          | "Physical Products" | ""           | ""     | ""    | ""            | ""            | ""            | "trackable-non-serialised" | "Category"  | "Physical Products/SIM_4G/" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by product SKU
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    And I verify product details in table <COLUMN_NAME> <PRODUCT_SKU>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH | COLUMN_NAME   |
      | "OPERATOR" | "2023"   | "SIM_4G"    | ""               | ""           | ""     | ""    | ""            | ""            | ""            | "Product SKU" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by multiple product SKU
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search with multiple product SKU <PRODUCT_SKU1> <PRODUCT_SKU2>
    Then I click on filters
    And I select filter column <COLUMN_NAME>
    And I select filter option <OPERATOR>
    And I enter filter value <PRODUCT>
    And I verify product details in table <COLUMN_NAME> <PRODUCT>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_SKU1 | PRODUCT_SKU2 | COLUMN_NAME | OPERATOR | PRODUCT  |
      | "OPERATOR" | "2023"   | ""          | "SIM_4G"     | "SIM_5G"     | "Name"      | "equals" | "SIM_4G" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by multiple product name
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search with multiple product name <PRODUCT_NAME1> <PRODUCT_NAME2>
    Then I click on filters
    And I select filter column <COLUMN_NAME>
    And I select filter option <OPERATOR>
    And I enter filter value <PRODUCT_NAME1>
    And I verify product details in table <COLUMN_NAME> <PRODUCT_NAME1>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_NAME1 | PRODUCT_NAME2 | COLUMN_NAME | OPERATOR |
      | "OPERATOR" | "2023"   | ""          | "SIM_4G"      | "SIM-5G"      | "Name"      | "equals" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by product Name without self inventory
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    And I uncheck Include own inventory
    And I click on search button
    And I verify product details in table <COLUMN_NAME> <PRODUCT_NAME>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH | PRODUCT_TYPE               | COLUMN_NAME |
      | "OPERATOR" | "2023"   | ""          | ""               | "SIM_4G"     | ""     | ""    | ""            | ""            | ""            | "trackable-non-serialised" | "Name"      |

  # @e2e-seamless-one-ss-smoke-not-in-use @e2e-seamless-one-ss-inventories-not-in-use
  # Scenario Outline: Search Inventory by multiple Reseller Name
  #   When Session is enabled for user <USERNAME> and password <PASSWORD>
  #   When I navigate to the Inventories Page
  #   And I search with multiple reseller name <RESELLER_NAME1> <RESELLER_NAME2>
  #   Then I click on filters
  #   And I select filter column <COLUMN_NAME>
  #   And I select filter option <OPERATOR>
  #   And I enter filter value <PRODUCT_NAME>
  #   And I verify product details in table <COLUMN_NAME> <PRODUCT_NAME>
  #   Examples:
  #     | USERNAME   | PASSWORD | RESELLER_NAME1 | RESELLER_NAME2 | COLUMN_NAME | OPERATOR | PRODUCT_NAME |
  #     | "OPERATOR" | "2023"   | "Distributor1" | "Distributor2" | "Name"      | "equals" | "SIM_4G"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by Reseller Name
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    Then I click on filters
    And I select filter column <COLUMN_NAME>
    And I select filter option <OPERATOR>
    And I enter filter value <PRODUCT>
    And I verify product details in table <COLUMN_NAME> <PRODUCT>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE      | RESELLER_NAME | COLUMN_NAME | OPERATOR | PRODUCT  |
      | "OPERATOR" | "2023"   | ""          | ""               | ""           | ""     | ""    | "Main Distributor" | "MD1"         | "Name"      | "equals" | "SIM_4G" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by product SKU without self inventory
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    And I uncheck Include own inventory
    And I click on search button
    And I verify product details in table <COLUMN_NAME> <PRODUCT_SKU>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE | RESELLER_NAME | CATEGORY_PATH | COLUMN_NAME   |
      | "OPERATOR" | "2023"   | "SIM_4G"    | ""               | ""           | ""     | ""    | ""            | ""            | ""            | "Product SKU" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Search Inventory by Reseller Name without self inventory
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I search for particular product with <PRODUCT_CATEGORY> <PRODUCT_NAME> <PRODUCT_SKU> <REGION> <STATE> <RESELLER_TYPE> <RESELLER_NAME>
    And I uncheck Include own inventory
    And I click on search button
    Then I click on filters
    And I select filter column <COLUMN_NAME>
    And I select filter option <OPERATOR>
    And I enter filter value <PRODUCT_NAME>
    And I verify product details in table <COLUMN_NAME> <PRODUCT_NAME>
    Examples:
      | USERNAME   | PASSWORD | PRODUCT_SKU | PRODUCT_CATEGORY | PRODUCT_NAME | REGION | STATE | RESELLER_TYPE      | RESELLER_NAME | COLUMN_NAME | OPERATOR | PRODUCT  |
      | "OPERATOR" | "2023"   | ""          | ""               | "SIM_4G"     | ""     | ""    | "Main Distributor" | "MD1"         | "Name"      | "equals" | "SIM_4G" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Total Count
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME   | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Total Count" | "totalCount"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Name
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Name"      | "name"        |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Available Count
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME       | TOGGLE_COLUMN    |
      | "OPERATOR" | "2023"   | "Available Count" | "availableCount" |

  #This test case is outdated, as there is no checkbox column is present on UI
  # @e2e-seamless-one-std-not-in-use @e2e-seamless-one-std-inventories-not-in-use
  # Scenario Outline: STD-TC-27881: Inventory Search result Table column adjustment for Checkbox Selection
  #   Given Provide <USERNAME> and <PASSWORD> and login into system
  #   When I navigate to the Inventories Page
  #   And I click on columns button
  #   And I enter column title <COLUMN_NAME>
  #   And I verify toggle list is filtered <COLUMN_NAME>
  #   Then I click on toggle button <TOGGLE_COLUMN>
  #   And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
  #   Examples:
  #     | USERNAME   | PASSWORD | COLUMN_NAME          | TOGGLE_COLUMN |
  #     | "OPERATOR" | "2023"   | "Checkbox Selection" | "__check__"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Product SKU
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME   | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Product SKU" | "productSKU"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Category
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Category"  | "category"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Price
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Price"     | "price"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Actions
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Actions"   | "actions"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment for Actions
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME    | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Product Type" | "productType" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Filter Inventory Search result by Equals operation
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    Then I click on filters
    And I select filter column <FILTER_COLUMN>
    And I select filter option <FILTER_OPTION>
    And I enter filter value <FILTER_VALUE>
    Then I validate the table list parameters <COLUMN_NAME> <COLUMN_VALUE>
    Examples:
      | USERNAME   | PASSWORD | FILTER_COLUMN  | FILTER_OPTION | FILTER_VALUE | COLUMN_NAME    | COLUMN_VALUE |
      | "OPERATOR" | "2023"   | "Product Type" | "equals"      | "serialised" | "Product Type" | "serialised" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Filter Inventory Search result by contains operation
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    Then I click on filters
    And I select filter column <FILTER_COLUMN>
    And I select filter option <FILTER_OPTION>
    And I enter filter value <FILTER_VALUE>
    Then I validate the table list parameters <COLUMN_NAME> <COLUMN_VALUE>
    Examples:
      | USERNAME   | PASSWORD | FILTER_COLUMN  | FILTER_OPTION | FILTER_VALUE | COLUMN_NAME    | COLUMN_VALUE |
      | "OPERATOR" | "2023"   | "Product Type" | "contains"    | "serialised" | "Product Type" | "serialised" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Filter Inventory Search result by ends with operation
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    Then I click on filters
    And I select filter column <FILTER_COLUMN>
    And I select filter option <FILTER_OPTION>
    And I enter filter value <FILTER_VALUE>
    Then I validate the table list parameters <COLUMN_NAME> <COLUMN_VALUE>
    Examples:
      | USERNAME   | PASSWORD | FILTER_COLUMN  | FILTER_OPTION | FILTER_VALUE | COLUMN_NAME    | COLUMN_VALUE |
      | "OPERATOR" | "2023"   | "Product Type" | "ends with"   | "lised"      | "Product Type" | "serialised" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Box Item Details
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    Then I click on action button of first boxId available on the screen
    And I verify page title <BOX_ITEMS_PAGE_TITLE>
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_HOME_PAGE_TITLE     | INVENTORY_BOXES_TITLE | BOX_ITEMS_PAGE_TITLE | COLUMN | OPERATOR | PRODUCT_NAME |
      | "OPERATOR" | "2023"   | "View and Manage Inventories" | "Inventory Boxes"     | "Box Items"          | "name" | "equals" | "SIM_4G"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Filter Inventory Search result by starts with operation
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    Then I click on filters
    And I select filter column <FILTER_COLUMN>
    And I select filter option <FILTER_OPTION>
    And I enter filter value <FILTER_VALUE>
    Then I validate the table list parameters <COLUMN_NAME> <COLUMN_VALUE>
    Examples:
      | USERNAME   | PASSWORD | FILTER_COLUMN  | FILTER_OPTION | FILTER_VALUE | COLUMN_NAME    | COLUMN_VALUE |
      | "OPERATOR" | "2023"   | "Product Type" | "starts with" | "seri"       | "Product Type" | "serialised" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Search result Table column adjustment with SHOW ALL toggle
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I perform Hide all columns operation
    Then I validate columns should not be displayed in the table
    And I perform Show all columns operation
    Then I validate columns should be displayed in the table
    Examples:
      | USERNAME   | PASSWORD |
      | "OPERATOR" | "2023"   |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory view Table column adjustment for State
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "State"     | "state"       |

  # @e2e-seamless-one-std-not-in-use @e2e-seamless-one-std-inventories-not-in-use
  # Scenario Outline: Detailed Inventory view Table column adjustment for Employee ID
  #   Given Provide <USERNAME> and <PASSWORD> and login into system
  #   When I navigate to the Detailed Inventory Page
  #   And I click on columns button
  #   And I enter column title <COLUMN_NAME>
  #   And I verify toggle list is filtered <COLUMN_NAME>
  #   Then I click on toggle button <TOGGLE_COLUMN>
  #   And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
  #   Examples:
  #     | USERNAME   | PASSWORD | COLUMN_NAME   | TOGGLE_COLUMN |
  #     | "OPERATOR" | "2023"   | "Employee Id" | "employee"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory view Table column adjustment for Product SKU
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME   | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Product SKU" | "productSKU"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory view Table column adjustment for Serial Number
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME     | TOGGLE_COLUMN  |
      | "OPERATOR" | "2023"   | "Serial Number" | "serialNumber" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory view Table column adjustment for Box ID
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Box ID"    | "boxId"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory view Table column adjustment for Owner ID
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Owner Id"  | "owner"       |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory view Table column adjustment for Location ID
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME   | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Location Id" | "locationId"  |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory view Table column adjustment for Action
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on columns button
    And I enter column title <COLUMN_NAME>
    And I verify toggle list is filtered <COLUMN_NAME>
    Then I click on toggle button <TOGGLE_COLUMN>
    And Unchecking the toggle should remove that column from the table <COLUMN_NAME>
    Examples:
      | USERNAME   | PASSWORD | COLUMN_NAME | TOGGLE_COLUMN |
      | "OPERATOR" | "2023"   | "Actions"   | "actions"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Filter detailed Inventory table by Equals operation
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    Then I click on filters
    And I select filter column <FILTER_COLUMN>
    And I select filter option <FILTER_OPTION>
    And I enter filter value <FILTER_VALUE>
    Then I validate the table list parameters in the detail inventories page <COLUMN_NAME> <COLUMN_VALUE>
    Examples:
      | USERNAME   | PASSWORD | FILTER_COLUMN | FILTER_OPTION | FILTER_VALUE | COLUMN_NAME   | COLUMN_VALUE |
      | "OPERATOR" | "2023"   | "Product SKU" | "Equal"       | "SIM_4G"     | "Product SKU" | "SIM_4G"     |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Row per page option in Inventory Search Page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on rows per page dropdown
    And I verify values in rows per page dropdown
    And I select number of rows to be displayed <NO_OF_ROWS_DISPLAYED>
    And I verify number of rows displayed <NO_OF_ROWS>
    Examples:
      | USERNAME   | PASSWORD | NO_OF_ROWS | NO_OF_ROWS_DISPLAYED |
      | "OPERATOR" | "2023"   | "6"        | "10"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: STD-TC-27913: Row per page option in Inventory Boxes Page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    And I click on rows per page dropdown
    And I verify values in rows per page dropdown
    And I select number of rows to be displayed <NO_OF_ROWS>
    And I verify number of rows displayed <NO_OF_ROWS_DISPLAYED>
    Examples:
      | USERNAME   | PASSWORD | NO_OF_ROWS | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | NO_OF_ROWS_DISPLAYED |
      | "OPERATOR" | "2023"   | "10"       | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "3"                  |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Row per page option in Inventory Details Page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on rows per page dropdown
    And I verify values in rows per page dropdown
    And I select number of rows to be displayed <NO_OF_ROWS>
    And I verify number of rows displayed <NO_OF_ROWS_DISPLAYED>
    Examples:
      | USERNAME   | PASSWORD | NO_OF_ROWS | PRODUCT_SKU | SERIAL_NUMBER | NO_OF_ROWS_DISPLAYED |
      | "OPERATOR" | "2023"   | "10"       | "Sim-5G"    | "10080"       | "10"                 |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Row per page option in Inventory Boxes Details Page
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    Then I click on action button of first boxId available on the screen
    And I verify page title <BOX_ITEMS_PAGE_TITLE>
    And I click on rows per page dropdown
    And I verify values in rows per page dropdown
    And I select number of rows to be displayed <NO_OF_ROWS>
    And I verify number of rows displayed <NO_OF_ROWS_DISPLAYED>
    Examples:
      | USERNAME   | PASSWORD | NO_OF_ROWS | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | BOX_ITEMS_PAGE_TITLE | NO_OF_ROWS_DISPLAYED |
      | "OPERATOR" | "2023"   | "10"       | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "Box Items"          | "5"                  |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: STD-TC-27920: Inventory Box Split with out of range input in End Serial
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    And I enter additional filters with parameters "Location Id" "Equal" "Operator"
    And I click on split button
    And I enter End serial range <RANGE>
    And I verify out of range warning
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | BOX_ITEMS_PAGE_TITLE | RANGE      |
      | "OPERATOR" | "2023"   | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "Box Items"          | "10000334" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: STD-TC-27919: Inventory Box Split with alphanumeric input in End Serial
    # Given Provide <USERNAME> and <PASSWORD> and login into system
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    And I enter additional filters with parameters "Location Id" "Equal" "Operator"
    And I click on split button
    And I verify split boxed popup is opened
    And I enter End serial range <RANGE>
    Then I verify alphabets not entered
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | BOX_ITEMS_PAGE_TITLE | RANGE  |
      | "OPERATOR" | "2023"   | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "Box Items"          | "abcd" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Export
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I click on export button
    And I click on download button
    And I read file name <FILE_NAME>
    Then I delete file name <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | FILE_NAME  |
      | "OPERATOR" | "2023"   | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "data.csv" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Box Export
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    And I click on export button
    And I click on download button
    And I read file name <FILE_NAME>
    Then I delete file name <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | FILE_NAME  |
      | "OPERATOR" | "2023"   | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "data.csv" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Detailed Inventory Export
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Detailed Inventory Page
    And I click on export button in Detailed Inventory Page
    And I click on download button in Detailed Inventory Page
    And I read file name <FILE_NAME>
    Then I delete file name <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | FILE_NAME  |
      | "OPERATOR" | "2023"   | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "data.csv" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Inventory Box Details Export
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    Then I click on action button of first boxId available on the screen
    And I verify page title <BOX_ITEMS_PAGE_TITLE>
    And I click on export button in Box Items Page with <STATE>
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | BOX_ITEMS_PAGE_TITLE | FILE_NAME    | STATE       |
      | "OPERATOR" | "2023"   | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "Box Items"          | "export.csv" | "Available" |

  @e2e-ss-regression @e2e-ss-smoke @ss-inventories
  Scenario Outline: Manual Adjustment for serialized Inventory
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    When I navigate to the Inventories Page
    And I enter additional filters with parameters <COLUMN> <OPERATOR> <PRODUCT_NAME>
    Then I click on action button of first row boxId
    And I verify page title <INVENTORY_BOXES_TITLE>
    And I enter additional filters with parameters "Location Id" "Equal" "Operator"
    And I click on manual adjustment button
    And I select owner id <OWNER_ID>
    And I select location id <LOCATION_ID>
    And I click on submit button
    Then I am able to validate proper message <MESSAGE>
    # And I enter End serial range <RANGE>
    # And I verify out of range warning
    Examples:
      | USERNAME   | PASSWORD | INVENTORY_BOXES_TITLE | COLUMN | OPERATOR | PRODUCT_NAME | BOX_ITEMS_PAGE_TITLE | OWNER_ID | LOCATION_ID | MESSAGE                            |
      | "OPERATOR" | "2023"   | "Inventory Boxes"     | "name" | "equals" | "SIM_4G"     | "Box Items"          | "MD1"    | "MD1"       | "Inventories updated successfully" |