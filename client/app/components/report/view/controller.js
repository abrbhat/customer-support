'use strict';

/**
 * @ngdoc function
 * @name crossoverCustomerSupportApp.controller:ReportViewController
 * @description
 * # ReportViewController
 * Controller of the crossoverCustomerSupportApp
 */

angular.module('crossoverCustomerSupportApp')
  .controller('ReportViewController', ['$scope', '$state', '$http',
                                       'SupportRequest',
                                        function ($scope, $state, $http,
                                        SupportRequest){
  SupportRequest.remote.get({report: 'true'}).$promise
  .then(function(response){
    $scope.supportRequests = response['support_requests'];
  });



  $scope.downloadReport = function(){
    var fileName = "Report.pdf";
    var hiddenFileLink = document.createElement("a");
    document.body.appendChild(hiddenFileLink);
    hiddenFileLink.style = "display: none";

    $http.get('/api/support_requests.pdf?report=true',
              {responseType:'arraybuffer'})
    .then(function(result){
      var file = new Blob([result.data], {type: 'application/pdf'});
      var fileURL = window.URL.createObjectURL(file);
      hiddenFileLink.href = fileURL;
      hiddenFileLink.download = fileName;
      hiddenFileLink.click();
    });
  };
}]);
