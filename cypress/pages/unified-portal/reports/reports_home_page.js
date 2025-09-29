/// <reference types="cypress" />
// eslint-disable-next-line import/no-extraneous-dependencies
import {
  format, subDays, addDays,
} from 'date-fns';
import URL_PATH from "../../../common/Route";
import CommonUtilities from '../../../common/Util';

const HEADER = "//h6[@id = 'child-app-title']";
const AVAILABLE_REPORTS = "//ul[@id = 'seamless-report-tree-view']";
const SUBMIT_BUTTON = "//button/span[text() = 'Submit']";
const DOWNLOAD_BUTTON = "//button/span[text() = 'Download']";
const RESET_BUTTON = "//button/span[text() = 'Reset']";
const FROM_DATE = "//input[@id = 'report-form-fromDate']";
const TO_DATE = "//input[@id = 'report-form-toDate']";
const TRANSACTION_NUMBER = "//input[@id = 'report-form-transactionNumber']";
const ERS_REFERENCE = "//input[@id = 'report-form-ersReference']";
const BATCH_ID = "//input[@id = 'report-form-batchId']";
const EVENT_NAME = "//select[@id = 'report-form-eventName']";
const CHANNEL = "//*[@id='report-form-channel']";
const RESELLER_ID = "//*[@id='report-form-reseller_Id']";
const RESELLER_ID_MULTI_SELECT = "//*[@id='report-form-parent-child-based-autocompletereseller_Id']";
const RESELLER_ID_AUTO = "//*[@id='report-form-reseller_id']";
const RESELLER_TYPE = "//*[@id='report-form-reseller_type']";
const RESELLER_TYPE_MULTI_SELECT = "//*[@id='reseller_type-multi-select']";
const RESELLER_TYPE_AUTO = "//*[@id='report-form-autocompletereseller_type']";
const RESELLER_LEVEL = "//*[@id='report-form-reseller_level']";
const ACCOUNT_TYPE = "//*[@id='report-form-accountType']";
const ACCOUNT_TYPE_HIERARCHY = "//*[@id='report-form-account_type']";
const SORT_BY = "//*[@id='report-form-sortBy']";
const TRANSACTION_TYPE = "//*[@id='report-form-transactionType']";
const TRANSACTION_PROFILE = "//*[@id='report-form-transaction_profile']";
const TRANSACTION_TYPE_AUTO = "//*[@id='report-form-transaction_type']";
const SENDER = "//*[@id='report-form-sender']";
const DEVIATION_THRESHOLD = "//*[@id='report-form-deviationThreshold']";
const REGION_MULTI_SELECT = "//*[@id='report-form-autocompleteregion']";
const FILE_TYPE = "//select[@name = 'fileType']";
const SIZE = "//select[@name = 'size']";
const REPORTS_LIST = "(//ul/li)[1]";
const REPORT_NAVIGATION_TOOLBAR = "//*[@id='reports-toolbar-title']";
const GRID_HEADER = "//table/thead/tr";
const GRID_BODY = "//table/tbody/tr";
const REPORT_HEADER = "//div[2]//div[1][h2]";
const TOTAL_TRANSACTION_COUNT = "//table/tbody/tr[2]/td[2]";
const TOTAL_TRANSACTION_AMOUNT = "//table/tbody/tr[2]/td[4]";
const INACTIVE_PERCENTAGE = "//table/tbody/tr[2]/td[5]";
const ACTIVE_PERCENTAGE = "//table/tbody/tr[2]/td[4]";
const CURRENCY = "//table/tbody/tr[2]/td[6]";
const AUDIT_GRID_TRANSACTION_NUMBER = "//table/tbody/tr[2]/td[3]";
const REPORT_GRID_TRANSACTION_NUMBER = "//table/tbody/tr[2]/td[1]";
const REPORT_GRID_BATCH_ID = "//table/tbody/tr[2]/td[2]";
const PRODUCT_CATEGORY = "//button[@id='seamless-tree-dropdown-expand-button']";
const PRODUCT_NAME = "//input[@name='productName']";
const PRODUCT_SKU = "//input[@name='productSku']";
const RESELLER_ID_MULTI = "//input[@id='reseller_id-multi-select']";
const RESELLER_TYPE_MULTI = "//input[@id='reseller_type-multi-select']";
const FROM_YEAR = "//select[@id = 'report-form-fromYear']";
const TO_YEAR = "//select[@id='report-form-toYear']";
const FROM_WEEK = "//select[@id='report-form-fromWeek']";
const TO_WEEK = "//select[@id='report-form-toWeek']";
const LEFT_NAV_BAR = "//*[@id='sidebar-label']";
const GRID_SEARCH = "//div[2]/div/div[2]/div/input";
const GRID_EXPORT = "//div[3]//div/span[2]/button";
const GRID_EXPORT_CSV = "/html/body/div[5]/div[3]/ul/li[1]";
const GRID_EXPORT_PDF = "/html/body/div[5]/div[3]/ul/li[2]";
const STATUS_TYPES = "//input[@id='status-types-multi-select']";
const STATUS = "//input[@id='status-multi-select']";
const SALES_AREA = "//input[@id='report-form-autocompletesalesArea']";


