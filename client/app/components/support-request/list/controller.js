'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:SupportRequestListController
 * @description
 * # SupportRequestListController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('SupportRequestListController', ['$scope', '$state',
                                               'SupportRequest',
                                               function ($scope, $state,
                                               SupportRequest){  
  SupportRequest.remote.get().$promise
  .then(function(response){
    $scope.supportRequests = response['support_requests'];
  });

  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };

  $scope.createNewSupportRequest = function(){
    $state.go('supportRequest-create');
  };
}]);
