'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:AdminCreateController
 * @description
 * # AdminCreateController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('AdminCreateController', ['$scope', '$state', 'Admin',
                                        function ($scope, $state, Admin){

  $scope.submitAdminForm = function(form){
    var postData = {
      'admin': form
    };

    Admin.remote.save({}, postData).$promise
    .then(function(createdAdmin){
      $state.go('admin-view', {id: createdAdmin['id']});
    });
  };
}]);
