'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:CustomerListController
 * @description
 * # CustomerListController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('CustomerListController', ['$scope', '$state',
                                         'Customer',
                                    function ($scope, $state, Customer){
  /**
   * Get list of customers from server and assign it to $scope.customers
   */
  Customer.remote.get().$promise
  .then(function(response){
    $scope.customers = response['customers'];
  });

  /**
   * [viewCustomer Makes state go to customer detail view]
   * @param  {Integer} customerId Customer Id
   */
  $scope.viewCustomer = function(customerId){
    $state.go('customer-view', {id: customerId});
  };
}]);
