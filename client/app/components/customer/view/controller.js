'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:CustomerViewController
 * @description
 * # CustomerViewController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('CustomerViewController', ['$scope', '$stateParams', '$state',
                                         'Customer',
                                         function ($scope, $stateParams, $state,
                                         Customer){

  var urlParams = {id: $stateParams.id};

  Customer.remote.get(urlParams).$promise
  .then(function(customer){
    $scope.customer = customer;
  });

  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };
}]);
