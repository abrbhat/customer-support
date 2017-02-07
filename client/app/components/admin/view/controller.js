'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:AdminViewController
 * @description
 * # AdminViewController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('AdminViewController', ['$scope', '$stateParams','$state', 'Admin',
                                      function ($scope, $stateParams, $state, Admin){

  var urlParams = {id: $stateParams.id};

  Admin.remote.get(urlParams).$promise
  .then(function(admin){
    $scope.admin = admin;
  });

  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };

  $scope.removeAdmin = function(){
    if(window.confirm("Are you sure?")){
      Admin.remote.remove({id: $scope.admin['id']}).$promise
      .then(function(){
        $state.go('admin-list');
      })
      .catch(function(error){
        window.alert('Cannot Delete Last Admin');
      });
    }
  };
}]);
