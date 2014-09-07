$(document).ready(function() {
  $("#add-note").on("submit", function(event) {
    event.preventDefault();
    var action = $(this).attr("action");
    var method = $(this).attr("method");
    var data = $(this).serialize();
    var request = $.ajax(action, {"method": method, "data": data});
    request.done(function(response) {
      $("#private-notes").append(response)
    })
  })
});
