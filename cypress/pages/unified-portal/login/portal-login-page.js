
const USER_ID_FIELD = "//input[@id='userId']";
const PASSWORD_BUTTON = "//input[@id='password']";
const SUBMIT_BUTTON = "(//span[contains(text(),'Login')])[1]";
const LOGIN_BUTTON = "(//span[contains(text(),'Login')])[2]";
const NEXT_BUTTON = 'span:contains("Next")';
const LOGIN_TYPE = "//div[@id = 'login-option-dropdown']";
const ELEMENT_TIMEOUT = 30000;

class PortalLoginPage {
  static visit() {
    cy.log('Opening portal');
    cy.openPortal();
  }

  static login(username, password) {
    cy.wait(1000);
    cy.get('body').then((body) => {
      if (body.find(NEXT_BUTTON).length > 0) {
        cy.intercept("POST", "auth/v2/verify-user").as("verifyUser");
        cy.xpath(USER_ID_FIELD, { timeout: ELEMENT_TIMEOUT }).clear().type(username);
        cy.get(NEXT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
        cy.wait("@verifyUser");
        cy.wait(3000);
        cy.xpath(PASSWORD_BUTTON, { timeout: ELEMENT_TIMEOUT }).clear().type(password);
        cy.intercept("POST", "login-backend").as("loginBackend");
        cy.intercept("GET", "api/access/v1/features/resellerType/**").as("getFeatures");
        cy.intercept("POST", "api/dms/auth/getResellerInfo").as("getResellerInfo");
        cy.intercept("GET", "api/bi-engine/v1/metadata**").as("getBiMetadata");
        cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
        cy.wait(["@loginBackend", "@getFeatures", "@getResellerInfo", "@getBiMetadata"]);
      } else {
        cy.login(USER_ID_FIELD, username, PASSWORD_BUTTON, password, SUBMIT_BUTTON);
      }
    });
  }

  static loginWithouBICall(username, password) {
    cy.wait(900);
    cy.get('body').then((body) => {
      if (body.find(NEXT_BUTTON).length > 0) {
        cy.intercept("POST", "auth/v2/verify-user").as("verifyUser");
        cy.xpath(USER_ID_FIELD, { timeout: ELEMENT_TIMEOUT }).clear().type(username);
        cy.get(NEXT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
        cy.wait("@verifyUser");
        cy.wait(2000);
        cy.xpath(PASSWORD_BUTTON, { timeout: ELEMENT_TIMEOUT }).clear().type(password);
        cy.intercept("POST", "login-backend").as("loginBackend");
        cy.intercept("GET", "api/access/v1/features/resellerType/**").as("getFeatures");
        cy.intercept("POST", "api/dms/auth/getResellerInfo").as("getResellerInfo");
        cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
        cy.wait(["@loginBackend", "@getFeatures", "@getResellerInfo"]);
      } else {
        cy.loginWithouBICall(USER_ID_FIELD, username, PASSWORD_BUTTON, password, SUBMIT_BUTTON);
      }
    });
  }

  static loginWithBlockedUser(username, password) {
    cy.log(`username ${username}passowrd${password}`);
    cy.wait(900);
    cy.xpath('//body').then((body) => {
      if (body.find(NEXT_BUTTON).length > 0) {
        cy.xpath(USER_ID_FIELD).clear().type(username);
        cy.get(NEXT_BUTTON).click();
        cy.xpath(PASSWORD_BUTTON).clear().type(password);
        cy.xpath(SUBMIT_BUTTON).click();
      } else {
        cy.xpath(USER_ID_FIELD, { timeout: ELEMENT_TIMEOUT }).type(username);
        cy.xpath(PASSWORD_BUTTON, { timeout: ELEMENT_TIMEOUT }).type(password);
        cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
      }
    });
  }

  static loginWithMSISDN(username, password) {
    cy.log('login with blocked user', username, password);
    if (username != "" && password != "") {
      cy.xpath(USER_ID_FIELD).clear().type(username);
      cy.xpath(PASSWORD_BUTTON).clear().type(password, { log: false });
    }
    cy.xpath(LOGIN_BUTTON).click();
    cy.wait(1000);
  }

  static loginWithInvalidMSISDN(username, password) {
    cy.log('login with blocked user', username, password);
    if (username != "" && password != "") {
      cy.xpath(USER_ID_FIELD).clear().type(username);
      cy.xpath(PASSWORD_BUTTON).clear().type(password, { log: false });
    }
    cy.xpath(LOGIN_BUTTON).click();
  }

  static loginWithInValidUser(username, password) {
    cy.log(`username ${username}`);
    cy.wait(900);
    cy.xpath('//body').then((body) => {
      if (body.find(NEXT_BUTTON).length > 0) {
        cy.xpath(USER_ID_FIELD).clear().type(username);
        cy.get(NEXT_BUTTON).click();
      } else {
        cy.xpath(USER_ID_FIELD, { timeout: ELEMENT_TIMEOUT }).type(username);
        cy.xpath(PASSWORD_BUTTON, { timeout: ELEMENT_TIMEOUT }).type(password);
        cy.xpath(SUBMIT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
      }
    });
  }

  static loginWithInValidPassword(username, password) {
    cy.wait(2000);
    cy.xpath('//body').then((body) => {
      if (body.find(NEXT_BUTTON).length > 0) {
        cy.xpath(USER_ID_FIELD).clear().type(username);
        cy.get(NEXT_BUTTON).click();
        cy.xpath(PASSWORD_BUTTON).clear().type(password);
        cy.xpath(SUBMIT_BUTTON).click();
      } else {
        // cy.login(USER_ID_FIELD, username, PASSWORD_BUTTON, password, SUBMIT_BUTTON);
        cy.xpath(USER_ID_FIELD, { timeout: ELEMENT_TIMEOUT })
          .should('be.visible')
          .clear()
          .type(username);
        cy.xpath(PASSWORD_BUTTON, { timeout: ELEMENT_TIMEOUT })
          .should('be.visible')
          .clear()
          .type(password);
        cy.xpath(SUBMIT_BUTTON).click();
      }
    });
  }

  static loginWithBlankUser(username) {
    cy.wait(3000);
    cy.xpath('//body').then((body) => {
      if (body.find(NEXT_BUTTON, { timeout: ELEMENT_TIMEOUT }).length > 0) {
        cy.get(NEXT_BUTTON, { timeout: ELEMENT_TIMEOUT }).click();
      } else {
        cy.xpath(SUBMIT_BUTTON).click();
      }
    });
  }

  static loginCredentials(userName, password) {
    if (userName != "") {
      cy.xpath(USER_ID_FIELD).clear().type(userName);
    }
    if (password != "") {
      cy.xpath(PASSWORD_BUTTON).clear().type(password);
    }
    cy.xpath(SUBMIT_BUTTON).click();
    cy.wait(900);
  }

  static selectTypeBasedAuth(loginType) {
    cy.log("select login type");
    cy.xpath(LOGIN_TYPE, { timeout: ELEMENT_TIMEOUT }).click();
    cy.xpath(`//li[@data-value='${loginType}']`, { timeout: ELEMENT_TIMEOUT }).click();
  }
}

export default PortalLoginPage;
