'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:AdminListController
 * @description
 * # AdminListController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('AdminListController', ['$scope', '$state',
                                      'Admin',
                                    function ($scope, $state, Admin){
  /**
   * Fetch list of admins from remote api server
   * and assign to $scope.admins
   */
  Admin.remote.get().$promise
  .then(function(response){
    $scope.admins = response['admins'];
  });

  /**
   * [viewAdmin Makes state go to the admin detail view]
   * @param  {Integer} adminId Admin Id
   */
  $scope.viewAdmin = function(adminId){
    $state.go('admin-view', {id: adminId});
  };

  /**
   * Makes state go to admin create view
   */
  $scope.createNewAdmin = function(){
    $state.go('admin-create');
  };
}]);
