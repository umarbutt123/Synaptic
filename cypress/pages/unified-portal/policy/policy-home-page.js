import URL_PATH from '../../../common/Route';

const CREATE_POLICY = "//span[contains(text(),'Create new policy')]";
const POLICY_NAME = "//input[@class='MuiInputBase-input MuiInput-input MuiInputBase-inputMarginDense MuiInput-inputMarginDense']";
const DESCRIPTION = "//textarea[@name='description']";
const END_DATE_PICKER = "//input[@name='toDate']";
const CLICK_START_DATE_PICKER = "(//button[@class='MuiButtonBase-root MuiIconButton-root'])[1]";
const CLICK_END_DATE_PICKER = "(//button[@class='MuiButtonBase-root MuiIconButton-root'])[2]";
const SELECT_ACCESSIBLE_MODULES = "//input[@aria-labelledby='ACCESS']";
const SELECT_ACCESSIBLE_UI_SUBMODULES = "(//input[@aria-labelledby='[object Object]'])[1]";
const SELECT_ACCESSIBLE_SUBMODULES = "(//input[@aria-labelledby='[object Object]'])[2]";
const MOVE_TO_LEFT_ACCESSIBLE_MODULES = "(//button[@aria-label='move selected left'])[1]";
const MOVE_TO_LEFT_ACCESSIBLE_SUBMODULES = "(//button[@aria-label='move selected left'])[2]";
const SUBMIT_BUTTON = "//span[normalize-space()='Save']";
const FILTER = "//span[text()='Filters']";
const COLUMN_SELECT = "//select[@id='columns-filter-select']";
const OPERATOR_SELECT = "//select[@id='columns-operators-select']";
const FILTER_VALUE = "//input[@placeholder='Filter value']";
const CONFIRM_DELETE_POPUP = "//p[contains(text(),'delete the policy')]";
const DELETE_POPUP_YES_BUTTON = "(//button//span[contains(text(),'Delete')])[1]";
const POLICY_DESCRIPTION = "(//p[text()='Description']/../following-sibling::div/p)[1]";
const START_DATE = "(//p[text()='Start Date']/../following-sibling::div/p)[1]";
const END_DATE = "(//p[text()='End Date']/../following-sibling::div/p)[1]";
const PREVIEW_BUTTON = "//span[contains(text(),'Preview')]";
const UPDATE_BUTTON = "(//button/span[contains(text(),'Update')])[1]";
const UPDATE_ACCESSIBLE_MODULES = "//input[@aria-labelledby='ACTIVITY']";
const UPDATE_ACCESSIBLE_SUBMODULES = "(//input[@aria-labelledby='[object Object]'])[3]";
const FILTER_UI_BASED_MODULE = "//span[contains(text(),'Filter UI based module features')]";
const SELECT_YEAR = "//h6[contains(text(),'2025')]";
const ELEMENT_TIMEOUT = 20000;

class PolicyHomePage {
  static clickCreatePolicyButton() {
    cy.log('click on create new policy button');
    cy.wait(800);
    cy.intercept("GET", "api/access/v2/module").as("getModule");
    cy.intercept("POST", "api/access/v2/getEndpointsByModule").as("getEndpointsByModule");
    cy.xpath(CREATE_POLICY).click();
    cy.wait(["@getModule", "@getEndpointsByModule"]);

  }

