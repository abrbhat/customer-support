'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:SupportRequestCreateController
 * @description
 * # SupportRequestCreateController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('SupportRequestCreateController', ['$scope', '$state', '$filter',
                                                 'SupportRequest',
                                                  function ($scope, $state, $filter,
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
      var errorData = error.data;
      var errorField = Object.keys(errorData)[0];
      var errorText = errorData[errorField][0];

      $scope.error = $filter('capitalize')(errorField) + " " + errorText;
    });
  };
}]);
