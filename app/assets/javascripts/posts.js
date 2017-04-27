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

$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

$("#signup-btn").on('click', function(){
	console.log('modal yo');
	$("#signup-modal").modal();
});

$("form#sign_up_user").bind("ajax:success", (e, data, status, xhr) => {
    if (data.success){
      $('#sign_up').modal('hide');
      $('#sign_up_button').hide();
      $('#submit_comment').slideToggle(1000, "easeOutBack" );
  }
    else{
      alert('failure!');
    }
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