'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:SupportRequestCtrl
 * @description
 * # SupportRequestCtrl
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('SupportRequestCtrl', ['$scope', 'SupportRequest',
                                    function ($scope, SupportRequest){
  SupportRequest.get().$promise
  .then(function(response){
    $scope.supportRequests = response['support_requests'];
  });
}]);