const previousDate = format(subDays(new Date(), 29), 'dd-MM-yyyy');
const currentDate = format(addDays(new Date(), 0), 'dd-MM-yyyy');
const nextDate = format(addDays(new Date(), 1), 'dd-MM-yyyy');
const ELEMENT_TIMEOUT = 20000;

class ReportsHomePage {
  static navigateToReportsUsingURL() {
    cy.log("Navigate to reports page");
    cy.intercept("GET", "api/dms/v1/resellers/types/*/allowedTypes").as("allowedTypes");
    cy.intercept("GET", "api/dms/v1/resellers/resellerChildren/*?limit=150&offset=0").as("children");
    cy.visit(URL_PATH.reports);
    cy.wait(['@allowedTypes', '@children']);
  }

  static navigateToAuditReportsUsingURL() {
    cy.log("Navigate to audit reports page");
    cy.intercept("GET", "api/dms/v1/resellers/types/*/allowedTypes").as("allowedTypes");
    cy.intercept("GET", "api/dms/v1/resellers/resellerChildren/*?limit=150&offset=0").as("children");
    cy.visit(URL_PATH.audit_reports);
    cy.wait(['@allowedTypes', '@children']);
  }

  static verifyHeader(header) {
    cy.log('verify reports page header is visible');
    cy.xpath(HEADER, { timeout: ELEMENT_TIMEOUT }).should('have.text', header);
  }

  static verifyReportHeader(reportheader) {
    cy.log('verify sub-reports page header is visible');
    cy.xpath(REPORT_HEADER, { timeout: ELEMENT_TIMEOUT }).should('have.text', reportheader);
  }

  static verifyNodeNotAvailable(node) {
    cy.log('verify node not available in left navigation bar');
    cy.xpath(LEFT_NAV_BAR, { timeout: ELEMENT_TIMEOUT }).should('not.have.text', node);
  }

  static verifyAvailableReports(report) {
    if (report !== "") {
      cy.log('verify available reports in reports tree');
      cy.xpath(AVAILABLE_REPORTS, { timeout: ELEMENT_TIMEOUT }).contains(report);
    }
  }

  static clickOnReport(report) {
    cy.log('click on report - ' + report);
    
    if (report=="Transaction Details Report")
      cy.xpath(`//div[text()='${report}']`, { timeout: ELEMENT_TIMEOUT }).click();
    else
      cy.xpath(`//div[contains(text(), '${report}')]`, { timeout: ELEMENT_TIMEOUT }).click();
    
  }


  static checkReportAvailability(report) {
    cy.log('verify report availability - ' + report);
    cy.xpath(`//div[contains(text(), '${report}')]`, { timeout: ELEMENT_TIMEOUT }).should('not.exist');
  }

  static verifySubmitBtn() {
    cy.log('verify submit button');
    cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
  }

