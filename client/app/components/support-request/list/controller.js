'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:SupportRequestListController
 * @description
 * # SupportRequestListController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('SupportRequestListController', ['$scope', '$state',
                                               'SupportRequest',
                                               function ($scope, $state,
                                               SupportRequest){
  /**
   * Get list of support requests from server
   */
  SupportRequest.remote.get().$promise
  .then(function(response){
    $scope.supportRequests = response['support_requests'];
  });

  /**
   * [viewSupportRequest Makes state go to support request detail view]
   * @param  {Integer} supportRequestId Support request id
   */
  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };

  /**
   * [viewReport Makes state go to report view]
   */
  $scope.viewReport = function(){
    $state.go('report-view');
  };

  /**
   * [createNewSupportRequest Makes state go to support request create view]
   */
  $scope.createNewSupportRequest = function(){
    $state.go('supportRequest-create');
  };
}]);
