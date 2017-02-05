'use strict';

describe('Controller: UserLoginController', function () {

  // load the controller's module
  beforeEach(module('crossoverCustomerSupportApp'));

  var UserLoginController,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    UserLoginController = $controller('UserLoginController', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should be defined', function () {
    expect(UserLoginController).toBeDefined();
  });
});
