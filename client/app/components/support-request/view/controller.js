'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:SupportRequestViewController
 * @description
 * # SupportRequestViewController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('SupportRequestViewController', ['$scope', '$stateParams',
                                               'SupportRequest', 'User',
                                      function ($scope, $stateParams,
                                                SupportRequest, User){

  var urlParams = {id: $stateParams.id};

  $scope.currentUser = User.current;

  SupportRequest.remote.get(urlParams).$promise
  .then(function(supportRequest){
    $scope.supportRequest = supportRequest;
  });

  $scope.closeSupportRequest = function(){
    var urlParams = {
      id: $scope.supportRequest['id']
    };

    var postParams = {
      'support_request': {
        status: 'closed'
      }
    };

    SupportRequest.remote.update(urlParams, postParams).$promise
    .then(function(updatedSupportRequest){
      $scope.supportRequest = updatedSupportRequest;
    });
  };

  $scope.reopenSupportRequest = function(){
    var urlParams = {
      id: $scope.supportRequest['id']
    };

    var postParams = {
      'support_request': {
        status: 'open'
      }
    };

    SupportRequest.remote.update(urlParams, postParams).$promise
    .then(function(updatedSupportRequest){
      $scope.supportRequest = updatedSupportRequest;
    });
  };
}]);
