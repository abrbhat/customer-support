'use strict';

angular.module('crossoverCustomerSupportApp')
.factory('Report', ['$http', function($http) {
  var get = function(){
    return $http.get('/api/support_requests.pdf?report=true', {
             responseType:'arraybuffer'
           });
  };

  return {
    get: get
  };
}]);
