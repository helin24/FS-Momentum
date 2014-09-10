$(document).ready(function() {
	$("ul#user-info").on("click", "a.edit", function(event) {
		event.preventDefault();
		var action = this['href'];
		var method = "get";
		var data = {edit: this.previousElementSibling['id']};
		var li_element = this.parentElement

		var request = $.ajax(action, {"method": method, "data": data});
		request.done(function(response) {
			$(li_element).find("div.editable").html(response);
			$(li_element).find("a.edit").attr('class', 'save').html('Save');
		})
	})

	$("ul#user-info").on("click", "a.save", function(event) {
		event.preventDefault();
		var action = this['href'];
		var method = "put";
		var data = {edit: this.previousElementSibling['id'], value: $(this).siblings("div").find("input").val()};
		console.log(data);
		var li_element = this.parentElement

		var request = $.ajax(action, {"method": method, "data": data});
		request.done(function(response) {
			$(li_element).find("div.editable").html(response);
			$(li_element).find("a.save").attr('class', 'edit').html('Edit');
		})
	})
})