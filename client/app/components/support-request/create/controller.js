'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:SupportRequestCreateController
 * @description
 * # SupportRequestCreateController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('SupportRequestCreateController', ['$scope', '$state',
                                                 'SupportRequest',
                                                  function ($scope, $state,
                                                  SupportRequest){
  /**
   * [submitSupportRequest Submit support request form to server]
   * @param  {Object} form Submit form data
   */
  $scope.submitSupportRequest = function(form){
    var postData = {
      'support_request': form
    };

    SupportRequest.remote.save({}, postData).$promise
    .then(function(createdSupportRequest){
      // Makes state go to support request detail view after successful creation
      $state.go('supportRequest-view', {id: createdSupportRequest['id']});
    })
    .catch(function(error){
      window.alert('Error ' + error);
    });
  };
}]);
