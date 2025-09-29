Feature: 13-Bulk Operation Feature

  As a user on the unified portal Application
  I want to perform bulk operations

  Background: Enter UserId and Password annd perform Login
    Given I am on the unified portal login page

  ######################## Sudani ########################

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-01 Inventory Serialised Bulk import with blank CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    # And I wait for "3000" miliseconds
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                      | MESSAGE                     |
      | "OPERATOR" | "2023"   | "Inventory Serialized" | "unified/Serialized_blank.csv" | "Empty/Invalid file format" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-02 Inventory Serialised Bulk import with correct data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    # And I wait for "3000" miliseconds
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                          | INITIAL_STATUS | STATUS      |
      | "OPERATOR" | "2023"   | "Inventory Serialized" | "unified/Inventory_Serialized.csv" | "pending"      | "processed" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-03 Inventory Serialised Bulk import with partially-correct data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    # And I wait for "3000" miliseconds
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                       | STATUS                | INITIAL_STATUS |
      | "OPERATOR" | "2023"   | "Inventory Serialized" | "unified/s_partial_correct.csv" | "partially-processed" | "pending"      |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-04 Inventory Serialised Bulk import with incorrect data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                      | STATUS   | INITIAL_STATUS |
      | "OPERATOR" | "2023"   | "Inventory Serialized" | "unified/s_incorrect_data.csv" | "failed" | "pending"      |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-05 Inventory Serialised Bulk import with incorrect header format in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                            | MESSAGE                                                                                    |
      | "OPERATOR" | "2023"   | "Inventory Serialized" | "unified/Serialized_WrongFormat.csv" | "Invalid Inventory->Serialized->CSV import file header format. An valid format must match" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk1
  Scenario Outline: SS-06 Inventory Non-Serialised Bulk import with correct data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    # And I wait for "3000" miliseconds
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                              | INITIAL_STATUS | STATUS      |
      | "OPERATOR" | "2023"   | "Inventory Non-serialized" | "unified/Inventory_Non-serialized.csv" | "pending"      | "processed" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-07 Inventory Non-Serialised Bulk import with partially-correct data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                        | STATUS   | INITIAL_STATUS |
      | "Operator" | "2023"   | "Inventory Non-serialized" | "unified/ns_partial_correct.csv" | "failed" | "pending"      |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-08 Inventory Non-Serialised Bulk import with blank CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                       | MESSAGE                     |
      | "OPERATOR" | "2023"   | "Inventory Non-serialized" | "unified/nserialized_blank.csv" | "Empty/Invalid file format" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-09 Inventory Non-Serialised Bulk import with incorrect data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                      | STATUS   | INITIAL_STATUS |
      | "Operator" | "2023"   | "Inventory Non-serialized" | "unified/ns_IncorrectData.csv" | "failed" | "pending"      |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-10 Inventory Non-Serialised Bulk import with incorrect header format in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                             | MESSAGE                                                                                        |
      | "OPERATOR" | "2023"   | "Inventory Non-serialized" | "unified/nserialized_WrongFormat.csv" | "Invalid Inventory->Non-serialized->CSV import file header format. An valid format must match" |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: STD-11 Inventory Trackable Bulk import with correct data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE       | FILE_NAME                         | STATUS      | INITIAL_STATUS |
      | "Operator" | "2023"   | "Inventory Trackable" | "unified/Inventory_Trackable.csv" | "processed" | "pending"      |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: STD-12 Inventory Trackable Bulk import with blank CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE       | FILE_NAME                     | MESSAGE                     |
      | "OPERATOR" | "2023"   | "Inventory Trackable" | "unified/Trackable_blank.csv" | "Empty/Invalid file format" |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: STD-13 Inventory Trackable Bulk import with incorrect data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE       | FILE_NAME                         | STATUS   | INITIAL_STATUS |
      | "Operator" | "2023"   | "Inventory Trackable" | "unified/Trackable_Incorrect.csv" | "failed" | "pending"      |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: STD-14 Inventory Trackable Bulk import with partially-correct data in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE       | FILE_NAME                          | STATUS                | INITIAL_STATUS |
      | "Operator" | "2023"   | "Inventory Trackable" | "unified/Trac_partial_correct.csv" | "partially-processed" | "pending"      |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: STD-15 Inventory Trackable Bulk import with incorrect header format in CSV file
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE       | FILE_NAME                      | MESSAGE                                                                                   |
      | "OPERATOR" | "2023"   | "Inventory Trackable" | "unified/Trac_WrongFormat.csv" | "Invalid Inventory->Trackable->CSV import file header format. An valid format must match" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-11 Performing Bulk Reseller Import Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE     | FILE_NAME                              | INITIAL_STATUS | FINAL_STATUS          |
      | "Operator" | "2023"   | "Reseller Reseller" | "ers5.0/Reseller_Import_Processed.csv" | "pending"      | "processed"           |
      | "Operator" | "2023"   | "Reseller Reseller" | "ers5.0/ResellerImp_PartiallyProc.csv" | "pending"      | "partially-processed" |
      | "Operator" | "2023"   | "Reseller Reseller" | "ers5.0/Reseller_Import_Failed.csv"    | "pending"      | "failed"              |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-12 Performing Bulk Reseller Import Operation with Blank and Incorrect Format CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE     | FILE_NAME                                | MESSAGE                                                                                 |
      | "OPERATOR" | "2023"   | "Reseller Reseller" | "ers5.0/Reseller_Import_Blank.csv"       | "Empty/Invalid file format"                                                             |
      | "Operator" | "2023"   | "Reseller Reseller" | "ers5.0/Reseller_Import_WrongFormat.csv" | "Invalid Reseller->Reseller->CSV import file header format. An valid format must match" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-13 Performing Reseller Update Import Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                              | FINAL_STATUS          | INITIAL_STATUS |
      | "Operator" | "2023"   | "Reseller Reseller_Update" | "ers5.0/ResellerUpdate_Processed.csv"  | "processed"           | "pending"      |
      | "Operator" | "2023"   | "Reseller Reseller_Update" | "ers5.0/ResellerUpd_PartiallyProc.csv" | "partially-processed" | "pending"      |
      | "Operator" | "2023"   | "Reseller Reseller_Update" | "ers5.0/ResellerUpdate_Failed.csv"     | "failed"              | "pending"      |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-14 Performing Reseller Update Import Operation with Blank and Incorrect Format CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE            | FILE_NAME                               | MESSAGE                                                                                        |
      | "OPERATOR" | "2023"   | "Reseller Reseller_Update" | "ers5.0/ResellerUpdate_Blank.csv"       | "Empty/Invalid file format"                                                                    |
      | "Operator" | "2023"   | "Reseller Reseller_Update" | "ers5.0/ResellerUpdate_WrongFormat.csv" | "Invalid Reseller->Reseller_Update->CSV import file header format. An valid format must match" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-15 Performing Reseller Change Parent Import Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <FINAL_STATUS> <TOTAL_UPLOADED> <PASSED> <FAILED>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE          | FILE_NAME                            | INITIAL_STATUS | FINAL_STATUS          | TOTAL_UPLOADED | PASSED | FAILED |
      | "Operator" | "2023"   | "Resellers ChangeParent" | "ers5.0/ChangeParent_Processed.csv"  | "pending"      | "processed"           | "2"            | "2"    | "0"    |
      | "Operator" | "2023"   | "Resellers ChangeParent" | "ers5.0/ChangePar_PartiallyProc.csv" | "pending"      | "partially-processed" | "2"            | "1"    | "1"    |
      | "Operator" | "2023"   | "Resellers ChangeParent" | "ers5.0/ChangeParent_Failed.csv"     | "pending"      | "failed"              | "2"            | "0"    | "2"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-16 Performing Reseller Change Parent Import Operation with Blank and Incorrect Format CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE          | FILE_NAME                             | MESSAGE                                                                                      |
      | "OPERATOR" | "2023"   | "Resellers ChangeParent" | "ers5.0/ChangeParent_Blank.csv"       | "Empty/Invalid file format"                                                                  |
      | "Operator" | "2023"   | "Resellers ChangeParent" | "ers5.0/ChangeParent_WrongFormat.csv" | "Invalid Resellers->ChangeParent->CSV import file header format. An valid format must match" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-17 Performing Bulk Region Import Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <FINAL_STATUS> <TOTAL_UPLOADED> <PASSED> <FAILED>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                            | INITIAL_STATUS | FINAL_STATUS          | TOTAL_UPLOADED | PASSED | FAILED |
      | "Operator" | "2023"   | "Region Region_Import" | "ers5.0/Region_Import_Processed.csv" | "pending"      | "processed"           | "8"            | "8"    | "0"    |
      | "Operator" | "2023"   | "Region Region_Import" | "ers5.0/RegionImp_PartiallyProc.csv" | "pending"      | "partially-processed" | "5"            | "3"    | "2"    |
      | "Operator" | "2023"   | "Region Region_Import" | "ers5.0/Region_Import_Failed.csv"    | "pending"      | "failed"              | "2"            | "0"    | "2"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-18 Performing Bulk Region Import Operation with Blank and Incorrect Format CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE        | FILE_NAME                              | MESSAGE                                                                                    |
      | "OPERATOR" | "2023"   | "Region Region_Import" | "ers5.0/Region_Import_Blank.csv"       | "Empty/Invalid file format"                                                                |
      | "Operator" | "2023"   | "Region Region_Import" | "ers5.0/Region_Import_WrongFormat.csv" | "Invalid Region->Region_Import->CSV import file header format. An valid format must match" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-19 Performing Bulk Transfer Transaction Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <FINAL_STATUS> <TOTAL_UPLOADED> <PASSED> <FAILED>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE                    | FILE_NAME                               | INITIAL_STATUS | FINAL_STATUS          | TOTAL_UPLOADED | PASSED | FAILED |
      | "Operator" | "2023"   | "Transaction Bulk_Credit_Transfer" | "ers5.0/bulkTransfer_processed.csv"     | "pending"      | "processed"           | "2"            | "2"    | "0"    |
      | "Operator" | "2023"   | "Transaction Bulk_Credit_Transfer" | "ers5.0/bulkTransfer_partiallyproc.csv" | "pending"      | "partially-processed" | "2"            | "1"    | "1"    |
      | "Operator" | "2023"   | "Transaction Bulk_Credit_Transfer" | "ers5.0/bulkTransfer_failed.csv"        | "pending"      | "failed"              | "2"            | "0"    | "2"    |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-20 Performing Bulk Transfer Transaction Operation with Blank and Incorrect Format CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE                    | FILE_NAME                             | MESSAGE                                                                                                |
      | "OPERATOR" | "2023"   | "Transaction Bulk_Credit_Transfer" | "ers5.0/bulkTransfer_blank.csv"       | "Empty/Invalid file format"                                                                            |
      | "Operator" | "2023"   | "Transaction Bulk_Credit_Transfer" | "ers5.0/bulkTransfer_wrongformat.csv" | "Invalid Transaction->Bulk_Credit_Transfer->CSV import file header format. An valid format must match" |

  @e2e-ss-regression @e2e-ss-smoke @ss-bulk
  Scenario Outline: SS-19 Performing Bulk Topup Transaction Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <FINAL_STATUS> <TOTAL_UPLOADED> <PASSED> <FAILED>
    Examples:
      | USERNAME | PASSWORD | IMPORT_SUB_TYPE          | FILE_NAME                            | INITIAL_STATUS | FINAL_STATUS          | TOTAL_UPLOADED | PASSED | FAILED |
      | "POS13"  | "2023"   | "Transaction Bulk_TOPUP" | "ers5.0/bulkTopup_Processed.csv"     | "pending"      | "processed"           | "2"            | "2"    | "0"    |
      | "POS13"  | "2023"   | "Transaction Bulk_TOPUP" | "ers5.0/bulkTopup_partiallyproc.csv" | "pending"      | "partially-processed" | "2"            | "1"    | "1"    |
      | "POS13"  | "2023"   | "Transaction Bulk_TOPUP" | "ers5.0/bulkTopup_failed.csv"        | "pending"      | "failed"              | "2"            | "0"    | "2"    |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: SS-21 Performing Bulk Commission Topup Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <FINAL_STATUS> <TOTAL_UPLOADED> <PASSED> <FAILED>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE                | FILE_NAME                              | INITIAL_STATUS | FINAL_STATUS          | TOTAL_UPLOADED | PASSED | FAILED |
      | "Operator" | "2023"   | "Transaction TOPUP_COMMISSION" | "ers5.0/topupCommission_processed.csv" | "pending"      | "processed"           | "2"            | "2"    | "0"    |
      | "Operator" | "2023"   | "Transaction TOPUP_COMMISSION" | "ers5.0/topupCommission_parproc.csv"   | "pending"      | "partially-processed" | "2"            | "1"    | "1"    |
      | "Operator" | "2023"   | "Transaction TOPUP_COMMISSION" | "ers5.0/topupCommission_failed.csv"    | "pending"      | "failed"              | "2"            | "0"    | "2"    |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: SS-22 Performing Bulk Commission Topup Operation with Blank and Incorrect Format CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE                | FILE_NAME                                | MESSAGE                                                                                            |
      | "OPERATOR" | "2023"   | "Transaction TOPUP_COMMISSION" | "ers5.0/topupCommission_blank.csv"       | "Empty/Invalid file format"                                                                        |
      | "Operator" | "2023"   | "Transaction TOPUP_COMMISSION" | "ers5.0/topupCommission_wrongformat.csv" | "Invalid Transaction->TOPUP_COMMISSION->CSV import file header format. An valid format must match" |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: SS-23 Performing Bulk Reporting Commission Operation with Correct, Partially-Correct and Incorrect data in CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate proper message "Successful operation"
    And I validate import information with params <IMPORT_SUB_TYPE> <INITIAL_STATUS> <USERNAME> <FILE_NAME>
    # And I wait for 2minutes
    # And I reload the page
    # And I validate import information with params <IMPORT_SUB_TYPE> <FINAL_STATUS> <USERNAME> <FILE_NAME>
    # And I click refresh and verify data again with params <FINAL_STATUS> <TOTAL_UPLOADED> <PASSED> <FAILED>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE                           | FILE_NAME                                  | INITIAL_STATUS | FINAL_STATUS          | TOTAL_UPLOADED | PASSED | FAILED |
      | "Operator" | "2023"   | "Transaction CUSTOM_OPERATION_COMMISSION" | "ers5.0/reportingCommission_processed.csv" | "pending"      | "processed"           | "2"            | "2"    | "0"    |
      | "Operator" | "2023"   | "Transaction CUSTOM_OPERATION_COMMISSION" | "ers5.0/reportingCommission_parproc.csv"   | "pending"      | "partially-processed" | "2"            | "1"    | "1"    |
      | "Operator" | "2023"   | "Transaction CUSTOM_OPERATION_COMMISSION" | "ers5.0/reportingCommission_failed.csv"    | "pending"      | "failed"              | "2"            | "0"    | "2"    |

  @e2e-ss-regression-not-applicable @e2e-ss-smoke-not-applicable @ss-bulk-not-applicable
  Scenario Outline: SS-24 Performing Bulk Reporting Commission Operation with Blank and Incorrect Format CSV Files
    When Session is enabled for user <USERNAME> and password <PASSWORD>
    And I navigate to the bulk import page
    When I perform import bulk operation with params <IMPORT_SUB_TYPE> <FILE_NAME>
    Then I am able to validate error message <MESSAGE>
    Examples:
      | USERNAME   | PASSWORD | IMPORT_SUB_TYPE                           | FILE_NAME                                    | MESSAGE                                                                                                       |
      | "OPERATOR" | "2023"   | "Transaction CUSTOM_OPERATION_COMMISSION" | "ers5.0/reportingCommission_blank.csv"       | "Empty/Invalid file format"                                                                                   |
      | "Operator" | "2023"   | "Transaction CUSTOM_OPERATION_COMMISSION" | "ers5.0/reportingCommission_wrongformat.csv" | "Invalid Transaction->CUSTOM_OPERATION_COMMISSION->CSV import file header format. An valid format must match" |



