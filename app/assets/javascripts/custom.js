$(document).ready(function() {
  $('#data-table').DataTable({
    "order": [[ 2, "desc" ]]
  });
    
  var options = {
      placement: 'auto right'
  };
  $('[data-toggle="popover"]').popover(options); 

});