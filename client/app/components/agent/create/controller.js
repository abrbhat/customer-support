'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:AgentCreateController
 * @description
 * # AgentCreateController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('AgentCreateController', ['$scope', '$state', 'Agent',
                                        function ($scope, $state, Agent){

  $scope.submitAgentForm = function(form){
    var postData = {
      'agent': form
    };

    Agent.remote.save({}, postData).$promise
    .then(function(createdAgent){
      $state.go('agent-view', {id: createdAgent['id']});
    });
  };
}]);
