'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:AgentListController
 * @description
 * # AgentListController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('AgentListController', ['$scope', '$state',
                                      'Agent',
                                    function ($scope, $state, Agent){
  Agent.remote.get().$promise
  .then(function(response){
    $scope.agents = response['agents'];
  });

  $scope.viewAgent = function(agentId){
    $state.go('agent-view', {id: agentId});
  };

  $scope.createNewAgent = function(){
    $state.go('agent-create');
  };
}]);
