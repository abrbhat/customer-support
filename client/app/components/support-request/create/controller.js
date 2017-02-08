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
  $scope.submitSupportRequest = function(form){
    var postData = {
      'support_request': form
    };

    SupportRequest.remote.save({}, postData).$promise
    .then(function(createdSupportRequest){
      $state.go('supportRequest-view', {id: createdSupportRequest['id']});
    });
  };
}]);
