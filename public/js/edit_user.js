$(document).ready(function() {
	$("ul#user-info").on("click", "a.edit", function(event) {
		event.preventDefault();
		var action = this['href']
		debugger;
		var action = li_element.children[0]
		var li_element = $(this).parentElement
		alert(action)
	})
})