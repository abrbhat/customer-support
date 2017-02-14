'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:UserLoginController
 * @description
 * # UserLoginController
 * Controller of the customerSupportApp
 */
angular.module('customerSupportApp')
  .controller('UserLoginController', ['$scope', function ($scope) {
    /**
     * Sets $scope.error on receiving login error broadcast
     */
    $scope.$on('auth:login-error', function(event, reason) {
      $scope.error = reason.errors[0];
    });
}]);
