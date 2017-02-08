'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:UserLoginController
 * @description
 * # UserLoginController
 * Controller of the crossoverCustomerSupportApp
 */
angular.module('crossoverCustomerSupportApp')
  .controller('UserLoginController', ['$scope', function ($scope) {
    $scope.$on('auth:login-error', function(event, reason) {
      $scope.error = reason.errors[0];
    });
}]);
