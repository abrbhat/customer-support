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
                                      'Agent', 'User',
                                    function ($scope, $state, Agent,
                                              User){
  $scope.currentUser = User.current;

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
