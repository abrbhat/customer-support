'use strict';

describe('Controller: SupportRequestCtrl', function () {

  // load the controller's module
  beforeEach(module('crossoverCustomerSupportApp'));

  var SupportRequestCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    SupportRequestCtrl = $controller('SupportRequestCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should be defined', function () {
    expect(SupportRequestCtrl).toBeDefined();
  });
});
