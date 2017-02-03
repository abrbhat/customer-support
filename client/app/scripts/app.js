'use strict';

/**
 * @ngdoc overview
 * @name crossoverCustomerSupportApp
 * @description
 * # crossoverCustomerSupportApp
 *
 * Main module of the application.
 */

var app = angular.module('crossoverCustomerSupportApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
]);

app.config(function ($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
      controllerAs: 'main'
    })
    .when('/groups', {
      templateUrl: 'views/groups.html',
      controller: 'SupportRequestsCtrl'
    })
    .otherwise({
      redirectTo: '/'
    });
});

app.factory('SupportRequest', ['$resource', function($resource) {
  return $resource('/api/support_requests/:id.json', null, {
    'update': { method:'PUT' }
  });
}]);
