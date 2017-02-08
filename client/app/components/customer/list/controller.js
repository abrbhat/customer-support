'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:CustomerListController
 * @description
 * # CustomerListController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('CustomerListController', ['$scope', '$state',
                                         'Customer',
                                    function ($scope, $state, Customer){
  Customer.remote.get().$promise
  .then(function(response){
    $scope.customers = response['customers'];
  });

  $scope.viewCustomer = function(customerId){
    $state.go('customer-view', {id: customerId});
  };
}]);
