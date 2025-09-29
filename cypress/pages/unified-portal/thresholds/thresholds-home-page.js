import URL_PATH from '../../../common/Route';

const CREATE_BUTTON = "//span[text()='Create']";
const RESELLER_TYPE = "//*[@id='reseller-type-id-dropdown']";
const ACCOUNT_TYPE = "//*[@id='accountype-drop-down']";
const GROUP_NAME = "//*[@id='group-name-input-box']";
const ADMIN_SUPPORT = "//*[@id='admin-support-report-drop-down']";
const ENABLED_SWITCH = "//*[@id='enabled-switch']";
const PARAM_TYPE = "//*[@id='additional-field-dropdown']";
const RESELLER_ID = "//*[@id='reseller-id-input-box']";
const PARAM_ID = "//*[@id='param-id-input-box']";
const PARAM_VALUE = "//*[@id='value-input-box']";
const NEW_PARAMS_BUTTON = "//span[text()='Add new params']";
const NEW_LEVELS_BUTTON = "//span[text()='Add new level']";
const DELETE_LEVEL_BUTTON = "//*[@id='delete-button']";
const EDIT__LEVEL_BUTTON = "//*[@id='show-levelform-button']";
const ALERT_MODE = "//*[@id='low-balance-reseller-type-dropdown']";
const SALES_DAYS = "//*[@id='sales-in-days-input-box']";
const THRESHOLD_VALUE = "//*[@id='threshold-value-input-box']";
const RESELLER_MESSAGE = "//*[@id='reseller-message-input-box']"; 
const PARENT_MESSAGE = "//*[@id='parent-message-input-box']"; 
const NOTIFY_PARENT = "//*[@id='notify-parent-checkbox']";
const NEW_PHONE_BUTTON = "//span[text()='Add New Phone']";
const NEW_EMAIL_BUTTON = "//span[text()='Add New Email']";
const PHONE = "//*[@id='phone-input-box']"; 
const EMAIL = "//*[@id='email-input-box']"; 
const CLOSE_BUTTON = "//span[text()='Close']";
const SAVE_BUTTON = "//span[text()='Save Changes']";
const RESET_BUTTON = "//span[text()='Reset']";
const SUBMIT_BUTTON = "//span[text()='Submit']";
const SEARCH_BUTTON = "//span[text()='Search']";
const VERIFY_RESELLER_TYPE = "//div[@data-rowindex='0' and @data-field='resellerTypeId']";
const VERIFY_ACCOUNT_TYPE = "//div[@data-rowindex='0' and @data-field='resellerAccountTypeId']";
const VERIFY_GROUP_NAME = "//div[@data-rowindex='0' and @data-field='groupName']";
const VERIFY_COMPARISON_TYPE = "//div[@data-rowindex='0' and @data-field='comparisonType']";
const VERIFY_ENABLED_VALUE = "//div[@data-rowindex='0' and @data-field='enabled']";
const DELETE_THRESHOLD_BUTTON = "//*[@id='delete-threshold-button-0']";
const VIEW_THRESHOLD_BUTTON = "//*[@id='view-threshold-button-0']";
const EDIT_THRESHOLD_BUTTON = "//*[@id='update-threshold-button-0']";
const NO_CONFIRMATION_BUTTON = "//span[text()='No']";
const YES_CONFIRMATION_BUTTON = "//span[text()='Yes']";
const BASIC_INFO_TAB = "//*[@id='view-balance-threshold-section-header-summary']";
const CONFIG_PARAMS_TAB = "//*[@id='params-balance-config-header']";
const CONFIG_LEVELS_TAB = "//*[@id='levels-balance-config-three-d-header']";
const GROUP_NAME_VALUE = "//*[@id='group-name-value']";
const COMPARISON_TYPE_VALUE = "//*[@id='comparison-type-value']"; 
const RESELLER_TYPE_VALUE = "//*[@id='reseller-type-id-value']";
const ACCOUNT_TYPE_VALUE = "//*[@id='reseller-account-type-id-value']";
const ENABLED_VALUE = "//*[@id='enabled-value']";
const PARAM_TYPE_VALUE = "//*[@id='param-type-value']";
const RESELLER_ID_VALUE = "//*[@id='reseller-id-value']";
const PARAM_ID_VALUE = "//*[@id='param-id-value']";
const PARAM_VALUE_VALUE = "//*[@id='param-value-value']";
const NOTIFY_PARENT_VALUE = "//*[@id='notify-parent-value']";
const SALES_DAYS_VALUE = "//*[@id='sales-in-no--of-days-value']";
const THRESHOLD_VALUE_VALUE = "//*[@id='threshold-value-value']";
const THRESHOLD_BALANCE_HOME_LINK = "//*[@id='home-thresholds-balance-link']";