  static selectDatesFromCalender() {
    cy.log("select start date");
    cy.xpath(CLICK_START_DATE_PICKER, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath("//h6[contains(@class, 'MuiTypography-subtitle1') and text()='AM']").click();
    cy.get("[class='MuiPickersBasePicker-container']").type('{Enter}');
    cy.log("select end date");
    cy.xpath(END_DATE_PICKER, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath(CLICK_END_DATE_PICKER, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath("//h6[contains(@class, 'MuiTypography-subtitle1') and text()='PM']").click();
    cy.get("[class='MuiPickersBasePicker-container']").type('{Enter}');
  }

  static selectAccessibleModules() {
    cy.log('select accessible module');
    cy.xpath(SELECT_ACCESSIBLE_MODULES, { timeout: ELEMENT_TIMEOUT }).click();
    cy.log('move selected modules left');
    cy.xpath(MOVE_TO_LEFT_ACCESSIBLE_MODULES, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static selectAccessibleSubModules() {
    cy.log('select accessable sub modules');
    cy.xpath(SELECT_ACCESSIBLE_SUBMODULES, { timeout: ELEMENT_TIMEOUT }).click();
    cy.log('move selected submodules left');
    cy.xpath(MOVE_TO_LEFT_ACCESSIBLE_SUBMODULES, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickOnSubmitButton() {
    cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static visitPolicyHomePage() {
    cy.log('Now visit policy home page');
    cy.intercept("POST", "api/access/v2/policyList").as("policyList");
    cy.visit(URL_PATH.policy);
    cy.wait("@policyList")
  }

  static clickFilterButton() {
    cy.log('click filter button');
    cy.xpath(FILTER).click();
  }

  static selectColumn(column) {
    cy.log('select column for filter');
    cy.xpath(COLUMN_SELECT).select(column);
  }

  static selectOperator(operator) {
    cy.log('select operator for filter');
    cy.xpath(OPERATOR_SELECT).select(operator);
  }

  static fillFilterValue(filterValue) {
    cy.log('Provide the filter value you want to show inside the Table');
    cy.xpath(FILTER_VALUE).clear().type(filterValue);
  }

  static verifyConfirmPopup() {
    cy.xpath(CONFIRM_DELETE_POPUP).should('be.visible');
  }

  static clickOnDeletePolicy(policyName) {
    cy.log("click on Delete button");
    cy.xpath(`(//div[@data-value='${policyName}']/following-sibling::div[@data-field='actions']//*[local-name()='svg'])[4]`).scrollIntoView().click();
  }

  static clickOnViewPolicy(policyName) {
    cy.log("click on View button");
    cy.intercept("GET", "api/access/v2/policy/*").as("getPolicy");
    cy.xpath(`(//div[@data-value='${policyName}']/following-sibling::div[@data-field='actions']//*[local-name()='svg'])[2]`).scrollIntoView().click();
    cy.wait("@getPolicy");
  }

  static clickOnDeleteRolePopupYesButton() {
    cy.log('Clicking on Delete Policy Popup Yes Button');
    cy.wait(800);
    cy.xpath(DELETE_POPUP_YES_BUTTON).click({ force: true });
  }

  static clickOnEditPolicy(policyName) {
    cy.log("click on Edit button");
    cy.intercept("GET", "api/access/v2/policy/*").as("getPolicy");
    cy.intercept("GET", "api/access/v2/module").as("getModule");
    cy.intercept("POST", "api/access/v2/getEndpointsByModule").as("getEndpointsByModule");
    cy.wait(800);
    cy.xpath(`(//div[@data-value='${policyName}']/following-sibling::div[@data-field='actions']//*[local-name()='svg'])[1]`).scrollIntoView().click();
    cy.wait(["@getPolicy", "@getModule", "@getEndpointsByModule"]);
  }

  static updateModule() {
    cy.log('add accessible module');
    cy.xpath(UPDATE_ACCESSIBLE_MODULES, { timeout: ELEMENT_TIMEOUT }).click();
    cy.log('move selected modules left');
    cy.xpath(MOVE_TO_LEFT_ACCESSIBLE_MODULES, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static UpdateSubModules() {
    cy.log('add accessable sub modules');
    cy.xpath(UPDATE_ACCESSIBLE_SUBMODULES, { timeout: ELEMENT_TIMEOUT }).click();
    cy.log('move selected submodules left');
    cy.xpath(MOVE_TO_LEFT_ACCESSIBLE_SUBMODULES, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static enterPolicyName(policyName) {
    if (policyName !== "") {
      cy.log("Entering policy name");
      cy.xpath(POLICY_NAME, { timeout: ELEMENT_TIMEOUT }).clear();
      cy.xpath(POLICY_NAME, { timeout: ELEMENT_TIMEOUT }).type(policyName);

    }
  }

  static enterDescription(policyDescription) {
    if (policyDescription !== "") {
      cy.log("Entering policy description");
      cy.xpath(DESCRIPTION, { timeout: ELEMENT_TIMEOUT }).clear().type(policyDescription);
    }
  }

  static clickOnPreviewButton() {
    cy.xpath(PREVIEW_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickOnUpdateButton() {
    cy.xpath(UPDATE_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickOnFilterUICheckBox() {
    cy.xpath(FILTER_UI_BASED_MODULE, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath(SELECT_ACCESSIBLE_UI_SUBMODULES, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath(MOVE_TO_LEFT_ACCESSIBLE_SUBMODULES, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath(FILTER_UI_BASED_MODULE, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static viewPolicyDescription(policyDescription) {
    cy.log('validating Policy name');
    cy.xpath(POLICY_DESCRIPTION, { timeout: ELEMENT_TIMEOUT }).then((POLICYDESCRIPTION) => {
      const description = POLICYDESCRIPTION.text();
      expect(description).to.equal(policyDescription);
    });
  }

  static viewStartDate(startDate) {
    cy.log('validating start date');
    cy.xpath(START_DATE, { timeout: ELEMENT_TIMEOUT }).then((STARTDATE) => {
      const startdate = STARTDATE.text();
      expect(startdate).to.equal(startDate);
    });
  }

  static viewEndDate(endDate) {
    cy.log('validating end date');
    cy.xpath(END_DATE, { timeout: ELEMENT_TIMEOUT }).then((ENDDATE) => {
      const enddate = ENDDATE.text();
      expect(enddate).to.equal(endDate);
    });
  }
}

export default PolicyHomePage;
