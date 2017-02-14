'use strict';

describe('Controller: UserLoginController', function () {

  // load the controller's module
  beforeEach(module('customerSupportApp'));

  var UserLoginController,
      scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    UserLoginController = $controller('UserLoginController', {
      $scope: scope
    });
  }));

  it('should be defined', function () {
    expect(UserLoginController).toBeDefined();
  });

  it('should added error to scope.error on login error', function () {
    scope.error = null;

    scope.$broadcast('auth:login-error', {errors: ['Invalid Password']});

    expect(scope.error).toBeDefined();
    expect(scope.error).toEqual('Invalid Password');
  });
});
