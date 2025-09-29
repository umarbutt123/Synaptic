/* eslint-disable */
const NEXT_BUTTON = '//span[text()="Next"]';
const SUBMIT_BUTTON = '//span[text()="Submit"]';
const SELECT_BUYER = "//div[@data-id='SUBDIST1-1']//span[@class='MuiIconButton-label']/input";
// const GET_ORDER_ID = '.MuiAlert-message > p:nth-child(2)';
const GET_ORDER_ID = '//div[@id="notistack-snackbar"]';
const CLOSE_BUTTON = '//span[text()="Close"]';
const SEARCH_ORDER_ID = '//div[@class="MuiFormControl-root MuiTextField-root"]//input[@type="text"]';
const SELECT_PRODUCT_SKU_FIELD = '//input[@id="combo-box-demo"]';
const QUANTITY_FIELD = '//input[@placeholder="Amount"]';
const ADD_TO_CART_FIELD = '//span[text()="ADD TO CART"]';
const MESSAGE_ALERT = '//div[@id="notistack-snackbar"]';
const SELECT_BUYER_ID = '//div[@data-rowindex=0]//input[@type="checkbox"]';
const SEARCH_RESELLER_ID = '//input[@placeholder="Reseller ID"]';
const SEARCH_BUTTON = '//button[@type="submit"]';
const CLICK_ADDITIONAL_INFORMATION = "//button/span[text()='Additional Information']";
const CLICK_SENDERPIN = "//*[local-name()='th' and text()='senderPin']/..//*[local-name()='svg' and @class='MuiSvgIcon-root MuiSvgIcon-fontSizeSmall']";
const ENTER_SENDERPIN_VALUE = "(//input[@class='MuiInputBase-input'])[2]";
const CLICK_PLUS_BUTTON = "//section/div//button[@tabindex='0']";
const CLICK_SUBMIT = "(//button/span[text()='Submit'])[2]";
const FILTER_VALUE = '//div[@class="MuiFormControl-root MuiDataGridFilterForm-filterValueInput"]//input[@type="text"]';
const ENTER_ORDER_ID = "//input[@id='order-id-input-box']";
const VALIDATE_ORDER_ID = "//p[contains(text(), `${orderId}`)]";
const VALIDATE_ORDER_TYPE = "//p[contains(text(), `$[orderType]`)]";
let orderId1 = '';
let orderId = '';
const ELEMENT_TIMEOUT = 20000;


class StockTransferHomePage {
  static clickOnNext() {
    cy.log('Click on Next button');
    cy.xpath(NEXT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static clickOnSubmit() {
    cy.log('Click on submit button');
    cy.intercept('POST', 'api/oms/v2/orders').as('submitOrder');
    cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click({ force: true });
    cy.wait('@submitOrder');
  }

  static selectSUBDIST1AsBuyer(buyerID) {
    cy.log('Select reseller Id');
    const BUYER = SELECT_BUYER.replace('SUBDIST1-1', buyerID);
    cy.xpath(BUYER, { timeout: ELEMENT_TIMEOUT }).click({ force: true });
  }

  static getOrderId() {
    cy.log('Store order Id in a variable');
    cy.xpath(GET_ORDER_ID, { timeout: ELEMENT_TIMEOUT }).invoke('text').then((text) => {
      cy.log(text);
      orderId1 = text.split('[')[1];
      orderId = orderId1.split(']')[0];
      console.log(orderId);
    });
  }

  static clickOnClose() {
    cy.log('Click on close button');
    cy.xpath(CLOSE_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static enterOrderID() {
    cy.log('Enter order Id in reversal order page');
    cy.wait(500);
    cy.xpath(SEARCH_ORDER_ID, { timeout: ELEMENT_TIMEOUT }).clear().type(orderId);
  }

  static selectProductSKU(productSKU) {
    cy.log('Select product SKU');
    cy.log(productSKU);
    if (productSKU !== '') {
      cy.xpath(SELECT_PRODUCT_SKU_FIELD, { timeout: ELEMENT_TIMEOUT }).type(productSKU);
      cy.xpath(SELECT_PRODUCT_SKU_FIELD, { timeout: ELEMENT_TIMEOUT }).type('{downArrow}').type('{downArrow}').type('{enter}');
    }
  }

  static enterQuantityAndAddToCart(quantity) {
    cy.log('Enter quantity and click on add to cart button');
    cy.log(quantity);
    cy.xpath(QUANTITY_FIELD, { timeout: ELEMENT_TIMEOUT }).should('be.visible').clear().type(quantity);
    cy.xpath(ADD_TO_CART_FIELD, { timeout: ELEMENT_TIMEOUT }).should('be.visible').click();
  }

  static storeOrderIdForIPOST() {
    cy.xpath(MESSAGE_ALERT, { timeout: ELEMENT_TIMEOUT }).invoke('text').then((text) => {
      cy.log(text);
      orderId1 = text.split('[')[1];
      orderId = orderId1.split(']')[0];
      cy.log(orderId);
    });
  }

  static selectBuyer() {
    cy.xpath(SELECT_BUYER_ID, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static searchResellerID(SELLER_ID) {
    cy.log('Search reseller id');
    cy.xpath(SEARCH_RESELLER_ID, { timeout: ELEMENT_TIMEOUT }).clear().type(SELLER_ID);
    cy.xpath(SEARCH_BUTTON, { timeout: ELEMENT_TIMEOUT }).should('be.visible').click();
  }

  static enterAdditionalInfo() {
    cy.log('Now entering the additional info POReference');
    cy.xpath(CLICK_ADDITIONAL_INFORMATION, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath(CLICK_SENDERPIN, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
    cy.xpath(ENTER_SENDERPIN_VALUE, { timeout: ELEMENT_TIMEOUT }).type("1234");
    cy.wait(200);
    cy.xpath(CLICK_PLUS_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
    cy.xpath(CLICK_SUBMIT, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static fillFilterValue() {
    cy.log('Enter orderId in the field');
    cy.log(orderId);
    cy.wait(1000);
    cy.xpath(FILTER_VALUE, { timeout: ELEMENT_TIMEOUT }).clear().type(orderId);
  }

  static enterOrderId() {
    cy.log('Enter orderId in the field');
    cy.log(orderId);
    cy.wait(1000);
    cy.xpath(ENTER_ORDER_ID, { timeout: ELEMENT_TIMEOUT }).clear().type(orderId);
    // cy.xpath(FILTER_VALUE).clear().type(orderId);
  }

  static validateOrderDetails(orderType) {
    cy.log('Validate order details');
    cy.xpath(`//p[contains(text(), "${orderId}")]`, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
    cy.xpath(`//p[contains(text(), "${orderType}")]`, { timeout: ELEMENT_TIMEOUT }).should('be.visible');
  }

}


export default StockTransferHomePage;
