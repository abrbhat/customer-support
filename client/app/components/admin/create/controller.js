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
  /**
   * [submitAdminForm submits admin form to api serveer]
   * @param  {Object} form [form data]
   */
  $scope.submitAdminForm = function(form){
    var postData = {
      'admin': form
    };

    Admin.remote.save({}, postData).$promise
    .then(function(createdAdmin){
      /**
       * Go to admin view after creating the admin
       */
      $state.go('admin-view', {id: createdAdmin['id']});
    })
    .catch(function(error){
      window.alert('Error: ' + error);
    });
  };
}]);
