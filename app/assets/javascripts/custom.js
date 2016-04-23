$(document).ready(function() {
  $('#data-table').DataTable({
    "order": [[ 2, "desc" ]]
  });
    
  $('[data-toggle="popover"]').popover({
    placement: 'left'
  }); 

});