import {
  When, And, Then,
} from "cypress-cucumber-preprocessor/steps";

import RegionsHomePage from '../../../pages/unified-portal/region/region_home_page';
import RegionTypesHomePage from '../../../pages/unified-portal/region/region_type_home_page';

before(() => {
  cy.loginWithSession("Operator", "2023");
});

When(/^I navigate to Region Types page$/, () => {
  RegionTypesHomePage.navigateToRegionTypesPageUsingURL();
  // cy.wait(1000);
});

When(/^I navigate to Regions page$/, () => {
  RegionsHomePage.navigateToRegionsPageUsingURL();
  // cy.wait(1000);
});

And(/^I perform Create Region Type having following parameters "([^"]*)" "([^"]*)"$/, (level, name) => {
  RegionTypesHomePage.clickCreateRegionTypeButton();
  RegionTypesHomePage.enterLevel(level);
  RegionTypesHomePage.enterRegionTypeName(name);
  RegionTypesHomePage.clickSubmitButton();
});

And(/^I validate that Region Type is available in search results "([^"]*)" "([^"]*)"$/, (regionLevel, regionTypeName) => {
  RegionTypesHomePage.clickFiltersButton();
  RegionTypesHomePage.enterFilterValue(regionLevel);
  cy.wait(500);
  RegionTypesHomePage.verifyDataInTypeGrid(regionLevel, regionTypeName);
});

When(/^I click on View Region Type button$/, () => {
  RegionTypesHomePage.clickViewRegionTypeButton();
  cy.wait(100);
});

Then(/^I validate that Region Type details are available on View Region Type page "([^"]*)" "([^"]*)"$/, (regionLevel, regionTypeName) => {
  RegionTypesHomePage.verifyDataOnViewPage(regionLevel, regionTypeName);
  RegionTypesHomePage.clickBackButton();
});

Then(/^I verify Region node is not available in left navigation bar "([^"]*)"$/, (node) => {
  RegionsHomePage.verifyRegionNodeNotAvailable(node);
});

And(/^I perform Create Region having following parameters "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (regionLevel, parentRegionName, regionID, regionName, data, location) => {
  RegionsHomePage.clickCreateRegionButton();
  RegionsHomePage.selectRegionLevel(regionLevel);
  RegionsHomePage.selectParentRegionName(parentRegionName);
  RegionsHomePage.enterRegionID(regionID);
  RegionsHomePage.enterRegionName(regionName);
  RegionsHomePage.enterData(data);
  RegionsHomePage.enterLocation(location);
  RegionsHomePage.clickSubmitButton();
});

And(/^I validate that Region is available in search results "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (regionID, regionName, regionType, parentRegionName) => {
  RegionsHomePage.enterRegionIDInAdvanceSearch(regionID);
  RegionsHomePage.clickSearchButton();
  cy.wait(200);
  RegionsHomePage.verifyDataInRegionGrid(regionID, regionName, regionType, parentRegionName);
});

And(/^I enter Region ID in Advance Search to filter Region "([^"]*)"$/, (regionID) => {
  RegionsHomePage.enterRegionIDInAdvanceSearch(regionID);
  RegionsHomePage.clickSearchButton();
  cy.wait(200);
});

And(/^I enter Region Name in Advance Search to filter Region "([^"]*)"$/, (regionName) => {
  RegionsHomePage.enterRegionNameInAdvanceSearch(regionName);
  RegionsHomePage.clickSearchButton();
  cy.wait(800);
});

And(/^I select Region Type in Advance Search to filter Region "([^"]*)"$/, (regionType) => {
  RegionsHomePage.selectRegionTypeInAdvanceSearch(regionType);
  RegionsHomePage.clickSearchButton();
  cy.wait(200);
});

And(/^I enter Parent Region Name in Advance Search to filter Region "([^"]*)"$/, (parentRegionName) => {
  RegionsHomePage.enterParentRegionNameInAdvanceSearch(parentRegionName);
  RegionsHomePage.clickSearchButton();
  cy.wait(200);
});

Then(/^Region ID should be available in the grid "([^"]*)"$/, (regionID) => {
  RegionsHomePage.verifyRegionID(regionID);
});

Then(/^Region Name should be available in the grid "([^"]*)"$/, (regionName) => {
  RegionsHomePage.verifyRegionName(regionName);
});

Then(/^Region Type should be available in the grid "([^"]*)"$/, (regionType) => {
  RegionsHomePage.verifyRegionType(regionType);
});

Then(/^Parent Region Name should be available in the grid "([^"]*)"$/, (parentRegionName) => {
  RegionsHomePage.verifyParentRegionName(parentRegionName);
});

When(/^I click on View Region button$/, () => {
  RegionsHomePage.clickViewRegionButton();
  cy.wait(100);
});

Then(/^I validate that Region details are available on View Region page "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (regionID, regionName, regionType, parentRegionName, data, location) => {
  cy.wait(1000);
  RegionsHomePage.verifyDataOnViewPage(regionID, regionName, regionType, parentRegionName, data, location);
  RegionsHomePage.clickBackButton();
  cy.wait(100);
});

And(/^I click on Delete Region button$/, () => {
  RegionsHomePage.clickDeleteRegionButton();
  cy.wait(100);
});

And(/^I click on Delete Region Yes Confirmation button$/, () => {
  RegionsHomePage.clickDeleteYesRegionButton();
  cy.wait(100);
});

When(/^I click on Reset Search button$/, () => {
  RegionsHomePage.clickResetSearchButton();
  cy.wait(500);
});