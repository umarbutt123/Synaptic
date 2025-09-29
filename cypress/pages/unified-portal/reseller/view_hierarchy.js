import URL_PATH from "../../../common/Route";

const PAGE_HEADER = "//h4[text() = 'Reseller Hierarchy']";
const HIERARCHY_CHART = "//div[@class='orgchart-container ']";

class ViewHierarchy {
  static navigateToViewHierarchyUsingUrl() {
    cy.log('Navigate to View hierarchy page');
    cy.intercept("GET", "api/dms/v1/resellers/resellerChildren/*").as("getResellerChildren")
    cy.visit(URL_PATH.view_hierarchy);
    cy.wait("@getResellerChildren")
  }

  static verifyViewHierarchyPage() {
    cy.log('verify page header');
    cy.xpath(PAGE_HEADER, { timeout: 20000 }).should('be.visible');
  }

  static verifyHierarchyChart() {
    cy.log('verify hierarchy chart');
    cy.xpath(HIERARCHY_CHART).should('be.visible');
  }
}
export default ViewHierarchy;
