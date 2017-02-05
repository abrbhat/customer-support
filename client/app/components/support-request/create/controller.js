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
                                                 'SupportRequest', 'User',
                                                function ($scope, $state,
                                                SupportRequest, User){
  $scope.currentUser = User.current;

  $scope.submitSupportRequest = function(form){
    console.log("here1");
    console.log(form);

    var postData = {
      'support_request': form
    };

    SupportRequest.remote.save({}, postData).$promise
    .then(function(createdSupportRequest){
      $state.go('supportRequest-view', {id: createdSupportRequest['id']});
    });
  };
}]);
