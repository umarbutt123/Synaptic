/// <reference types="cypress" />
// eslint-disable-next-line import/no-extraneous-dependencies

import URL_PATH from "../../../common/Route";

const CREATE_REGION_BUTTON = "//span[text()='Create Region']";
const REGION_LEVEL = "//select[@id = 'region-level-dropdown']";
const PARENT_REGION_NAME = "//select[@id='parent-region-name-dropdown']";
const REGION_ID = "//*[@id='region-id-input-box']";
const REGION_NAME = "//*[@id='region-name-input-box']";
const DATA = "//*[@id='region-data-input-box']";
const LOCATION = "//*[@id='region-location-input-box']";
const DISTRIBUTOR = "//*[@id='region-distributor-input-box']";
const OVA_ACCOUNT = "//*[@id='region-ova-account-input-box']";
const CLUSTER = "//*[@id='region-cluster-input-box']";
const RESET_BUTTON = "//span[text()='Reset']";
const SUBMIT_BUTTON = "//span[text()='Submit']";
const BULK_UPLOAD_BUTTON = "//span[text()='Bulk Upload']";
const SEARCH_BUTTON = "//span[text()='Search']";
const SEARCH_REGION_ID = "//*[@id='region-search-region-id-input-box']";
const SEARCH_REGION_NAME = "//*[@id='region-advanced-search-region-name-input-box']";
const SEARCH_PARENT_REGION_NAME = "//*[@id='region-search-parent-region-input-box']";
const SEARCH_REGION_TYPE = "//select[@id='region-advanced-search-region-type-dropdown']";
const RESET_SEARCH_BUTTON = "//span[text()='Reset Search']";
const VERIFY_REGION_ID = "//div[@data-rowindex='0' and @data-field='id']";
const VERIFY_REGION_NAME = "//div[@data-rowindex='0' and @data-field='regionName']";
const VERIFY_REGION_TYPE = "//div[@data-rowindex='0' and @data-field='regionType']";
const VERIFY_PARENT_REGION_NAME = "//div[@data-rowindex='0' and @data-field='parentRegionName']";
const VERIFY_REGION_PATH = "//div[@data-rowindex='0' and @data-field='path']";
const VIEW_REGION_LEVEL = "//*[@id='view-region-level-name-value-typography']";
const VIEW_PARENT_REGION_NAME = "//*[@id='view-parent-region-name-value-typography']";
const VIEW_REGION_ID = "//*[@id='view-region-id-value-typography']";
const VIEW_REGION_NAME = "//*[@id='view-region-name-value-typography']";
const VIEW_DATA = "//*[@id='view-region-data-value-typography']";
const VIEW_LOCATION = "//*[@id='view-region-location-value-typography']";
const VIEW_DISTRIBUTOR = "//*[@id='view-region-distributor-value-typography']";
const VIEW_OVA_ACCOUNT = "//*[@id='view-region-ovaAccount-value-typography']";
const VIEW_CLUSTER = "//*[@id='view-region-cluster-value-typography']";
const VIEW_REGION_PATH = "//*[@id='view-region-path-value-typography']";
const BACK_BUTTON = "//span[text()='Back']";
const VIEW_REGION_BUTTON = "//*[@id='region-list-view-button-0']";
const DELETE_REGION_BUTTON = "//*[@id='region-list-delete-button-0']";
const REGION_NO_CONFRIMATION_BUTTON = "//*[@id='region-no-confirmation-button']";
const REGION_YES_CONFIRMATION_BUTTON = "//*[@id='region-yes-confirmation-button']";
const LEFT_NAV_BAR = "//*[@id='sidebar-label']";

const ELEMENT_TIMEOUT = 20000;

class RegionsHomePage {
  static navigateToRegionsPageUsingURL() {
    cy.log("Navigate to regions page");
    cy.intercept("GET", "api/rgms/v1/regionType/").as("regionTypes");
    cy.visit(URL_PATH.regions);
    cy.wait(['@regionTypes']);
  }

