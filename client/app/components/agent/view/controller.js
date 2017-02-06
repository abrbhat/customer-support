'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:AgentViewController
 * @description
 * # AgentViewController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('AgentViewController', ['$scope', '$stateParams','$state', 'Agent',
                                      function ($scope, $stateParams, $state, Agent){

  var urlParams = {id: $stateParams.id};

  Agent.remote.get(urlParams).$promise
  .then(function(agent){
    $scope.agent = agent;
  });

  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };

  $scope.removeAgent = function(){
    if(window.confirm("Are you sure?")){
      Agent.remote.remove({id: $scope.agent['id']}).$promise
      .then(function(){
        $state.go('agent-list');
      });
    }
  };
}]);
