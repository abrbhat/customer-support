'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:SupportRequestListController
 * @description
 * # SupportRequestListController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('SupportRequestListController', ['$scope', 'SupportRequest',
                                    function ($scope, SupportRequest){
  SupportRequest.get().$promise
  .then(function(response){
    $scope.supportRequests = response['support_requests'];
  });
}]);
