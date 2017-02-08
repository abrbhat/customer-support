'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('Report', ['$http', function($http) {
  var get = function(){
    var resource = $http.get('/api/support_requests.pdf?report=true', {
      responseType:'arraybuffer'
    });
    
    return resource;
  };

  return {
    get: get
  };
}]);
