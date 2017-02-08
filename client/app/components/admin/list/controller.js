'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:AdminListController
 * @description
 * # AdminListController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('AdminListController', ['$scope', '$state',
                                      'Admin',
                                    function ($scope, $state, Admin){
  Admin.remote.get().$promise
  .then(function(response){
    $scope.admins = response['admins'];
  });

  $scope.viewAdmin = function(adminId){
    $state.go('admin-view', {id: adminId});
  };

  $scope.createNewAdmin = function(){
    $state.go('admin-create');
  };
}]);
