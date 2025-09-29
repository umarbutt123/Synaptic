import {
  When, And, Then,
} from "cypress-cucumber-preprocessor/steps";

import ReportsHomePage from '../../../pages/unified-portal/reports/reports_home_page';

before(() => {
  cy.loginWithSession("Operator", "2023");
  cy.loginWithSession("MD1", "2023");
});

When(/^I navigate to the Audit Reports Page$/, () => {
  ReportsHomePage.navigateToAuditReportsUsingURL();
});

When(/^I navigate to the Standard Reports Page$/, () => {
  ReportsHomePage.navigateToReportsUsingURL();
});

Then(/^I verify Report node is not available in left navigation bar "([^"]*)"$/, (node) => {
  ReportsHomePage.verifyNodeNotAvailable(node);
});

Then(/^I verify reports page header is visible "([^"]*)"$/, (header) => {
  ReportsHomePage.verifyHeader(header);
});

And(/^I verify available reports "([^"]*)"$/, (report) => {
  ReportsHomePage.verifyAvailableReports(report);
});

And(/^I verify available standard reports "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (report1, report2, report3, report4, report5) => {
  ReportsHomePage.verifyAvailableReports(report1);
  ReportsHomePage.verifyAvailableReports(report2);
  ReportsHomePage.verifyAvailableReports(report3);
  ReportsHomePage.verifyAvailableReports(report4);
  ReportsHomePage.verifyAvailableReports(report5);
});

And(/^I click on report tab "([^"]*)"$/, (reportName) => {
  ReportsHomePage.clickOnReport(reportName);
});

And(/^I select the sub report "([^"]*)"$/, (subReportName) => {
  ReportsHomePage.clickOnReport(subReportName);
  cy.wait(500);
});

Then(/^I verify that the sub report is not available "([^"]*)"$/, (subReportName) => {
  ReportsHomePage.checkReportAvailability(subReportName);
});

Then(/^I enter Date to fetch report data$/, () => {
  ReportsHomePage.enterCurrentDate();
});

Then(/^I enter Current Date to fetch report data$/, () => {
  ReportsHomePage.enterCurrentDate();
});

Then(/^I enter From date and To date to fetch report data$/, () => {
  ReportsHomePage.enterFromDate();
  ReportsHomePage.enterToDate();
});

Then(/^I select From date and To date to fetch report data$/, () => {
  ReportsHomePage.enterFromDate();
  ReportsHomePage.selectToDate();
});

Then(/^I enter future date in From date and To date fields to fetch report data$/, () => {
  ReportsHomePage.enterFromDateInFuture();
  ReportsHomePage.enterToDateInFuture();
});

Then(/^I enter future date in Date field to fetch report data$/, () => {
  ReportsHomePage.enterFromDateInFuture();
});

Then(/^I enter custom date in From date and To date fields to fetch report data "([^"]*)" "([^"]*)"$/, (customFromDate, customToDate) => {
  ReportsHomePage.enterCustomDate(customFromDate, customToDate);
});

Then(/^I enter From Date greater than To Date to fetch report data$/, () => {
  ReportsHomePage.enterFromDateInFuture();
});

Then(/^I enter Transaction Number to fetch report data "([^"]*)"$/, (transactionNumber) => {
  ReportsHomePage.enterTransactionNumber(transactionNumber);
});

Then(/^I enter Event Name to fetch report data "([^"]*)"$/, (eventName) => {
  ReportsHomePage.selectEventName(eventName);
});

Then(/^I enter ResellerType to fetch report data "([^"]*)"$/, (resellerType) => {
  ReportsHomePage.enterResellerType(resellerType);
});

Then(/^I enter Channel to fetch report data "([^"]*)"$/, (channel) => {
  ReportsHomePage.selectChannel(channel);
});

Then(/^I enter Reseller Id to fetch report data "([^"]*)"$/, (resellerId) => {
  ReportsHomePage.enterResellerId(resellerId);
});

Then(/^I enter Reseller Id field to fetch report data "([^"]*)"$/, (resellerId) => {
  ReportsHomePage.enterResellerIdAuto(resellerId);
});

