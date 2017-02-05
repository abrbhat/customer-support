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

app.config(function ($stateProvider, $urlRouterProvider) {
  $stateProvider

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

  $urlRouterProvider.otherwise('/user/login');
});

app.run(['$rootScope', '$state', 'User', function($rootScope, $state, User) {
  $rootScope.$on('auth:login-success', function(event, user) {
    User.current = user;
    $state.go('supportRequest-list');
  });

  $rootScope.$on('auth:logout-success', function() {
    $state.go('user-login');
  });

  $rootScope.$on('$stateChangeStart', function(event, toState, toParams,
                                               fromState, fromParams) {
    if(User.current){
      if((toState.name === 'user-login') ||
         (toState.name === 'user-register')){
        event.preventDefault();
        $state.go('supportRequest-list');
      }
    }
  });

  $rootScope.$on('$stateChangeError', function(event, toState, toParams,
                                               fromState, fromParams) {
    $state.go('user-login');
  });
}]);
