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
                                      'Admin', 'User',
                                    function ($scope, $state, Admin,
                                              User){
  $scope.currentUser = User.current;

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
