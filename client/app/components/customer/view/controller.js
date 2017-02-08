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

  /**
   * Gets customer detail from server and assigns it to $scope.customer
   */
  Customer.remote.get(urlParams).$promise
  .then(function(customer){
    $scope.customer = customer;
  });

  /**
   * [viewSupportRequest Makes state go to support request detail view]
   * @param  {Integer} supportRequestId Support request id
   */
  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };
}]);
