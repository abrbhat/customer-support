'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:UserRegistrationsCtrl
 * @description
 * # UserRegistrationsCtrl
 * Controller of the crossoverCustomerSupportApp
 */
angular.module('crossoverCustomerSupportApp')
  .controller('UserRegistrationsCtrl', ['$scope', '$auth',
                                        function ($scope, $auth) {
    $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm)
      .then(function() {
        $auth.submitLogin({
          email: $scope.registrationForm.email,
          password: $scope.registrationForm.password
        });
      });
    };

    $scope.$on('auth:registration-email-error', function(ev, reason) {
      $scope.error = reason.errors["full_messages"][0];
    });
  }]);
