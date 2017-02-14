'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:SupportRequestViewController
 * @description
 * # SupportRequestViewController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('SupportRequestViewController', ['$scope', '$stateParams', '$state',
                                               'SupportRequest',
                                      function ($scope, $stateParams, $state,
                                                SupportRequest){

  var urlParams = {id: $stateParams.id};
/**
 * Gets support request details from server
 */
  SupportRequest.remote.get(urlParams).$promise
  .then(function(supportRequest){
    $scope.supportRequest = supportRequest;
  });

  /**
   * [closeSupportRequest Closes the current support request]
   */
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
    })
    .catch(function(error){
      window.alert('Error ' + error);
    });
  };

  /**
   * [reopenSupportRequest Reopens the support request]
   */
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
    })
    .catch(function(error){
      window.alert('Error ' + error);
    });
  };
}]);
