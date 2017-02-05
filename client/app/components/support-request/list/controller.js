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
                                               'SupportRequest', 'User',
                                    function ($scope, $state, SupportRequest,
                                              User){
  $scope.currentUser = User.current;

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
