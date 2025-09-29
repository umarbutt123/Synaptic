import {
  And, Then, When,
} from 'cypress-cucumber-preprocessor/steps';

import subscriberTopupMainPage from '../../../pages/unified-portal/transactions/subscriber-topup_main_page';
import searchTransactionMainPage from '../../../pages/unified-portal/transactions/search-transaction';

before(() => {
  cy.loginWithSession("Operator", "2023");
});


And(/^I navigate to hierarchy transaction page and verify search transaction page title visible$/, () => {
  searchTransactionMainPage.clickOnHierarchyTransactionUsingUrl();
  searchTransactionMainPage.verifySearchTransactionPageTitle();
});

And(/^I navigate to the airtime stock Page$/, () => {
  subscriberTopupMainPage.navigateAirtimeStockUsingUrl();
});

When(/^I provide "([^"]*)" "([^"]*)" and click on search button$/, (searchField, searchValue) => {
  searchTransactionMainPage.searchTransaction(searchField, searchValue);
  searchTransactionMainPage.clickOnSearch();
});

Then(/^I scroll to right$/, () => {
  searchTransactionMainPage.scrollRight();
});

Then(/^I scroll to right to specific position$/, () => {
  searchTransactionMainPage.scrollRightToSpecificPosition();
});

Then(/^I validate "([^"]*)" should be available in the grid$/, (data) => {
  // searchTransactionMainPage.scrollRight();
  searchTransactionMainPage.validateData(data);
});

And(/^I click reset button$/, () => {
  subscriberTopupMainPage.clickResetButton();
});

Then(/^I validate "([^"]*)" "([^"]*)" should be blank$/, (field, value) => {
  searchTransactionMainPage.shouldBeBlank(field, value);
});

And(/^I provide Date and click on search button$/, () => {
  searchTransactionMainPage.enterDate();
  searchTransactionMainPage.clickOnSearch();
});

And(/^I validate transaction should be available in the table$/, () => {
  searchTransactionMainPage.validateTransactionEntry();
});

Then(/^I validate "([^"]*)" should be available in the table$/, (data) => {
  searchTransactionMainPage.validateData(data);
});

Then(/^I validate element "([^"]*)" should be available in the table$/, (data) => {
  searchTransactionMainPage.validateElement(data);
});

Then(/^I scroll to the elements$/, () => {
  searchTransactionMainPage.scrollInTo();
});

Then(/^I scroll to center$/, () => {
  searchTransactionMainPage.scrollCenter();
});

Then(/^I scroll to bottom$/, () => {
  searchTransactionMainPage.scrollBottom();
});

Then(/^I scroll to the element$/, () => {
  searchTransactionMainPage.scrollTo();
});

When(/^I perform airtime stock transaction having following parameters "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (resellerId, amount, comments, msisdn) => {
  if (msisdn === "") {
    subscriberTopupMainPage.enterResellerId(resellerId);
  } else {
    subscriberTopupMainPage.clickMsisdnToggle();
    subscriberTopupMainPage.enterMsisdn(msisdn);
  }
  subscriberTopupMainPage.enterAmount(amount);
  subscriberTopupMainPage.enterComments(comments);
  subscriberTopupMainPage.clickSellAirtimeStock();
});

And(/^I validate and confirm the transaction "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (resellerId, amount, paymentMethod, comments) => {
  subscriberTopupMainPage.validateBeforeTransaction(resellerId, amount, paymentMethod, comments);
  subscriberTopupMainPage.clickConfirmButtonRequestTransfer();
});

Then(/^I validate the transaction "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (resellerId, amount, title, message) => {
  subscriberTopupMainPage.validateTransactionReceipt(resellerId, amount, title, message);
});

Then(/^I get the transaction reference number and close the transaction$/, () => {
  subscriberTopupMainPage.saveTransactionReference();
  subscriberTopupMainPage.closeTransactionScreen();
});

When(/^I provide transaction reference and click on search button$/, () => {
  subscriberTopupMainPage.searchWithTransactionReference();
  searchTransactionMainPage.clickOnSearch();
});

Then(/^I should able to verify these parameters "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/, (senderResellerId, receiverResellerId, receiverMSISDN, transactionType, product, amount, status) => {
  searchTransactionMainPage.scrollRight();
  searchTransactionMainPage.verifySenderResellerId(senderResellerId);
  searchTransactionMainPage.verifyReceiverResellerId(receiverResellerId);
  searchTransactionMainPage.verifyReceiverMSISDN(receiverMSISDN);
  searchTransactionMainPage.verifyTransactionType(transactionType);
  searchTransactionMainPage.verifyProduct(product);
  searchTransactionMainPage.verifyAmount(amount);
  searchTransactionMainPage.verifyStatus(status);
});
