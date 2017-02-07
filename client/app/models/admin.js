'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('Admin', ['$resource', function($resource) {
  var remote = $resource('/api/admins/:id.json', null, {
    'update': { method:'PUT' }
  });

  return {
    remote: remote
  };
}]);
