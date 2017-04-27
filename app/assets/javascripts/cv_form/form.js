//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require cv_form/jquery.bootstrap.js
//= require cv_form/material-bootstrap-wizard.js
//= require cv_form/jquery.validate.min.js
$(function(){
	$("#signup-btn").click( function(){
	console.log('modal yo');
	$("#signin-modal").modal('hide');
	$("#signup-modal").modal();
});


	$("#signin-btn").on('click', function(){
	console.log('modal yo 2');
	$("#signup-modal").modal('hide');
	$("#signin-modal").modal();

});


$("#signin2").on('click', function(){
	console.log('modal yo 2');
	$("#signup-modal").modal('hide');
	$("#signin-modal").modal();

});


$("#signup2").click( function(){
	console.log('modal yo');
	$("#signin-modal").modal('hide');
	$("#signup-modal").modal();
});
	$(".remove_fields").on("click", function(e){
		console.log('jk');
		e.preventDefault();
		$(this).prev("input[type=hidden]").val('1');
		$(this).closest('fieldset').hide();
	})

	$(".add_fields").on('click', function(e){
		e.preventDefault();
		console.log("clicked");
		var time = new Date().getTime();
		var regex = new RegExp($(this).data('id'), 'g');
		//console.log($(this).before.html())
		$(this).before($(this).data('field').replace(regex, time));

	})
})