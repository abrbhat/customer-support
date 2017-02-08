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

// app.service('authInterceptor', ['$q', function($q) {
//     var service = this;
//
//     service.responseError = function(response) {
//       if (response.status === 401){
//         window.location = "#/user/login";
//       }
//       return $q.reject(response);
//     };
// }]);

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

  // Admin States
  .state('admin-list', {
    url: '/admin/list',
    templateUrl: 'components/admin/list/template.html',
    controller: 'AdminListController'
  })

  .state('admin-view', {
    url: '/admin/view/:id',
    templateUrl: 'components/admin/view/template.html',
    controller: 'AdminViewController'
  })

  .state('admin-create', {
    url: '/admin/create/:id',
    templateUrl: 'components/admin/create/template.html',
    controller: 'AdminCreateController'
  })

  // Report States
  .state('report-view', {
    url: '/report/view',
    templateUrl: 'components/report/view/template.html',
    controller: 'ReportViewController'
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

app.config(function($httpProvider){
  $httpProvider.interceptors.push(function($q, $location) {
    return {
      responseError: function(rejection) {
        if(rejection.status === 401){
          $location.url('/user/login');
        }

        return $q.reject(rejection);
      }
    };
  });
});


app.run(['$rootScope', '$state', '$auth', '$timeout', 'User',
         function($rootScope, $state, $auth, $timeout, User) {
  $rootScope.$on('auth:login-success', function(event, user) {
    User.remote.get({id: user.id}).$promise
    .then(function(user){
      $rootScope.currentUser = user;
      $state.go('supportRequest-list');
    });
  });

  $rootScope.$on('auth:validation-success', function(event, user) {
    if(!$rootScope.currentUser){
      User.remote.get({id: user.id}).$promise
      .then(function(user){
        $rootScope.currentUser = user;
      });
    }
  });

  $rootScope.$on('auth:validation-error', function(event, user) {
    $state.go('user-login');
  });

  $rootScope.$on('auth:logout-success', function() {
    $rootScope.currentUser = null;
    $state.go('user-login');
  });

  $rootScope.$on('$stateChangeStart', function(event, toState, toParams,
                                               fromState, fromParams) {
    if($rootScope.currentUser){
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
})

.filter('humanize', function(){
  return function(text) {
    if(text) {
      var string = text.split("_").join(" ").toLowerCase();
      string = string.charAt(0).toUpperCase() + string.slice(1);
      return string;
    }
  };
});
