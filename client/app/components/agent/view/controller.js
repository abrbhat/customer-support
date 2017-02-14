'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:AgentViewController
 * @description
 * # AgentViewController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('AgentViewController', ['$scope', '$stateParams','$state', 'Agent',
                                      function ($scope, $stateParams, $state, Agent){

  var urlParams = {id: $stateParams.id};

  /**
   * Gets agent details from server and assign it to $scope.agent
   */
  Agent.remote.get(urlParams).$promise
  .then(function(agent){
    $scope.agent = agent;
  });

  /**
   * [viewSupportRequest Makes state go support request detail view]
   * @param  {Integer} supportRequestId Support request id
   */
  $scope.viewSupportRequest = function(supportRequestId){
    $state.go('supportRequest-view', {id: supportRequestId});
  };

  /**
   * [removeAgent Removes agent after confirmation]
   */
  $scope.removeAgent = function(){
    if(window.confirm("Are you sure?")){
      Agent.remote.remove({id: $scope.agent['id']}).$promise
      .then(function(){
        /*
          Make state go to agent list after successful removal of agent
         */
        $state.go('agent-list');
      })
      .catch(function(error){
        window.alert('Cannot Delete Last Agent');
      });
    }
  };
}]);
