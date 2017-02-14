'use strict';

angular.module('customerSupportApp')
.factory('User', ['$resource', function($resource) {
  var remote = $resource('/api/users/:id.json', null, {
    'update': { method:'PUT' }
  });

  return {
    remote: remote
  };
}]);
