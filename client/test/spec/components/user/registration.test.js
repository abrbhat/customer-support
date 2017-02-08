'use strict';

describe('Controller: UserRegistrationController', function () {

  // load the controller's module
  beforeEach(module('crossoverCustomerSupportApp'));

  var UserRegistrationController,
      $q,
      scope,
      auth;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, _$q_, $rootScope, _$auth_) {
    $q = _$q_;
    scope = $rootScope.$new();
    auth = _$auth_;

    UserRegistrationController = $controller('UserRegistrationController', {
      $scope: scope,
      $auth: _$auth_
    });
  }));

  it('should be defined', function () {
    expect(UserRegistrationController).toBeDefined();
  });

  it('should added error to scope.error on login error', function () {
    scope.error = null;

    scope.$broadcast('auth:registration-email-error', {
      errors: {
        full_messages: ['Invalid Password']
      }
    });

    expect(scope.error).toBeDefined();
    expect(scope.error).toEqual('Invalid Password');
  });

  describe('handleRegistrationButtonClick', function() {
    beforeEach(function(){
      auth.submitRegistration = jasmine.createSpy().and.callFake(function(){
        return $q.when();
      });

      auth.submitLogin = jasmine.createSpy().and.callFake(function(){
        return $q.when();
      });
    });
    it('should be defined', function(){
      expect(scope.handleRegistrationButtonClick).toBeDefined();
    });
    it('should call $auth.submitRegistration with registrationForm', function(){
      var mockRegistrationForm = {
        email: 'customer@test.com',
        password: 'password'
      };

      scope.registrationForm = mockRegistrationForm;

      scope.handleRegistrationButtonClick();

      expect(auth.submitRegistration).toHaveBeenCalledWith(mockRegistrationForm);
    });
    it('should call $auth.submitLogin after resolving $auth.submitRegistration',
      function(){
      var mockRegistrationForm = {
        email: 'customer@test.com',
        password: 'password'
      };

      scope.registrationForm = mockRegistrationForm;

      scope.handleRegistrationButtonClick();

      scope.$digest();

      expect(auth.submitLogin).toHaveBeenCalledWith(mockRegistrationForm);
    });
  });
});
