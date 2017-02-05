'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:UserLoginController
 * @description
 * # UserLoginController
 * Controller of the crossoverCustomerSupportApp
 */
angular.module('crossoverCustomerSupportApp')
  .controller('UserLoginController', ['$scope','$state', 'User',
                                     function ($scope, $state, User) {
    if(User.current){ $state.go('supportRequest-list'); }

    $scope.$on('auth:login-error', function(event, reason) {
      $scope.error = reason.errors[0];
    });
}]);
