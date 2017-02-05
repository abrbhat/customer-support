'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('User', ['$resource', function($resource) {
  var currentUser = null;

  var remote = $resource('/api/users/:id.json', null, {
    'update': { method:'PUT' }
  });

  return {
    remote: remote,
    current: currentUser
  };
}]);
