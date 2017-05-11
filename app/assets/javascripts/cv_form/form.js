//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require cv_form/jquery.bootstrap.js
//= require cv_form/material-bootstrap-wizard.js
//= require cv_form/jquery.validate.min.js
$(document).on("turbolinks:load", function(){


	$(".remove_fields").on("click", function(e){
		console.log('jk');
		e.preventDefault();
		$(this).prev("input[type=hidden]").val('1');
		$(this).closest('fieldset').hide();
	});

	$(".add_fields").on('click', function(e){
		e.preventDefault();
		console.log("clicked");
		var time = new Date().getTime();
		var regex = new RegExp($(this).data('id'), 'g');
		$(this).before($(this).data('field').replace(regex, time));
	});


	var show_ajax_message = function(msg)  {
		$("#signin-error").html("<div id='flash-#{type}'>" + msg + "</div>");
//$("#flash-#{type}").delay(5000).slideUp('slow');
}

$(document).ajaxComplete(function(event, request) {
	msg = request.getResponseHeader("X-Message");
	type = request.getResponseHeader("X-Message-Type");
//show_ajax_message(msg, type); //use whatever popup, notification or whatever plugin you want
});



$("#sign_in_user").on("ajax:success", function(e, data, status, xhr) {


	$("#signin-error").html("Logged In!");
}
).on ("ajax:error", function(e, xhr, status, error)  {
//$("#new_article").append("<p>ERROR</p>");
//console.log(data);
console.log(status);
console.log(xhr);
var errors = JSON.parse(xhr.responseText).message;
var mes = "";
mes += '<p>' + errors + '</p>';
mes +=  '';
$("#signin-error").html(errors);
console.log(xhr.responseText);
});

$("#sign_up_user").on("ajax:success", function(e, data, status, xhr) {
//$("#new_article").append(xhr.responseText);
console.log(xhr.responseText);
$("#signup-error").html("Signed Up!");
}
).on ("ajax:error", function(e, xhr, status, error) {
//$("#new_article").append("<p>ERROR</p>");
console.log(xhr.responseText);
var errors = JSON.parse(xhr.responseText);
console.log(errors);
var mes = "<div class = 'row'>";
for (i in errors){
	mes += '<p>'  + errors[i] + '</p>';
}
mes +=  '</div>';
$("#signup-error").html(mes);
});

$(".signup-btn").click( function(){
	console.log('modal yo');
	$("#signin-modal").modal('hide');
	$("#signup-modal").modal();
	$("#signup-error").html('');
	$("#signin-error").html('');
	$("#reg-modal").modal('hide');
});


$(".signin-btn").on('click', function(){
	console.log('modal yo 2');
	$("#signup-modal").modal('hide');
	$("#signin-modal").modal();
	$("#signup-error").html('');
	$("#signin-error").html('');
	$("#reg-modal").modal('hide');

});



$("#reg-warn").on('click', function(){
	console.log('modal yo 2');
	$("#signin-modal").modal('hide');
	$("#signup-modal").modal('hide');
	$("#reg-modal").modal();

});



});