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
    'ngTouch',
    'ng-token-auth'
]);

app.config(function ($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
      controllerAs: 'main'
    })
    .when('/support_requests', {
      templateUrl: 'views/support_requests.html',
      controller: 'SupportRequestCtrl'
    })
    .when('/sign_in', {
        templateUrl: 'views/user_sessions/new.html',
        controller: 'UserSessionsCtrl'
      })
    .when('/sign_up', {
        templateUrl: 'views/user_registrations/new.html',
        controller: 'UserRegistrationsCtrl'
      })
    .otherwise({
      redirectTo: '/'
    });
});

app.run(['$rootScope', '$location', function($rootScope, $location) {
  $rootScope.$on('auth:login-success', function() {
    $location.path('/');
  });
}]);

app.factory('SupportRequest', ['$resource', function($resource) {
  return $resource('/api/support_requests/:id.json', null, {
    'update': { method:'PUT' }
  });
}]);
