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
  });

  // $routeProvider
  //   .when('/', {
  //     templateUrl: 'views/main.html',
  //     controller: 'MainCtrl',
  //     controllerAs: 'main'
  //   })
  //   .when('/support_requests', {
  //     templateUrl: 'components/support-request/list/template.html',
  //     controller: 'SupportRequestListController',
  //     resolve: {
  //       auth: ['$auth', function($auth) {
  //         return $auth.validateUser();
  //       }]
  //     }
  //   })
  //   .when('/sign_in', {
  //       templateUrl: 'components/user/login/template.html',
  //       controller: 'UserLoginController'
  //     })
  //   .when('/sign_up', {
  //       templateUrl: 'components/user/registration/template.html',
  //       controller: 'UserRegistrationController'
  //     })
  //   .otherwise({
  //     redirectTo: '/'
  //   });

  $urlRouterProvider.otherwise('/home');
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
