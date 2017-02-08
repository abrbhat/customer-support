'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('SupportRequest', ['$resource', function($resource) {
  var remote = $resource('/api/support_requests/:id.json', null, {
    'update': { method: 'PUT' }
  });

  return {
    remote: remote
  };
}]);
