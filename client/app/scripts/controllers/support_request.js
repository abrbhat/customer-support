'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:SupportRequestCtrl
 * @description
 * # SupportRequestCtrl
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('SupportRequestCtrl', ['$scope', 'SupportRequest',
                                    function ($scope, SupportRequest){
  $scope.supportRequests = SupportRequest.query();
}]);