Then(/^I select Reseller Id to fetch report data "([^"]*)"$/, (resellerId) => {
  ReportsHomePage.multiSelectResellerId(resellerId);
});

Then(/^I enter Sender to fetch report data "([^"]*)"$/, (sender) => {
  ReportsHomePage.enterSender(sender);
});

Then(/^I enter Deviation Threshold to fetch report data "([^"]*)"$/, (deviationThreshold) => {
  ReportsHomePage.enterDeviationThreshold(deviationThreshold);
});

Then(/^I enter Reseller Type to fetch report data "([^"]*)"$/, (resellerType) => {
  ReportsHomePage.selectResellerType(resellerType);
});

Then(/^I select Reseller Type to fetch report data "([^"]*)"$/, (resellerType) => {
  ReportsHomePage.multiSelectResellerType(resellerType);
});

Then(/^I select Reseller Type field to fetch report data "([^"]*)"$/, (resellerType) => {
  ReportsHomePage.multiSelectResellerTypeAuto(resellerType);
  cy.wait(200);
});

Then(/^I select Region to fetch report data "([^"]*)"$/, (region) => {
  ReportsHomePage.multiSelectRegion(region);
});

Then(/^I enter Reseller Level to fetch report data "([^"]*)"$/, (resellerLevel) => {
  ReportsHomePage.selectResellerLevel(resellerLevel);
});

Then(/^I enter Account Type to fetch report data "([^"]*)"$/, (accountType) => {
  ReportsHomePage.selectAccountType(accountType);
});

Then(/^I enter Account Type to fetch hierarchy report data "([^"]*)"$/, (accountType) => {
  ReportsHomePage.selectAccountTypeHierarchy(accountType);
});

Then(/^I enter Sort By option to fetch report data "([^"]*)"$/, (sortBy) => {
  ReportsHomePage.selectSortBy(sortBy);
});

Then(/^I enter Transaction Type to fetch report data "([^"]*)"$/, (transactionType) => {
  ReportsHomePage.selectTransactionType(transactionType);
});

Then(/^I select Transaction Type field to fetch report data "([^"]*)"$/, (transactionType) => {
  ReportsHomePage.selectTransactionTypeAuto(transactionType)
});

Then(/^I enter Transaction Profile to fetch report data "([^"]*)"$/, (transactionProfile) => {
  ReportsHomePage.selectTransactionProfile(transactionProfile);
});

Then(/^I fetch the Transaction Number from first row and enter it in search field to get report data "([^"]*)"$/, (reportHeader) => {
  cy.wait(200);
  ReportsHomePage.fetchAndEnterTransactionNumber(reportHeader);
});

Then(/^I fetch the Batch Id from first row and enter it in search field to get report data "([^"]*)"$/, (reportHeader) => {
  ReportsHomePage.fetchAndEnterBatchId(reportHeader);
});

And(/^I clear both ERS Reference and Batch Id fields$/, () => {
  ReportsHomePage.clearERSAndBatchField();
});

And(/^I reset Transaction Number field first to ALL$/, () => {
  ReportsHomePage.resetTransactionNumberField();
});

And(/^I enter keyword in Grid Search field to fetch report data "([^"]*)"$/, (keyword) => {
  cy.wait(200);
  ReportsHomePage.applyGridSearch(keyword);
});

When(/^I click on export button$/, () => {
  ReportsHomePage.clickExportButton();
});

And(/^I click on export CSV button$/, () => {
  cy.wait(500);
  ReportsHomePage.clickExportCSVButton();
});

And(/^I click on export PDF button$/, () => {
  cy.wait(500);
  ReportsHomePage.clickExportPDFButton();
});

And(/^I verify all the search fields are visible "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (field1, field2, field3, field4, field5, field6, field7, field8, field9) => {
  ReportsHomePage.verifyFieldName(field1);
  ReportsHomePage.verifyFieldName(field2);
  ReportsHomePage.verifyFieldName(field3);
  ReportsHomePage.verifyFieldName(field4);
  ReportsHomePage.verifyFieldName(field5);
  ReportsHomePage.verifyFieldName(field6);
  ReportsHomePage.verifyFieldName(field7);
  ReportsHomePage.verifyFieldName(field8);
});

