// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
	$(".remove_fields").on("click", function(e){
		e.preventDefault()
		$(this).prev("input[type=hidden]").val('1');
		$(this).closest('fieldset').hide()
	})
})