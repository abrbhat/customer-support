'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:ReportViewController
 * @description
 * # ReportViewController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('ReportViewController', ['$scope', '$state',
                                       'SupportRequest',
                                        function ($scope, $state,
                                        SupportRequest){
  SupportRequest.remote.get({report: 'true'}).$promise
  .then(function(response){
    $scope.supportRequests = response['support_requests'];
  });

  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };
}]);
