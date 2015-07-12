// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });


$(document).ready(function(){ 

	$( "#survey_form" ).submit(function( event ) {
			event.preventDefault();
			var title = $('#survey_title_edit').val();
			var description = $('#survey_description_edit').val();
		  var valuesToSubmit = $(this).serialize();
		    $.ajax({
		        type: "POST",
		        url: $(this).attr('action'), //sumbits it to the given url of the form
		        data: valuesToSubmit,
		        dataType: "html" // you want a difference between normal and ajax-calls, and json is standard
		    }).success(function(data){
		    });
		$("#survey_title_edit").toggle();
  	$("#survey_description_edit").toggle();
  	$("#survey_title_solid").toggle();
  	$("#survey_description_solid").toggle();
  	$("#survey_button_confirm").toggle();
  	$("#survey_button_edit").toggle();
  	$('#survey_title_solid').html( title );
    $('#survey_description_solid').html( description );
	});

	$( "#survey_button_edit" ).click(function() {
		$("#survey_title_edit").toggle();
  	$("#survey_description_edit").toggle();
  	$("#survey_title_solid").toggle();
  	$("#survey_description_solid").toggle();
  	$("#survey_button_confirm").toggle();
  	$("#survey_button_edit").toggle();
	});


	$( "#question_text_button_edit" ).click(function() {
  	$("#question_text_edit").toggle();
  	$("#question_type_edit").toggle();
  	$("#question_text_solid").toggle();
  	$("#question_type_solid").toggle();
  	$("#question_text_button_confirm").toggle();
  	$("#question_text_button_edit").toggle();
	});


	$( "#question_form" ).submit(function( event ) {
			event.preventDefault();
			var text = $('#question_text_edit').val();
			var question_type = $('#question_type_edit').val();
		  var valuesToSubmit = $(this).serialize();
		    $.ajax({
		        type: "POST",
		        url: $(this).attr('action'), //sumbits it to the given url of the form
		        data: valuesToSubmit,
		        dataType: "html" // you want a difference between normal and ajax-calls, and json is standard
		    }).success(function(data){
		    });
		$("#question_text_edit").toggle();
  	$("#question_type_edit").toggle();
  	$("#question_text_solid").toggle();
  	$("#question_type_solid").toggle();
  	$("#question_text_button_confirm").toggle();
  	$("#question_text_button_edit").toggle();
  	$('#question_text_solid').html( text );
    $('#question_type_solid').html( question_type );
	});
});

