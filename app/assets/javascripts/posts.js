// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
	$(".remove_fields").on("click", function(e){
		console.log('jk');
		e.preventDefault();
		$(this).prev("input[type=hidden]").val('1');
		$(this).closest('fieldset').hide();
	})

	$(".add_fields").on('click', function(e){
		e.preventDefault()
		console.log("clicked")
		var time = new Date().getTime()
		var regex = new RegExp($(this).data('id'), 'g')
		//console.log($(this).before.html())
		$(this).before($(this).data('field').replace(regex, time))

		e.preventDefault()
	})
})