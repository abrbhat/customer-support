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
    /**
     * Sets $scope.error on receiving login error broadcast
     */
    $scope.$on('auth:login-error', function(event, reason) {
      $scope.error = reason.errors[0];
    });
}]);