And(/^I verify all the column names are available "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (column1, column2, column3, column4, column5, column6, column7, column8, column9, column10, column11, column12, column13) => {
  ReportsHomePage.verifyGridColumnName(column1);
  ReportsHomePage.verifyGridColumnName(column2);
  ReportsHomePage.verifyGridColumnName(column3);
  ReportsHomePage.verifyGridColumnName(column4);
  ReportsHomePage.verifyGridColumnName(column5);
  ReportsHomePage.verifyGridColumnName(column6);
  ReportsHomePage.verifyGridColumnName(column7);
  ReportsHomePage.verifyGridColumnName(column8);
  ReportsHomePage.verifyGridColumnName(column9);
  ReportsHomePage.verifyGridColumnName(column10);
  ReportsHomePage.verifyGridColumnName(column11);
  ReportsHomePage.verifyGridColumnName(column12);
  ReportsHomePage.verifyGridColumnName(column13);
});

And(/^I verify Total Count, Amount and Currency labels are available in grid "([^"]*)" "([^"]*)" "([^"]*)"$/, (totalTransactionCount, totalTransactionAmount, currency) => {
  ReportsHomePage.verifyGridDataLabelName(totalTransactionCount);
  ReportsHomePage.verifyGridDataLabelName(totalTransactionAmount);
  ReportsHomePage.verifyGridDataLabelName(currency);
});

Then(/^I verify submit, download and reset buttons$/, () => {
  ReportsHomePage.verifySubmitBtn();
  ReportsHomePage.verifyDownloadBtn();
  ReportsHomePage.verifyResetBtn();
});

When(/^I click on submit button$/, () => {
  cy.wait(500);
  ReportsHomePage.clickSubmit();
});

When(/^I click on download button$/, () => {
  ReportsHomePage.clickDownload();
});

When(/^I click on Navigation Toolbar Icon$/, () => {
  ReportsHomePage.clickOnReportNavigationToolbarIcon();
});

Then(/^I click on reset$/, () => {
  ReportsHomePage.clickReset();
});

Then(/^I select file type "([^"]*)"$/, (fileType) => {
  ReportsHomePage.selectFileType(fileType);
});

Then(/^I select Size "([^"]*)"$/, (size) => {
  ReportsHomePage.selectSize(size);
});

Then(/^I verify size is reset "([^"]*)"$/, (size) => {
  ReportsHomePage.verifySize(size);
});

Then(/^I verify available reports list are not shown$/, () => {
  ReportsHomePage.verifyReportsListNotDisplayed();
});

And(/^Data should be visible inside table$/, () => {
  ReportsHomePage.verifyGridCount();
});

And(/^Data should be available in the grid "([^"]*)"$/, (reportHeader) => {
  ReportsHomePage.verifyGridData(reportHeader);
});

And(/^Data should be available in grid "([^"]*)" "([^"]*)"$/, (reportHeader, dataValue) => {
  ReportsHomePage.verifyGridDataValue(reportHeader, dataValue);
});

And(/^Specific Data should be available in grid "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (reportHeader, channel, accountType, transactionType) => {
  ReportsHomePage.verifyGridDataAll(reportHeader, channel, accountType, transactionType);
});

And(/^Transaction count and amount should be equal to 0 inside table "([^"]*)"$/, (reportHeader) => {
  ReportsHomePage.verifyEmptyGridData(reportHeader);
});

And(/^Inactive count should be equal to 100 percent inside table "([^"]*)"$/, (reportHeader) => {
  ReportsHomePage.verifyEmptyGridData(reportHeader);
});

And(/^I delete the file name "([^"]*)"$/, (fileName) => {
  cy.wait(1000);
  ReportsHomePage.deleteReportFile(fileName);
});

Then(/^I am able to validate Download's success message "([^"]*)" "([^"]*)"$/, (downloadMessage, successMessage) => {
  ReportsHomePage.verifyDownloadSuccessMessage(downloadMessage, successMessage);
});