  static clickCreateRegionButton() {
    cy.log('click on create region button');
    cy.xpath(CREATE_REGION_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
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

  static clickBackButton() {
    cy.log('click on back button');
    cy.xpath(BACK_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static verifyRegionNodeNotAvailable(node) {
    cy.log('verify region node not available in left navigation bar');
    cy.xpath(LEFT_NAV_BAR, { timeout: ELEMENT_TIMEOUT }).should('not.have.text', node);
  }

  static selectRegionLevel(regionLevel) {
    cy.log('enter region level');
    if (regionLevel !== "") {
      cy.xpath(REGION_LEVEL, { timeout: ELEMENT_TIMEOUT }).select(regionLevel);
    }
  }

  static selectParentRegionName(parentRegionName) {
    cy.log('enter parent region name');
    if (parentRegionName !== "") {
      cy.xpath(PARENT_REGION_NAME, { timeout: ELEMENT_TIMEOUT }).select(parentRegionName);
    }
  }

  static enterRegionID(regionID) {
    cy.log('enter region level');
    if (regionID !== "") {
      cy.xpath(REGION_ID, { timeout: ELEMENT_TIMEOUT }).clear().type(regionID);
    }
  }

  static enterRegionName(regionName) {
    cy.log('enter region name');
    if (regionName !== "") {
      cy.xpath(REGION_NAME, { timeout: ELEMENT_TIMEOUT }).clear().type(regionName);
    }
  }

  static enterData(data) {
    cy.log('enter data');
    if (data !== "") {
      cy.xpath(DATA, { timeout: ELEMENT_TIMEOUT }).clear().type(data);
    }
  }

  static enterLocation(location) {
    cy.log('enter location');
    if (location !== "") {
      cy.xpath(LOCATION, { timeout: ELEMENT_TIMEOUT }).clear().type(location);
    }
  }

  static enterDistributor(distributor) {
    cy.log('enter distributor');
    if (distributor !== "") {
      cy.xpath(DISTRIBUTOR, { timeout: ELEMENT_TIMEOUT }).clear().type(distributor);
    }
  }

  static enterOVAAccount(ovaAccount) {
    cy.log('enter ovaAccount');
    if (ovaAccount !== "") {
      cy.xpath(OVA_ACCOUNT, { timeout: ELEMENT_TIMEOUT }).clear().type(ovaAccount);
    }
  }

  static enterCluster(cluster) {
    cy.log('enter cluster');
    if (cluster !== "") {
      cy.xpath(CLUSTER, { timeout: ELEMENT_TIMEOUT }).clear().type(cluster);
    }
  }

  static clickBulkUploadButton() {
    cy.log('click on bulk upload button');
    cy.xpath(BULK_UPLOAD_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickSearchButton() {
    cy.log('click on search button');
    cy.intercept("GET", "/api/rgms/v1/region/allRegions/*").as("searchRegion");
    cy.xpath(SEARCH_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait("@searchRegion");
    // cy.wait(200);
  }

  static clickResetSearchButton() {
    cy.log('click on reset search button');
    cy.xpath(RESET_SEARCH_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static selectRegionTypeInAdvanceSearch(regionType) {
    cy.log('enter region type in advance search');
    if (regionType !== "") {
      cy.xpath(SEARCH_REGION_TYPE, { timeout: ELEMENT_TIMEOUT }).select(regionType);
    }
  }

  static enterParentRegionNameInAdvanceSearch(parentRegionName) {
    cy.log('enter parent region name in advance search');
    if (parentRegionName !== "") {
      cy.xpath(SEARCH_PARENT_REGION_NAME, { timeout: ELEMENT_TIMEOUT }).clear().type(parentRegionName);
    }
  }

  static enterRegionIDInAdvanceSearch(regionID) {
    cy.log('enter region level in advance search');
    if (regionID !== "") {
      cy.xpath(SEARCH_REGION_ID, { timeout: ELEMENT_TIMEOUT }).clear().type(regionID);
    }
  }

  static enterRegionNameInAdvanceSearch(regionName) {
    cy.log('enter region name in advance search');
    if (regionName !== "") {
      cy.xpath(SEARCH_REGION_NAME, { timeout: ELEMENT_TIMEOUT }).clear().type(regionName);
    }
  }

  static verifyDataInRegionGrid(regionID, regionName, regionType, parentRegionName) {
    this.verifyRegionID(regionID);
    this.verifyRegionName(regionName);
    this.verifyRegionType(regionType);
    this.verifyParentRegionName(parentRegionName);
    //cy.xpath(VERIFY_REGION_PATH, {timeout: ELEMENT_TIMEOUT}).should('have.length', 1);
  }

  static verifyDataOnViewPage(regionID, regionName, regionType, parentRegionName, data, location) {
    if (regionID !== "") {
      cy.xpath(VIEW_REGION_ID, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const id = table.text();
        cy.log('Region ID - ' + id);
        expect(id).equal(regionID);
      });
    }
    if (regionName !== "") {
      cy.xpath(VIEW_REGION_NAME, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const name = table.text();
        cy.log('Region Name - ' + name);
        expect(name).equal(regionName);
      });
    }
    if (regionType !== "") {
      cy.xpath(VIEW_REGION_LEVEL, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const type = table.text();
        cy.log('Region Type - ' + type);
        expect(type).equal(regionType);
      });
    }
    if (parentRegionName !== "") {
      cy.xpath(VIEW_PARENT_REGION_NAME, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const parentRegion = table.text();
        cy.log('Parent Region Name - ' + parentRegion);
        expect(parentRegion).equal(parentRegionName);
      });
    }
    if (data !== "") {
      cy.xpath(VIEW_DATA, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const regionData = table.text();
        cy.log('Region Data - ' + regionData);
        expect(regionData).equal(data);
      });
    }
    if (location !== "") {
      cy.xpath(VIEW_LOCATION, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const regionLoc = table.text();
        cy.log('Region Location - ' + regionLoc);
        expect(regionLoc).equal(location);
      });
    }
    cy.xpath(VIEW_REGION_PATH, { timeout: ELEMENT_TIMEOUT }).should('have.length', 1);
  }

  static verifyRegionID(regionID) {
    if (regionID !== "") {
      cy.xpath(VERIFY_REGION_ID, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const id = table.text();
        cy.log('Region ID - ' + id);
        expect(id).equal(regionID);
      });
    }
  }

  static verifyRegionName(regionName) {
    if (regionName !== "") {
      cy.xpath(VERIFY_REGION_NAME, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const name = table.text();
        cy.log('Region Name - ' + name);
        expect(name).equal(regionName);
      });
    }
  }

  static verifyRegionType(regionType) {
    if (regionType !== "") {
      cy.xpath(VERIFY_REGION_TYPE, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const type = table.text();
        cy.log('Region Type - ' + type);
        expect(type).equal(regionType);
      });
    }
  }

