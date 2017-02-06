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
                                         'Customer', 'User',
                                    function ($scope, $state, Customer,
                                              User){
  $scope.currentUser = User.current;

  Customer.remote.get().$promise
  .then(function(response){
    $scope.customers = response['customers'];
  });

  $scope.viewCustomer = function(customerId){
    $state.go('customer-view', {id: customerId});
  };
}]);
