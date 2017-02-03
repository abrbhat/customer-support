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

  it('should attach a list of awesomeThings to the scope', function () {
    expect(SupportRequestCtrl.awesomeThings.length).toBe(3);
  });
});
