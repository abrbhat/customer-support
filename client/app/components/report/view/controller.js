'use strict';

/**
 * @ngdoc function
 * @name customerSupportApp.controller:ReportViewController
 * @description
 * # ReportViewController
 * Controller of the customerSupportApp
 */

angular.module('customerSupportApp')
  .controller('ReportViewController', ['$scope', '$state', '$q', 'Report',
                                       'SupportRequest',
                                        function ($scope, $state, $q, Report,
                                        SupportRequest){
  /**
   * Gets support requests for report from server
   */
  SupportRequest.remote.get({report: 'true'}).$promise
  .then(function(response){
    $scope.supportRequests = response['support_requests'];
  });

  /**
   * [downloadReport Downloads PDF data, converts it into a file and sends it
   *  to the browser for download as a pdf file]
   */
  $scope.downloadReport = function(){
    var fileName = "Report.pdf";

    /**
     * Creating a hidden link element to enable triggering the download of the
     * file by the browser
     */
    var hiddenFileLink = document.createElement("a");
    document.body.appendChild(hiddenFileLink);
    hiddenFileLink.style = "display: none";

    Report.get()
    .then(function(result){
      try{
        // Convert the pdf data to a blob
        var file = new Blob([result.data], {type: 'application/pdf'});

        // Create a temporary URL for the file data
        var fileURL = window.URL.createObjectURL(file);

        // Assign the temporary file url to the hidden link
        hiddenFileLink.href = fileURL;
        hiddenFileLink.download = fileName;
        hiddenFileLink.click();
      }
      catch(error){
        return $q.reject(error);
      }
    })
    .catch(function(error){
      window.alert('Error ' + error);
    });
  };
}]);
