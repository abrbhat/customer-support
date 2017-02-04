'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:UserSessionsCtrl
 * @description
 * # UserSessionsCtrl
 * Controller of the crossoverCustomerSupportApp
 */
angular.module('crossoverCustomerSupportApp')
  .controller('UserSessionsCtrl', ['$scope', function ($scope) {
    $scope.$on('auth:login-error', function(ev, reason) {
      $scope.error = reason.errors[0];
    });
}]);
