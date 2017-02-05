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
    'ui.router',
    'ngSanitize',
    'ngTouch',
    'ng-token-auth'
]);

app.config(function ($stateProvider,$urlRouterProvider) {
  $stateProvider

  .state('home', {
    url: '/home',
    templateUrl: 'views/main.html',
    controller: 'MainCtrl',
    controllerAs: 'main'
  })

  // Support Request States
  .state('supportRequest-list', {
    url: '/support-request/list',
    templateUrl: 'components/support-request/list/template.html',
    controller: 'SupportRequestListController',
    resolve: {
      auth: ['$auth', function($auth) {
        return $auth.validateUser();
      }]
    }
  })

  // User States
  .state('user-login', {
    url: '/user/login',
    templateUrl: 'components/user/login/template.html',
    controller: 'UserLoginController'
  })
  .state('user-register', {
    url: '/user/register',
    templateUrl: 'components/user/registration/template.html',
    controller: 'UserRegistrationController'
  });

  $urlRouterProvider.otherwise('/');
});

app.run(['$rootScope', '$state', function($rootScope, $state) {
  $rootScope.$on('auth:login-success', function() {
    $state.go('supportRequest-list');
  });

  $rootScope.$on('$stateChangeError', function() {
    $state.go('user-login');
  });
}]);

app.factory('SupportRequest', ['$resource', function($resource) {
  return $resource('/api/support_requests/:id.json', null, {
    'update': { method:'PUT' }
  });
}]);
