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

$(function  () {
	
$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

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



$('.ajax-signin-btn').on('click', () => {
	var email = $('#login-email').val();
	var password = $('#login-password').val();
	var remember = $('#login-remember').val();

	$.ajax({
		url: '/users/sign_in.json',
		type: 'post',
		contentType: 'application/json',
		dataType: 'json',
				headers: {
	 	'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
		},

		data: JSON.stringify({
			'user': {
				'email': email,
				'password': password,
				'remember_me': remember
			}
		}),

		success: (data) => {
			console.log(data);
		}
	});
});


 $('.ajax-signup-btn').on('click', () => {
	var email = $('#signup-email').val();
	var username = $('#signup-user').val();
	var password = $('#signup-password').val();
	var password_confirm = $('#signup-password-confirm').val();

	$.ajax({
		url: '/users/sign_up.json',
		type: 'post',
		contentType: 'application/json',
		dataType: 'json',
		headers: {
	 	'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
		},
		data: JSON.stringify({
			'user': {
				'email': email,
				'username': username,
				'password': password,
				'password_confirmation': password_confirm
			}
		}),

		success: (data) => {
			console.log(data);
		}
	});
});
	
});