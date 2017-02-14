'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:AdminCreateController
 * @description
 * # AdminCreateController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('AdminCreateController', ['$scope', '$state', '$filter', 'Admin',
                                        function ($scope, $state, $filter, Admin){
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
      var errorData = error.data;
      var errorField = Object.keys(errorData)[0];
      var errorText = errorData[errorField][0];

      $scope.error = $filter('capitalize')(errorField) + " " + errorText;
    });
  };
}]);
