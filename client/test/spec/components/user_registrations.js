'use strict';

describe('Controller: UserRegistrationController', function () {

  // load the controller's module
  beforeEach(module('crossoverCustomerSupportApp'));

  var UserRegistrationController,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    UserRegistrationController = $controller('UserRegistrationController', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(UserRegistrationController.awesomeThings.length).toBe(3);
  });
});
