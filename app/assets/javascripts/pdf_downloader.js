// app/assets/javascripts/pdf_downloader.js
document.addEventListener('DOMContentLoaded', function() {
    var downloadPdfButton = document.getElementById('download-pdf-button');
  
    if (downloadPdfButton) {
      downloadPdfButton.addEventListener('click', function(event) {
        event.preventDefault();
        var pdfUrl = this.getAttribute('href');
        window.open(pdfUrl, '_blank');
      });
    }
  });
  