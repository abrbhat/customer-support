'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('Customer', ['$resource', function($resource) {
  var remote = $resource('/api/customers/:id.json', null, {
    'update': { method:'PUT' }
  });

  return {
    remote: remote
  };
}]);
