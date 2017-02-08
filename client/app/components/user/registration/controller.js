'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:UserRegistrationController
 * @description
 * # UserRegistrationController
 * Controller of the crossoverCustomerSupportApp
 */
angular.module('crossoverCustomerSupportApp')
  .controller('UserRegistrationController', ['$scope', '$auth',
                                        function ($scope, $auth) {
    $scope.handleRegistrationButtonClick = function() {
      $auth.submitRegistration($scope.registrationForm)
      .then(function() {
        $auth.submitLogin({
          email: $scope.registrationForm.email,
          password: $scope.registrationForm.password
        });
      });
    };

    /**
     * Sets $scope.error on receiving registration error broadcast
     */
    $scope.$on('auth:registration-email-error', function(ev, reason) {
      $scope.error = reason.errors["full_messages"][0];
    });
  }]);
