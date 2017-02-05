'use strict';

describe('Controller: SupportRequestListController', function () {

  // load the controller's module
  beforeEach(module('crossoverCustomerSupportApp'));

  var SupportRequestListController,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    SupportRequestListController = $controller('SupportRequestListController', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should be defined', function () {
    expect(SupportRequestListController).toBeDefined();
  });
});
