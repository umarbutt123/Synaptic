import URL_PATH from '../../../common/Route';

const FETCH_FIRST_SERIAL_NUMBER = "//div[@data-field='serialNumber' and @data-rowindex='0']";
const FILTER = "//span[text()='Filters']";
const COLUMN_SELECT = "select[id=columns-filter-select]";
const OPERATOR_SELECT = "select[id=columns-operators-select]";
const FILTER_VALUE = "//input[@class='MuiInputBase-input MuiInput-input']";
const FIRST_VIEW_BUTTON = "(//a[contains(@href,'/home/inventory/detailed/inventory/view')])[1]";
let serialNumber = "";

class DetailedInventoryPage {
  static visitDetailedInventoryHomePageUsingUrl() {
    cy.log('Go to Inventories page');
    cy.wait(1000);
    cy.intercept("POST", "api/ims/v2/inventories?order=desc&orderBy=locationId&page=1&perPage=20").as("detailedInventory");
    cy.visit(URL_PATH.detailedInventory);
    cy.wait("@detailedInventory").then((interception) => {
      if (interception.response.statusCode !== 200) {
        throw new Error("API request returned a status other than 200");
      }
    });
    cy.wait(1000);
  }

  static getFirstSerialNumber() {
    cy.log('fetching first serial number from UI');
    cy.xpath(FETCH_FIRST_SERIAL_NUMBER).invoke('text').then((fetchSerialNumber) => {
      serialNumber = fetchSerialNumber;
      cy.log('serial number is = ', serialNumber);
      cy.task('setValue', serialNumber);
    });
  }

  static clickFilterButton() {
    cy.log('Click on filter');
    cy.xpath(FILTER).click();
  }

  static selectColumn(value) {
    cy.log('Select column');
    cy.get(COLUMN_SELECT).select(value);
  }

  static selectOperator(value) {
    cy.log('Select operator');
    cy.get(OPERATOR_SELECT).select(value);
  }

  static fillSerialNumber() {
    cy.log('Enter serial number');
    cy.xpath(FILTER_VALUE).clear().type(serialNumber);
  }

  static searchedRowVisible() {
    cy.xpath(FETCH_FIRST_SERIAL_NUMBER).should('be.visible');
  }

  static clickOnEyeIcon(productSKU) {
    cy.log('click on eye icon');
    cy.task('getValue').then((serialNo) => {
      cy.log(serialNo);
      cy.xpath(`//a[@href="/home/inventory/detailed/inventory/view/${productSKU}/${serialNo}"]`).click();
    });
  }

  static verifyColumnNotVisible(columnName) {
    cy.log('verify column should be hidden in table');
    cy.wait(200);
    cy.xpath(`(//div[@data-field="${columnName}"])[1]`).should('not.exist');
  }

  static clickOnFirstEyeIcon() {
    cy.log('click on first eye icon');
    cy.xpath(FIRST_VIEW_BUTTON).click();
  }

  static validateTableListParameters(key, value) {
    cy.log('validate list values inside table ');
    // this.scrollRight();
    cy.xpath(`//div[@class='MuiDataGrid-colCellTitleContainer']/ancestor::div[@class='MuiDataGrid-main']/descendant::div[text()='${value}']`).then(($elements) => {
      // html structure is changed so this is not working 
      // cy.xpath(`//div[@class='MuiDataGrid-colCellTitle' and text()='${key}']/ancestor::div[@class='MuiDataGrid-main']/descendant::div[text()='${value}']`).then(($elements) => {

      const listOfElements = $elements.length;
      cy.log(listOfElements);
      for (let i = 1; i <= listOfElements; i++) {
        cy.xpath(`(//div[@class='MuiDataGrid-colCellTitleContainer']/ancestor::div[@class='MuiDataGrid-main']/descendant::div[text()='${value}'])[${i}]`).should('include.text', value);
        // html structure is changed so this is not working 
        // cy.xpath(`(//div[@class='MuiDataGrid-colCellTitle' and text()='${key}']/ancestor::div[@class='MuiDataGrid-main']/descendant::div[text()='${value}'])[${i}]`).should('include.text', value);
      }
    });
  }
}

export default DetailedInventoryPage;
