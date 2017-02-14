'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:AgentListController
 * @description
 * # AgentListController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('AgentListController', ['$scope', '$state',
                                      'Agent',
                                    function ($scope, $state, Agent){
  /**
   * Gets list of agents and assign it to $scope.agents
   */
  Agent.remote.get().$promise
  .then(function(response){
    $scope.agents = response['agents'];
  });

  /**
   * [viewAgent Makes state go to agent detail view]
   * @param  {Integer} agentId Agent Id
   */
  $scope.viewAgent = function(agentId){
    $state.go('agent-view', {id: agentId});
  };

  /**
   * [createNewAgent Makes state go to agent create view]
   */
  $scope.createNewAgent = function(){
    $state.go('agent-create');
  };
}]);