  static verifyParentRegionName(parentRegionName) {
    if (parentRegionName !== "") {
      cy.xpath(VERIFY_PARENT_REGION_NAME, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const parentRegion = table.text();
        cy.log('Parent Region Name - ' + parentRegion);
        expect(parentRegion).equal(parentRegionName);
      });
    }
  }

  static verifyDistributorOnViewPage(distributor) {
    if (distributor !== "") {
      cy.xpath(VIEW_DISTRIBUTOR, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const dis = table.text();
        cy.log('Region Distributor - ' + dis);
        expect(dis).equal(distributor);
      });
    }
  }

  static verifyOVAAccountOnViewPage(ovaAccount) {
    if (ovaAccount !== "") {
      cy.xpath(VIEW_OVA_ACCOUNT, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const ova = table.text();
        cy.log('Region OVA Account - ' + ova);
        expect(ova).equal(ovaAccount);
      });
    }
  }

  static verifyClusterOnViewPage(cluster) {
    if (cluster !== "") {
      cy.xpath(VIEW_CLUSTER, { timeout: ELEMENT_TIMEOUT }).then((table) => {
        const cls = table.text();
        cy.log('Region Cluster - ' + cls);
        expect(cls).equal(cluster);
      });
    }
  }

  static clickViewRegionButton() {
    cy.log('click on view region button');
    cy.xpath(VIEW_REGION_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickDeleteRegionButton() {
    cy.log('click on delete region button');
    cy.xpath(DELETE_REGION_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickDeleteNoRegionButton() {
    cy.log('click on delete No region button');
    cy.xpath(REGION_NO_CONFRIMATION_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

  static clickDeleteYesRegionButton() {
    cy.log('click on delete Yes region button');
    cy.xpath(REGION_YES_CONFIRMATION_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
    cy.wait(200);
  }

}

export default RegionsHomePage;
