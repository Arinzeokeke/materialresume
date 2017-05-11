// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require material.min.js
//= require nouislider.min.js
//= require bootstrap-datepicker.js
//= require material-kit.js
//= require_self


$(document).on("turbolinks:load", function() {


	var show_ajax_message = function(msg) {
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
).on ("ajax:error", function(e, xhr, status, error) {
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

$("#sign_up_user").on("ajax:success", function(e, data, status, xhr){
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