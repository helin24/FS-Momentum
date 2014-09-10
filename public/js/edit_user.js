$(document).ready(function() {
	$("ul#user-info").on("click", "a.edit", function(event) {
		event.preventDefault();
		var action = this['href'];
		var method = "get";
		var data = {edit: this.previousElementSibling['id']};
		var li_element = this.parentElement

		var request = $.ajax(action, {"method": method, "data": data});
		request.done(function(response) {
			debugger;
			console.log(response)
			$(li_element).find("div.editable").html(response);
		})
	})
})