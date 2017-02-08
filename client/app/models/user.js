'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('User', ['$resource', function($resource) {
  var remote = $resource('/api/users/:id.json', null, {
    'update': { method:'PUT' }
  });

  return {
    remote: remote
  };
}]);