Then(
  /^I select fields value to fetch stock holding report daily data "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/,
  (productCategory, productName, productSKU, resellerType, resellerId) => {
    ReportsHomePage.enterFieldsValue(productCategory, productName, productSKU, resellerType, resellerId);
  }
);

Then(/^I am able to validate error message "([^"]*)"$/, (errorMessage) => {
  ReportsHomePage.verifyErrorMessage(errorMessage);
});

Then(/^I select reseller id fields value as per reseller type selected "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/,
  (productCategory, productName, productSKU, resellerType, resellerId) => {
    ReportsHomePage.verifyResellerId(productCategory, productName, productSKU, resellerType, resellerId);
  });

Then(/^I enter From year and To year to fetch report data "([^"]*)" "([^"]*)"$/, (fromYear, toYear) => {
  ReportsHomePage.enterFromYear(fromYear);
  ReportsHomePage.enterToYear(toYear);
});

Then(/^I enter From week and To week to fetch report data "([^"]*)" "([^"]*)"$/, (fromWeek, toWeek) => {
  ReportsHomePage.enterFromWeek(fromWeek);
  ReportsHomePage.enterToWeek(toWeek);
});

And(/^I verify all the column names in all order report "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (column1, column2, column3, column4, column5, column6, column7, column8, column9, column10, column11, column12, column13, column14, column15, column16, column17) => {
  ReportsHomePage.verifyGridColumnName(column1);
  ReportsHomePage.verifyGridColumnName(column2);
  ReportsHomePage.verifyGridColumnName(column3);
  ReportsHomePage.verifyGridColumnName(column4);
  ReportsHomePage.verifyGridColumnName(column5);
  ReportsHomePage.verifyGridColumnName(column6);
  ReportsHomePage.verifyGridColumnName(column7);
  ReportsHomePage.verifyGridColumnName(column8);
  ReportsHomePage.verifyGridColumnName(column9);
  ReportsHomePage.verifyGridColumnName(column10);
  ReportsHomePage.verifyGridColumnName(column11);
  ReportsHomePage.verifyGridColumnName(column12);
  ReportsHomePage.verifyGridColumnName(column13);
  ReportsHomePage.verifyGridColumnName(column14);
  ReportsHomePage.verifyGridColumnName(column15);
  ReportsHomePage.verifyGridColumnName(column16);
  ReportsHomePage.verifyGridColumnName(column17);
});

Then(/^I select fields value for all order report to fetch data "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/,
  (resellerType, resellerId, statusTypes, status, region, salesArea) => {
    ReportsHomePage.selectFieldsValue(resellerType, resellerId, statusTypes, status, region, salesArea);
  }
);

And(/^I verify all the column names are available in Transaction Details Grid "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (column1, column2, column3, column4, column5, column6, column7, column8, column9, column10, column11, column12, column13, column14, column15, column16, column17, column18, column19, column20, column21) => {
  ReportsHomePage.verifyGridColumnName(column1);
  ReportsHomePage.verifyGridColumnName(column2);
  ReportsHomePage.verifyGridColumnName(column3);
  ReportsHomePage.verifyGridColumnName(column4);
  ReportsHomePage.verifyGridColumnName(column5);
  ReportsHomePage.verifyGridColumnName(column6);
  ReportsHomePage.verifyGridColumnName(column7);
  ReportsHomePage.verifyGridColumnName(column8);
  ReportsHomePage.verifyGridColumnName(column9);
  ReportsHomePage.verifyGridColumnName(column10);
  ReportsHomePage.verifyGridColumnName(column11);
  ReportsHomePage.verifyGridColumnName(column12);
  ReportsHomePage.verifyGridColumnName(column13);
  ReportsHomePage.verifyGridColumnName(column14);
  ReportsHomePage.verifyGridColumnName(column15);
  ReportsHomePage.verifyGridColumnName(column16);
  ReportsHomePage.verifyGridColumnName(column17);
  ReportsHomePage.verifyGridColumnName(column18);
  ReportsHomePage.verifyGridColumnName(column19);
  ReportsHomePage.verifyGridColumnName(column20);
  ReportsHomePage.verifyGridColumnName(column21);
});