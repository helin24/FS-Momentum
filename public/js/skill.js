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

  $(".delete").on("click", function(event) {
    event.preventDefault();
    
    var action = $(this).attr("href");
    var method = "delete";
    var data = "note_id=" + $(this).attr("id");
    var deleted_element = $(this).parent()
    // debugger;
    var request = $.ajax(action, {"method": method, "data": data});
    request.done(function() {
      deleted_element.remove();
    })
  })

  $(".skill-note").on("click", "a.edit" function(event) {
    event.preventDefault();

    var action = $(this).attr("href");
    var method = "get";


  })

});
