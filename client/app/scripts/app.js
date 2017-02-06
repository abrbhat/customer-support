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
    controller: 'SupportRequestListController'
  })

  .state('supportRequest-view', {
    url: '/support-request/view/:id',
    templateUrl: 'components/support-request/view/template.html',
    controller: 'SupportRequestViewController'
  })

  .state('supportRequest-create', {
    url: '/support-request/create',
    templateUrl: 'components/support-request/create/template.html',
    controller: 'SupportRequestCreateController'
  })

  // Customer States
  .state('customer-list', {
    url: '/customer/list',
    templateUrl: 'components/customer/list/template.html',
    controller: 'CustomerListController'
  })

  .state('customer-view', {
    url: '/customer/view/:id',
    templateUrl: 'components/customer/view/template.html',
    controller: 'CustomerViewController'
  })

  // Agent States
  .state('agent-list', {
    url: '/agent/list',
    templateUrl: 'components/agent/list/template.html',
    controller: 'AgentListController'
  })

  .state('agent-view', {
    url: '/agent/view/:id',
    templateUrl: 'components/agent/view/template.html',
    controller: 'AgentViewController'
  })

  .state('agent-create', {
    url: '/agent/create/:id',
    templateUrl: 'components/agent/create/template.html',
    controller: 'AgentCreateController'
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
    User.remote.get({id: user.id}).$promise
    .then(function(user){
      User.current = user;
      $rootScope.currentUser = user;
      $state.go('supportRequest-list');
    });
  });

  $rootScope.$on('auth:validation-success', function(event, user) {
    if(!User.current){
      User.remote.get({id: user.id}).$promise
      .then(function(user){
        User.current = user;
        $rootScope.currentUser = user;
      });
    }
  });

  $rootScope.$on('auth:validation-error', function(event, user) {
    $state.go('user-login');
  });

  $rootScope.$on('auth:logout-success', function() {
    User.current = null;
    $rootScope.currentUser = null;
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
    else if ((toState.name !== 'user-login') &&
             (toState.name !== 'user-register')){
      if(fromState.name !== ''){
        event.preventDefault();
        $state.go('user-login');
      }
    }
  });
}]);

app.filter('capitalize', function() {
  return function(input) {
      return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
  };
});
