'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('User', ['$resource', function($resource) {
  var currentUser = null;

  var remote = $resource('/api/support_requests/:id.json', null, {
    'update': { method:'PUT' }
  });

  return {
    remote: remote,
    current: currentUser
  };
}]);
