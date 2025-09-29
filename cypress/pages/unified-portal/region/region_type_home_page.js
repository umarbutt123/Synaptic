/// <reference types="cypress" />
// eslint-disable-next-line import/no-extraneous-dependencies

import URL_PATH from "../../../common/Route";

const CREATE_REGION_TYPE_BUTTON = "//span[text()='Create Region Type']";
const LEVEL = "//*[@id='region-type-level-input-box']";
const NAME = "//*[@id='region-type-name-input-box']";
const VERIFY_LEVEL = "//div[@data-rowindex='0' and @data-field='level']";
const VERIFY_REGION_TYPE_NAME = "//div[@data-rowindex='0' and @data-field='regionTypeName']";
const VIEW_REGION_TYPE_BUTTON = "//*[@id='region-type-view-button-0']";
const VIEW_LEVEL = "//*[@id='view-region-level-value-typography']";
const VIEW_REGION_TYPE_NAME = "//*[@id='view-region-type-name-value-typography']";
const BACK_BUTTON = "//span[text()='Back']";
const FILTERS_BUTTON = "//span[text()='Filters']";
const FILTERS_INPUT_FIELD = "//div[5]//input";
const RESET_BUTTON = "//span[text()='Reset']";
const SUBMIT_BUTTON = "//span[text()='Submit']";

const ELEMENT_TIMEOUT = 20000;

class RegionTypesHomePage {

  static navigateToRegionTypesPageUsingURL() {
    cy.log("Navigate to region types page");
    cy.intercept("GET", "api/rgms/v1/regionType/").as("regionTypes");
    cy.visit(URL_PATH.regionTypes);
    cy.wait(['@regionTypes']);
    // cy.wait(2000);
  }

  static clickCreateRegionTypeButton() {
    cy.log('click on create region button');
    cy.xpath(CREATE_REGION_TYPE_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
  }

  static enterLevel(level) {
    cy.log('enter region level');
    if (level !== "") {
      cy.xpath(LEVEL, { timeout: ELEMENT_TIMEOUT }).clear().type(level);
    }
  }

  static enterRegionTypeName(name) {
    cy.log('enter region type name');
    if (name !== "") {
      cy.xpath(NAME, { timeout: ELEMENT_TIMEOUT }).clear().type(name);
    }
  }

  static clickResetButton() {
    cy.log('click on reset button');
    cy.xpath(RESET_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickSubmitButton() {
    cy.log('click on submit button');
    cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickViewRegionTypeButton() {
    cy.log('click on view region type button');
    cy.xpath(VIEW_REGION_TYPE_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickBackButton() {
    cy.log('click on back button');
    cy.xpath(BACK_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickFiltersButton() {
    cy.log('click on filters button');
    cy.xpath(FILTERS_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static enterFilterValue(value) {
    cy.log('enter filter input value');
    if (value !== "") {
      cy.xpath(FILTERS_INPUT_FIELD, { timeout: ELEMENT_TIMEOUT }).clear().type(value);
    }
  }

  static verifyDataInTypeGrid(level, name) {
    if (level !== "") {
      cy.xpath(VERIFY_LEVEL, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const regionLevel = table.text();
        cy.log('Level - ' + regionLevel);
        expect(regionLevel).equal(level);
      });
    }
    if (name !== "") {
      cy.xpath(VERIFY_REGION_TYPE_NAME, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const regionTypeName = table.text();
        cy.log('Region Type Name - ' + regionTypeName);
        expect(regionTypeName).equal(name);
      });
    }
  }

  static verifyDataOnViewPage(level, name) {
    if (level !== "") {
      cy.xpath(VIEW_LEVEL, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const region_level = table.text();
        cy.log('Region Level - ' + region_level);
        expect(region_level).equal(level);
      });
    }
    if (name !== "") {
      cy.xpath(VIEW_REGION_TYPE_NAME, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const region_type_name = table.text();
        cy.log('Region Type Name - ' + region_type_name);
        expect(region_type_name).equal(name);
      });
    }
  }

}

export default RegionTypesHomePage;