  static verifyDownloadBtn() {
    cy.log('verify submit button');
    cy.xpath(DOWNLOAD_BUTTON, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
  }

  static verifyScheduleBtn() {
    cy.log('verify submit button');
    cy.xpath(SCHEDULE_BUTTON, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
  }

  static verifyResetBtn() {
    cy.log('verify submit button');
    cy.xpath(RESET_BUTTON, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
  }

  static verifyFieldName(fieldName) {
    if (fieldName !== "") {
      cy.log('verify field name - ' + fieldName);
      cy.xpath(`//label[text() = '${fieldName}']`, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
    }
  }

  static enterDate(dateValue) {
    if (dateValue !== "") {
      cy.log('enter date - ' + dateValue);
      cy.xpath(FROM_DATE, { timeout: ELEMENT_TIMEOUT }).clear().type(dateValue);
    }
  }

  static enterCurrentDate() {
    cy.log('enter current date - ' + currentDate);
    cy.xpath(FROM_DATE, { timeout: ELEMENT_TIMEOUT }).click().type(currentDate);
  }

  static enterFromDate() {
    cy.log('enter from date - ' + previousDate);
    cy.xpath(FROM_DATE, { timeout: ELEMENT_TIMEOUT }).clear().type(previousDate);
  }

  static enterToDate() {
    cy.log('enter to date - ' + nextDate);
    cy.xpath(TO_DATE, { timeout: ELEMENT_TIMEOUT }).clear().type(nextDate);
  }

  static selectToDate() {
    cy.log('select to date - ' + currentDate);
    cy.xpath(TO_DATE, { timeout: ELEMENT_TIMEOUT }).click().type('{enter}');
  }

  static enterFromDateInFuture() {
    cy.log('enter from date in future - ' + nextDate);
    cy.xpath(FROM_DATE, { timeout: ELEMENT_TIMEOUT }).clear().type(nextDate);
  }

  static enterToDateInFuture() {
    cy.log('enter to date in future - ' + nextDate);
    cy.xpath(TO_DATE, { timeout: ELEMENT_TIMEOUT }).clear().type(nextDate);
  }

  static enterTransactionNumber(transactionNumber) {
    if (transactionNumber !== "") {
      cy.log('enter transaction number - ' + transactionNumber);
      cy.xpath(TRANSACTION_NUMBER, { timeout: ELEMENT_TIMEOUT }).clear().type(transactionNumber);
    }
  }

  static enterERSReference(ersReference) {
    if (ersReference !== "") {
      cy.log('enter ERS reference - ' + ersReference);
      cy.xpath(ERS_REFERENCE, { timeout: ELEMENT_TIMEOUT }).clear().type(ersReference);
    }
  }

  static enterBatchId(batchId) {
    if (batchId !== "") {
      cy.log('enter batch Id - ' + batchId);
      cy.xpath(BATCH_ID, { timeout: ELEMENT_TIMEOUT }).clear().type(batchId);
    }
  }

  static clearERSAndBatchField() {
    cy.log('clear ERS reference');
    cy.xpath(ERS_REFERENCE, { timeout: ELEMENT_TIMEOUT }).clear();
    cy.log('clear batch Id');
    cy.xpath(BATCH_ID, { timeout: ELEMENT_TIMEOUT }).clear();
  }

  static resetTransactionNumberField() {
    cy.log('reset transaction number field');
    cy.xpath(TRANSACTION_NUMBER, { timeout: ELEMENT_TIMEOUT }).clear().type('ALL');
  }

  static enterCustomDate(customFromDate, customToDate) {
    cy.log('enter custom from/to date');
    if (customFromDate !== "") {
      cy.log(customFromDate);
      cy.xpath(FROM_DATE, { timeout: ELEMENT_TIMEOUT }).clear().type(customFromDate);
    }
    if (customToDate !== "") {
      cy.log(customToDate);
      cy.xpath(TO_DATE, { timeout: ELEMENT_TIMEOUT }).clear().type(customToDate);
    }
  }

  static selectEventName(eventName) {
    if (eventName !== "") {
      cy.log('select event name - ' + eventName);
      cy.xpath(EVENT_NAME, { timeout: ELEMENT_TIMEOUT }).select(eventName);
    }
  }

  static selectChannel(channel) {
    if (channel !== "") {
      cy.log('select channel - ' + channel);
      cy.xpath(CHANNEL, { timeout: ELEMENT_TIMEOUT }).select(channel);
    }
  }

  static enterResellerId(resellerId) {
    if (resellerId !== "") {
      cy.log('enter reseller Id - ' + resellerId);
      cy.xpath(RESELLER_ID, { timeout: ELEMENT_TIMEOUT }).clear().type(resellerId);
    }
  }

  static enterResellerIdAuto(resellerId) {
    if (resellerId !== "") {
      cy.log('enter reseller Id - ' + resellerId);
      cy.xpath(RESELLER_ID_AUTO, { timeout: ELEMENT_TIMEOUT }).clear().type(resellerId);
    }
  }

  static enterSender(sender) {
    if (sender !== "") {
      cy.log('enter sender - ' + sender);
      cy.xpath(SENDER, { timeout: ELEMENT_TIMEOUT }).clear().type(sender);
    }
  }

  static enterResellerType(resellerType) {
    if (resellerType !== "") {
      cy.log('enter reseller type - ' + resellerType);
      cy.xpath(RESELLER_TYPE, { timeout: ELEMENT_TIMEOUT }).clear().type(resellerType);
    }
  }

  static enterDeviationThreshold(deviationThreshold) {
    if (deviationThreshold !== "") {
      cy.log('enter deviation threshold - ' + deviationThreshold);
      cy.xpath(DEVIATION_THRESHOLD, { timeout: ELEMENT_TIMEOUT }).clear().type(deviationThreshold);
    }
  }

  static multiSelectResellerId(resellerId) {
    if (resellerId !== "") {
      cy.log('enter reseller Id - ' + resellerId);
      cy.wait(500);
      cy.xpath(RESELLER_ID_MULTI, { timeout: ELEMENT_TIMEOUT }).type(resellerId)
        .type('{downArrow}').type('{enter}');
      cy.xpath(RESELLER_ID_MULTI).click();
    }
  }

  static selectResellerType(resellerType) {
    if (resellerType !== "") {
      cy.log('select reseller type - ' + resellerType);
      cy.xpath(RESELLER_TYPE, { timeout: ELEMENT_TIMEOUT }).select(resellerType);
    }
  }

  static multiSelectResellerType(resellerType) {
    if (resellerType !== "") {
      cy.log('select reseller type - ' + resellerType);
      cy.wait(500);
      cy.xpath(RESELLER_TYPE_MULTI_SELECT, { timeout: ELEMENT_TIMEOUT }).type(resellerType)
        .type('{downArrow}').type('{enter}');
      cy.xpath(RESELLER_TYPE_MULTI_SELECT).click();
    }
  }

  static multiSelectResellerTypeAuto(resellerType) {
    if (resellerType !== "") {
      cy.log('select reseller type - ' + resellerType);
      cy.wait(500);
      cy.xpath(RESELLER_TYPE_AUTO, { timeout: ELEMENT_TIMEOUT }).type(resellerType)
        .type('{downArrow}').type('{enter}');
      cy.xpath(RESELLER_TYPE_AUTO).click();
    }
  }

  static multiSelectRegion(region) {
    if (region !== "") {
      cy.log('enter region - ' + region);
      cy.wait(1000);
      cy.xpath(REGION_MULTI_SELECT, { timeout: ELEMENT_TIMEOUT }).type(region)
        .type('{downArrow}').type('{enter}');
      cy.xpath(REGION_MULTI_SELECT).click();
    }
  }

  static selectResellerLevel(resellerLevel) {
    if (resellerLevel !== "") {
      cy.log('select reseller type - ' + resellerLevel);
      cy.xpath(RESELLER_LEVEL, { timeout: ELEMENT_TIMEOUT }).select(resellerLevel);
    }
  }

  static selectAccountType(accountType) {
    if (accountType !== "") {
      cy.log('select account type - ' + accountType);
      cy.xpath(ACCOUNT_TYPE, { timeout: ELEMENT_TIMEOUT }).select(accountType);
    }
  }

  static selectAccountTypeHierarchy(accountType) {
    if (accountType !== "") {
      cy.log('select account type - ' + accountType);
      cy.xpath(ACCOUNT_TYPE_HIERARCHY, { timeout: ELEMENT_TIMEOUT }).select(accountType);
    }
  }

  static selectSortBy(sortBy) {
    if (sortBy !== "") {
      cy.log('select sort by option - ' + sortBy);
      cy.xpath(SORT_BY, { timeout: ELEMENT_TIMEOUT }).select(sortBy);
    }
  }

  static selectTransactionType(transactionType) {
    if (transactionType !== "") {
      cy.log('select transaction type - ' + transactionType);
      cy.xpath(TRANSACTION_TYPE, { timeout: ELEMENT_TIMEOUT }).select(transactionType);
    }
  }

  static selectTransactionTypeAuto(transactionType) {
    if (transactionType !== "") {
      cy.log('select transaction type - ' + transactionType);
      cy.xpath(TRANSACTION_TYPE_AUTO, { timeout: ELEMENT_TIMEOUT }).select(transactionType);
    }
  }

  static selectTransactionProfile(transactionProfile) {
    if (transactionProfile !== "") {
      cy.log('select transaction profile - ' + transactionProfile);
      cy.xpath(TRANSACTION_PROFILE, { timeout: ELEMENT_TIMEOUT }).select(transactionProfile);
    }
  }

  static fetchAndEnterTransactionNumber(reportHeader) {
    if (reportHeader == "Audit Log Report") {
      cy.log('fetch transaction number from grid');
      cy.xpath(AUDIT_GRID_TRANSACTION_NUMBER, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').then((transactionNumber) => {
        cy.log(transactionNumber);
        this.clickOnReportNavigationToolbarIcon();
        cy.wait(200);
        this.enterTransactionNumber(transactionNumber);
      });
    } else if (reportHeader == "Bulk Topup-transfer Report") {
      cy.log('fetch transaction number from grid');
      cy.xpath(REPORT_GRID_TRANSACTION_NUMBER, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').then((ersReference) => {
        cy.log(ersReference);
        this.clickOnReportNavigationToolbarIcon();
        cy.wait(200);
        this.enterERSReference(ersReference);
      });
    }
  }

  static fetchAndEnterBatchId(reportHeader) {
    if (reportHeader == "Bulk Topup-transfer Report") {
      cy.log('fetch batch id from grid');
      cy.xpath(REPORT_GRID_BATCH_ID, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').then((batchId) => {
        cy.log(batchId);
        this.clickOnReportNavigationToolbarIcon();
        cy.wait(200);
        this.enterBatchId(batchId);
      });
    }
  }

  static applyGridSearch(keyword) {
    if (keyword !== "") {
      cy.log('enter keyword in grid search field - ' + keyword);
      cy.xpath(GRID_SEARCH, { timeout: ELEMENT_TIMEOUT }).type(keyword);
    }
  }

  static clickExportButton() {
    cy.log('click export button');
    cy.xpath(GRID_EXPORT, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickExportCSVButton() {
    cy.log('click export csv button');
    cy.xpath(GRID_EXPORT_CSV, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickExportPDFButton() {
    cy.log('click export pdf button');
    cy.xpath(GRID_EXPORT_PDF, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickSubmit() {
    cy.log('click submit');
    cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(500);
  }

  static clickDownload() {
    cy.log('click download');
    cy.xpath(DOWNLOAD_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(500);
  }

  static clickOnReportNavigationToolbarIcon() {
    cy.log('click on Report Navigation Toolbar icon');
    cy.xpath(REPORT_NAVIGATION_TOOLBAR, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickDownload() {
    cy.log('click download');
    cy.xpath(DOWNLOAD_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickReset() {
    cy.log('click reset');
    cy.xpath(RESET_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static selectFileType(fileType) {
    if (fileType !== "") {
      cy.log('select file type - ' + fileType);
      cy.xpath(FILE_TYPE, { timeout: ELEMENT_TIMEOUT }).select(fileType);
    }
  }

  static selectSize(size) {
    if (size !== "") {
      cy.log('select size - ' + size);
      cy.xpath(SIZE, { timeout: ELEMENT_TIMEOUT }).select(size);
    }
  }

  static verifyFileType(fileType) {
    if (fileType !== "") {
      cy.log('verify file type');
      cy.xpath(FILE_TYPE, { timeout: ELEMENT_TIMEOUT }).should('have.value', fileType);
    }
  }

  static verifySize(size) {
    if (size !== "") {
      cy.log('verify size');
      cy.xpath(SIZE, { timeout: ELEMENT_TIMEOUT }).should('have.value', size);
    }
  }

  static verifyReportsListNotDisplayed() {
    cy.log('verify Reports List Not Displayed');
    cy.xpath(REPORTS_LIST, { timeout: ELEMENT_TIMEOUT }).should('not.exist');
  }

  static verifyGridColumnName(columnName) {
    if (columnName !== "") {
      cy.log('verify  Grid - Column Name ' + columnName);
      cy.xpath(GRID_HEADER, { timeout: ELEMENT_TIMEOUT }).contains(columnName);
    }
  }

  static verifyGridDataLabelName(dataLabelName) {
    if (dataLabelName !== "") {
      cy.log('verify  Grid - Data Label Name ' + dataLabelName);
      cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).contains(dataLabelName);
    }
  }

  static verifyGridCount() {
    cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
  }

  static verifyGridData(reportHeader) {
    if (reportHeader == "Transaction Statistics") {
      cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length.greaterThan', 2);
    }
    else if (reportHeader == "Active Inactive Reseller") {
      if (cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length.greaterThan', 1)) {
        cy.xpath(ACTIVE_PERCENTAGE, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').then((activePercentage) => {
          const num = parseFloat(activePercentage);
          expect(num).to.be.greaterThan(0.0);
        });
      }
    } else {
      cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length.greaterThan', 1);
    }

  }

  static verifyGridDataValue(reportHeader, dataValue) {
    if (dataValue !== "") {
      if (reportHeader == "Transaction Statistics") {
        if (cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length.greaterThan', 2)) {
          cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).contains(dataValue);
        }
      } else {
        if (cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length.greaterThan', 1)) {
          cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).contains(dataValue);
        }
      }
    }
  }

  static verifyGridDataAll(reportHeader, channel, accountType, transactionType) {
    if (reportHeader == "Transaction Statistics") {
      if (cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length.greaterThan', 2)) {
        this.verifyGridDataValues(channel, accountType, transactionType);
      }
    } else {
      if (cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length.greaterThan', 1)) {
        this.verifyGridDataValues(channel, accountType, transactionType);
      }
    }
  }

  static verifyGridDataValues(channel, accountType, transactionType) {
    if (channel !== "") {
      cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).contains(channel);
    }
    if (accountType !== "") {
      cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).contains(accountType);
    }
    if (transactionType !== "") {
      cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).contains(transactionType);
    }
  }

  static verifyEmptyGridData(reportHeader) {
    if (cy.xpath(GRID_BODY, { timeout: ELEMENT_TIMEOUT }).should('have.length', 2)) {
      if (reportHeader == "Transaction Statistics") {
        cy.xpath(TOTAL_TRANSACTION_COUNT, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').should('equal', '0');
        cy.xpath(TOTAL_TRANSACTION_AMOUNT, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').should('equal', '0');
        cy.xpath(CURRENCY, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').should('equal', 'N/A');
      } else if (reportHeader == "Active Inactive Reseller") {
        cy.xpath(INACTIVE_PERCENTAGE, { timeout: ELEMENT_TIMEOUT }).invoke('attr', 'value').should('equal', '100');
      }
    }
  }

  static verifyDownloadSuccessMessage(downloadMessage, successMessage) {
    CommonUtilities.validateMessage(downloadMessage);
    cy.wait(1000);
    CommonUtilities.validateMessage(successMessage);
  }

  static deleteReportFile(fileName) {
    cy.task('deleteZipFile', fileName);
  }

  static enterFieldsValue(productCategory, productName, productSKU, resellerType, resellerId) {

    if (productCategory !== "") {
      cy.log("enter product category - " + productCategory);
      cy.intercept("POST", "api/pms/v1/productVariant?page=0&perPage=50").as("productVariant");
      cy.xpath(PRODUCT_CATEGORY, { timeout: ELEMENT_TIMEOUT }).type(productCategory);
      cy.xpath("//span[contains(text(),'ALL')]").click();
      cy.get("#reportBox").click({ force: true });
      cy.wait("@productVariant")
      cy.wait(800);
    }
    if (productName !== "") {
      cy.log("enter product name - " + productName);
      cy.xpath(PRODUCT_NAME, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
      cy.wait(800);
    }
    if (productSKU !== "") {
      cy.log("enter product SKU - " + productSKU);
      cy.xpath(PRODUCT_SKU, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
      cy.wait(800);
    }
    if (resellerType !== "") {
      cy.log("enter reseller type - " + resellerType);
      cy.xpath(RESELLER_TYPE_MULTI, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
      cy.wait(1000);
    }
    if (resellerId !== "") {
      cy.log("enter reseller id - " + resellerId);
      cy.xpath(RESELLER_ID_MULTI, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.wait(800);
    }
  }

  static verifyErrorMessage(errorMessage) {
    CommonUtilities.validateMessage(errorMessage);
  }

  static verifyResellerId(productCategory, productName, productSKU, resellerType, resellerId) {
    if (productCategory !== "") {
      cy.log("select product category - " + productCategory);
      cy.xpath(PRODUCT_CATEGORY, { timeout: ELEMENT_TIMEOUT }).type(productCategory);
      cy.xpath("//span[contains(text(),'ALL')]").click();
      cy.get("#reportBox").click({ force: true });
    }
    if (productName !== "") {
      cy.log("select product name - " + productName);
      cy.xpath(PRODUCT_NAME, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
    if (productSKU !== "") {
      cy.log("select product SKU - " + productSKU);
      cy.wait(1000);
      cy.xpath(PRODUCT_SKU, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
    if (resellerType !== "") {
      cy.log("select reseller type " + resellerType);
      cy.xpath(RESELLER_TYPE_MULTI, { timeout: ELEMENT_TIMEOUT }).type(resellerType).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
    if (resellerId !== "") {
      cy.log("select reseller id - " + resellerId);
      cy.xpath(RESELLER_ID_MULTI, { timeout: ELEMENT_TIMEOUT }).type(resellerId).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
  }

  static verifyProductName(productCategory, productName, productSKU, resellerType, resellerId) {
    if (productCategory !== "") {
      cy.log("enter product category - " + productCategory);
      cy.wait(2000);
      cy.xpath(PRODUCT_CATEGORY, { timeout: ELEMENT_TIMEOUT }).type(productCategory);
      // cy.xpath("//span[contains(text(),'Physical Products')]").click({ force: true });
      cy.xpath("//span[contains(text(),'Physical Products')]").click({ force: true });
      cy.get("#reportBox").click({ force: true });
      cy.wait(800);
    }
    if (productName !== "") {
      cy.log("enter product name - " + productName);
      cy.xpath(PRODUCT_NAME, { timeout: ELEMENT_TIMEOUT }).type(productName).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
    if (productSKU !== "") {
      cy.log("enter product SKU - " + productSKU);
      cy.wait(1000);
      cy.xpath(PRODUCT_SKU, { timeout: ELEMENT_TIMEOUT }).type(productSKU).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
    if (resellerType !== "") {
      cy.log("enter reseller type - " + resellerType);
      cy.xpath(RESELLER_TYPE_MULTI, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
    if (resellerId !== "") {
      cy.log("enter reseller id - " + resellerId);
      cy.xpath(RESELLER_ID_MULTI).click();
      cy.xpath(RESELLER_ID_MULTI, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
    }
  }

  static enterFromYear(fromYear) {
    cy.log('enter from year - ' + fromYear);
    cy.xpath(FROM_YEAR).should('be.visible').select(fromYear);
  }

  static enterToYear(currentYear) {
    cy.log('enter to Year - ' + currentYear);
    cy.xpath(TO_YEAR).should('be.visible').select(currentYear);
  }

  static enterFromWeek(fromWeek) {
    cy.log('enter from week - ' + fromWeek);
    cy.xpath(FROM_WEEK).should('be.visible').select(fromWeek);
  }

  static enterToWeek(toWeek) {
    cy.log('enter to Week - ' + toWeek);
    cy.xpath(TO_WEEK).should('be.visible').select(toWeek);
  }

  static selectFieldsValue(resellerType, resellerId, statusTypes, status, region, salesArea) {
    if (resellerType !== "") {
      cy.log("select reseller type - " + resellerType);
      cy.xpath(RESELLER_TYPE_MULTI, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
      cy.wait(500);
    }
    if (resellerId !== "") {
      cy.log("enter reseller id - " + resellerId);
      cy.xpath(RESELLER_ID_MULTI, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
      cy.wait(500);
    }
    if (statusTypes !== "") {
      cy.log("enter status types - " + statusTypes);
      cy.xpath(STATUS_TYPES).click();
      cy.xpath(STATUS_TYPES, { timeout: ELEMENT_TIMEOUT }).focus().type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
      cy.wait(300);
    }
    if (status !== "") {
      cy.log("select status - " + status);
      cy.xpath(STATUS, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.get("#reportBox").click({ force: true });
      cy.wait(500);
    }
    if (region !== "") {
      cy.log("select region - " + region);
      cy.xpath(REGION_MULTI_SELECT, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.wait(500);
    }
    if (salesArea !== "") {
      cy.log("select sales area - " + salesArea);
      cy.xpath(SALES_AREA, { timeout: ELEMENT_TIMEOUT }).type("{downArrow}").type("{enter}");
      cy.wait(500);
    }
  }

}

export default ReportsHomePage;