class ThresholdsHomePage {
  static thresholdsInventoryPageUsingURL() {
    cy.log('visit thresholds inventory page');
    cy.visit(URL_PATH.thresholdsInventory);
  }

  static thresholdsBalancePageUsingUrl() {
    cy.log('visit thresholds balance page');
    cy.visit(URL_PATH.thresholdsBalance);
  }

  static clickCreateButton() {
    cy.log('click on create button');
    cy.xpath(CREATE_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static selectResellerType(resellerType) {
    cy.log('select reseller type');
    if (resellerType !== ""){
      cy.xpath(RESELLER_TYPE,{ timeout: 5000 }).select(resellerType);
    } 
  }

  static selectAccountType(accountType) {
    cy.log('select account type');
    if (accountType !== ""){
      cy.xpath(ACCOUNT_TYPE,{ timeout: 5000 }).select(accountType);
    }
  }

  static enterGroupName(groupName) {
    cy.log('enter group name - ' + groupName);
    if (groupName !== ""){
      cy.xpath(GROUP_NAME,{ timeout: 5000 }).clear().type(groupName);
    }
  }

  static selectAdminSupport(adminSupport) {
    cy.log('select admin support');
    if (adminSupport !== ""){
      cy.xpath(ADMIN_SUPPORT,{ timeout: 5000 }).select(adminSupport);
    }
  }

  static checkEnabledSwitch() {
    cy.log('check Enabled toggle button');
    cy.xpath(ENABLED_SWITCH,{ timeout: 5000 }).check();
  }

  static uncheckEnabledSwitch() {
    cy.log('uncheck Enabled toggle button');
    cy.xpath(ENABLED_SWITCH,{ timeout: 5000 }).uncheck();
  }

  static selectParamType(paramType) {
    cy.log('select param type');
    if (paramType !== ""){
      cy.xpath(PARAM_TYPE,{ timeout: 5000 }).select(paramType);
    }
  }

  static enterResellerId(resellerId) {
    cy.log('enter reseller id');
    if (resellerId !== ""){
      cy.xpath(RESELLER_ID,{ timeout: 5000 }).clear().type(resellerId);
    }
  }

  static enterParamId(paramId) {
    cy.log('enter param id');
    if (paramId !== ""){
      cy.xpath(PARAM_ID,{ timeout: 5000 }).clear().type(paramId);
    }
  }

  static enterParamValue(paramValue) {
    cy.log('enter param value');
    if (paramValue !== ""){
      cy.xpath(PARAM_VALUE,{ timeout: 5000 }).clear().type(paramValue);
    }
  }

  static clickNewParamsButton() {
    cy.log('click on new params button');
    cy.xpath(NEW_PARAMS_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickNewLevelsButton() {
    cy.log('click on new levels button');
    cy.xpath(NEW_LEVELS_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickDeleteLevelButton() {
    cy.log('click on delete button');
    cy.xpath(DELETE_LEVEL_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickEditLevelButton() {
    cy.log('click on edit button');
    cy.xpath(EDIT__LEVEL_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static selectAlertMode(alertMode) {
    cy.log('select alert mode');
    if (alertMode !== ""){
      cy.xpath(ALERT_MODE,{ timeout: 5000 }).select(alertMode);
    }
  }

  static enterSalesInDays(salesDays) {
    cy.log('enter sales in no. of days');
    if (salesDays !== ""){
      cy.xpath(SALES_DAYS,{ timeout: 5000 }).clear().type(salesDays);
    }
  }

  static enterThresholdValue(thresholdValue) {
    cy.log('enter threshold value');
    if (thresholdValue !== ""){
      cy.xpath(THRESHOLD_VALUE,{ timeout: 5000 }).type(thresholdValue);
    }
  }

  static enterResellerMessage(resellerMessage) {
    cy.log('enter reseller message');
    if (resellerMessage !== ""){
      cy.xpath(RESELLER_MESSAGE,{ timeout: 5000 }).clear().type(resellerMessage);
    }
  }

  static enterParentMessage(parentMessage) {
    cy.log('enter parent message');
    if (parentMessage !== ""){
      cy.xpath(PARENT_MESSAGE,{ timeout: 5000 }).clear().type(parentMessage);
    }
  }

  static checkNotifyParentCheckbox() {
    cy.log('check notify parent checkbox');
    cy.xpath(NOTIFY_PARENT,{ timeout: 5000 }).check();
  }

  static clickNewPhoneButton() {
    cy.log('click on new phone button');
    cy.xpath(NEW_PHONE_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickNewEmailButton() {
    cy.log('click on new email button');
    cy.xpath(NEW_EMAIL_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static enterPhone(phone) {
    cy.log('enter phone number');
    if (phone !== ""){
      cy.xpath(PHONE,{ timeout: 5000 }).clear().type(phone);
    }
  }

  static enterEmail(email) {
    cy.log('enter email');
    if (email !== ""){
      cy.xpath(EMAIL,{ timeout: 5000 }).clear().type(email);
    }
  }

  static clickCloseButton() {
    cy.log('click on close button');
    cy.xpath(CLOSE_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickSaveButton() {
    cy.log('click on save changes button');
    cy.xpath(SAVE_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickResetButton() {
    cy.log('click on reset button');
    cy.xpath(RESET_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickSubmitButton() {
    cy.log('click on submit button');
    cy.xpath(SUBMIT_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static clickSearchButton() {
    cy.log('click on search button');
    cy.xpath(SEARCH_BUTTON, { timeout: 5000 }).click();
    cy.wait(1000);
  }

  static verifyResellerType(resellerType) {
    cy.xpath(VERIFY_RESELLER_TYPE, {timeout: 5000}).then((table) => {
      const type = table.text();
      cy.log('Reseller Type - ' + type);
      expect(type).equal(resellerType);
    });
  }

  static verifyAccountType(accountType) {
    cy.xpath(VERIFY_ACCOUNT_TYPE, {timeout: 5000}).then((table) => {
      const type = table.text();
      cy.log('Account Type - ' + type);
      expect(type).equal(accountType);
    });
  }

  static verifyGroupName(groupName) {
    cy.xpath(VERIFY_GROUP_NAME, {timeout: 5000}).then((table) => {
      const name = table.text();
      cy.log('Group Name - ' + name);
      expect(name).equal(groupName);
    });
  }

  static verifyEnabledValue(enabledValue) {
    cy.xpath(VERIFY_ENABLED_VALUE, {timeout: 5000}).then((table) => {
      const value = table.text();
      cy.log('Enabled Value - ' + value);
      expect(value).equal(enabledValue);
    });
  }

  static verifyComparisonType(comparisonType) {
    cy.xpath(VERIFY_COMPARISON_TYPE, {timeout: 5000}).then((table) => {
      const type = table.text();
      cy.log('Comparison Type - ' + type);
      expect(type).equal(comparisonType);
    });
  }

  static clickDeleteButton() {
    cy.log('click on delete button');
    cy.xpath(DELETE_THRESHOLD_BUTTON, {timeout: 5000}).click();
  }

  static clickYesConfirmationButton() {
    cy.log('click on Yes confirmation button');
    cy.xpath(YES_CONFIRMATION_BUTTON, {timeout: 5000}).click();
  }

  static clickNoConfirmationButton() {
    cy.log('click on No confirmation button');
    cy.xpath(NO_CONFIRMATION_BUTTON, {timeout: 5000}).click();
  }

  static clickViewButton() {
    cy.log('click on view button');
    cy.xpath(VIEW_THRESHOLD_BUTTON, {timeout: 5000}).click();
  }

  static clickBasicInfoTab() {
    cy.log('click on basic info tab');
    cy.xpath(BASIC_INFO_TAB, {timeout: 5000}).click();
  }

  static verifyBasicInfoTabData(groupName, comparisonType, resellerType, accountType, enabledValue) {
    if (groupName !== "") {
      cy.xpath(GROUP_NAME_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Group Name - ' + value);
        expect(value).equal(groupName);
      });
    }
    if (comparisonType !== "") {
      cy.xpath(COMPARISON_TYPE_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Comparison Type - ' + value);
        expect(value).equal(comparisonType);
      });
    }
    if (resellerType !== "") {
      cy.xpath(RESELLER_TYPE_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Reseller Type - ' + value);
        expect(value).equal(resellerType);
      });
    }
    if (accountType !== "") {
      cy.xpath(ACCOUNT_TYPE_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Account Type - ' + value);
        expect(value).equal(accountType);
      });
    }
    if (enabledValue !== "") {
      cy.xpath(ENABLED_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Enabled - ' + value);
        expect(value).equal(enabledValue);
      });
    }
  }

  static clickConfigParamsTab() {
    cy.log('click on config params tab');
    cy.xpath(CONFIG_PARAMS_TAB, {timeout: 5000}).click();
  }

  static verifyConfigParamsTabData(paramType, resellerId, paramId, paramValue) {
    if (paramType !== "") {
      cy.xpath(PARAM_TYPE_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Param Type - ' + value);
        expect(value).equal(paramType);
      });
    }
    if (resellerId !== "") {
      cy.xpath(RESELLER_ID_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Reseller Id - ' + value);
        expect(value).equal(resellerId);
      });
    }
    if (paramId !== "") {
      cy.xpath(PARAM_ID_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Param Id - ' + value);
        expect(value).equal(paramId);
      });
    }
    cy.log(paramValue);
    if (paramValue !== "") {
      cy.xpath(PARAM_VALUE_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Param Value - ' + value);
        expect(value).equal(paramValue);
      });
    }
  }

  static clickConfigLevelsTab() {
    cy.log('click on config levels tab');
    cy.xpath(CONFIG_LEVELS_TAB, {timeout: 5000}).click();
  }

  static verifyConfigLevelsTabData(notifyParent, salesDays, thresholdValue) {
    if (notifyParent !== "") {
      cy.xpath(NOTIFY_PARENT_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Notify Parent - ' + value);
        expect(value).equal(notifyParent);
      });
    }
    if (salesDays !== "") {
      cy.xpath(SALES_DAYS_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Sales In Days - ' + value);
        expect(value).equal(salesDays);
      });
    }
    if (thresholdValue !== "") {
      cy.xpath(THRESHOLD_VALUE_VALUE, {timeout: 5000}).then((label) => {
        const value = label.text();
        cy.log('Threshold Value - ' + value);
        expect(value).equal(thresholdValue);
      });
    }
  }

  static clickHomeLinkIcon() {
    cy.log('click on home link icon');
    cy.xpath(THRESHOLD_BALANCE_HOME_LINK, {timeout: 5000}).click();
  }

  static clickEditButton() {
    cy.log('click on edit button');
    cy.xpath(EDIT_THRESHOLD_BUTTON, {timeout: 5000}).click();
  }

}
export default ThresholdsHomePage;
