'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:AdminViewController
 * @description
 * # AdminViewController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('AdminViewController', ['$scope', '$stateParams','$state', 'Admin',
                                      function ($scope, $stateParams, $state, Admin){

  var urlParams = {id: $stateParams.id};

  /**
   * Fetch admin details from remote api server
   */
  Admin.remote.get(urlParams).$promise
  .then(function(admin){
    $scope.admin = admin;
  });

  /**
   * [viewSupportRequest Makes state go to support request detail view]
   * @param  {Integer} supportRequestId Id of the support request to view
   */
  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };

  /**
   * [removeAdmin Removes an admin open confirmation]
   */
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
