/// <reference types="cypress" />
import URL_PATH from "../../../common/Route";
import CommonUtilities from "../../../common/Util";

const CONTRACT_LANDING_PAGE_HEADER_CSS = "h4";
const H2_HEADER_CSS = "h2";
const IMPORT_ID_INPUTBOX_CSS = "input[name='importId']";
const CONTRACT_NAME_INPUTBOX_CSS = "input[name='name']";
const RESELLERTYPE_DROPDOWN_CSS = "#resellerType-drop-down";
const CONTRACTSTATUS_DROPDOWN_CSS = "#contractStatus-drop-down";
const SEARCH_BUTTON_XPATH = "//button/span[text()='Search']";
const RESET_BUTTON_XPATH = "//button/span[text()='Reset Search']";

class ContractLandingPage {
  static visitContractPageUsingUrl() {
    cy.log('visit contract page');
    cy.intercept('GET', "api/acms/v2/contracts**").as('getContracts');
    cy.intercept('GET', "api/acms/v2/deferred-commission-spans").as('getDeferredCommissionSpans');
    cy.intercept('GET', "api/acms/country/").as('getCountry');
    cy.intercept('GET', "api/acms/reseller-type/").as('getResellerTypes');
    cy.visit(URL_PATH.contracts);
    cy.wait(['@getContracts', '@getDeferredCommissionSpans', '@getCountry', '@getResellerTypes']);
    cy.contains(CONTRACT_LANDING_PAGE_HEADER_CSS, "View and manage contracts", { timeout: 90000 })
      .should('be.visible');
  }

  static visitContractPageUsingUrlAndVerifyNotAuthorized() {
    cy.log('visit contract page');
    cy.visit(URL_PATH.contracts);
    cy.contains(H2_HEADER_CSS, " Not Authroized ", { timeout: 90000 })
      .should('be.visible');
  }

  static enterSearchValue(searchField, searchValue) {
    if (searchField == "status") {
      cy.get(`input[name='${searchField}']`, { timeout: 15000 })
        .should('be.visible')
        .select(searchValue);
    } else {
      cy.get(`input[name='${searchField}']`, { timeout: 15000 })
        .should('be.visible')
        .clear()
        .type(searchValue);
    }
  }

  static clickSearch() {
    cy.log("clicking on search");
    cy.intercept('GET', 'api/acms/v2/contracts*').as('searchContracts');
    cy.intercept('GET', 'api/acms/reseller-type/').as('resellerType');

    cy.xpath(SEARCH_BUTTON_XPATH, { timeout: 10000 })
      .should('be.visible')
      .click({ force: true });
    cy.wait(['@searchContracts', '@resellerType']);
  }
}

export default ContractLandingPage;
