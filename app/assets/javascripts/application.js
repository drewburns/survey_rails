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



jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action + '.js', $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

$(function(){ $(document).foundation(); });

$(document).ready(function(){ 

	$("#new_choice").submitWithAjax();

  $(".text_edit").toggle();
  $(".type_edit").toggle();

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


	$( ".button_edit" ).click(function() {
		var form = $(this).parent();
  	$( form ).find(".text_edit").toggle();
  	$( form ).find(".type_edit").toggle();
  	$( form ).find(".text_solid").toggle();
  	$( form ).find(".type_solid").toggle();
  	$( form ).find(".button_confirm").toggle();
  	$( form ).find(".button_edit").toggle();
	});


	$( ".question_form" ).submit(function( event ) {
			event.preventDefault();
			var text = $( this ).find('.text_edit').val();
			var question_type = $( this ).find('.type_edit').val();
		  var valuesToSubmit = $(this).serialize();
		    $.ajax({
		        type: "POST",
		        url: $(this).attr('action'), //sumbits it to the given url of the form
		        data: valuesToSubmit,
		        dataType: "html" // you want a difference between normal and ajax-calls, and json is standard
		    }).success(function(data){
		    });
		$( this ).find(".text_edit").toggle();
  	$( this ).find(".type_edit").toggle();
  	$( this ).find(".text_solid").toggle();
  	$( this ).find(".type_solid").toggle();
  	$( this ).find(".button_confirm").toggle();
  	$( this ).find(".button_edit").toggle();
  	$( this ).find('.text_solid').html( text );
    $( this ).find('.type_solid').html( question_type );
	});

	$(".choice_form").submit(function( event ) {
		event.preventDefault();
			var text = $( this ).find('.text_edit').val();
			var question_type = $('.type_edit').val();
		  var valuesToSubmit = $(this).serialize();
		    $.ajax({
		        type: "POST",
		        url: $(this).attr('action' + '.js'), //sumbits it to the given url of the form
		        data: valuesToSubmit,
		        dataType: "html" // you want a difference between normal and ajax-calls, and json is standard
		    }).success(function(data){
		  	});
		$( this ).find(".text_edit").toggle();
		$( this ).find(".text_solid").toggle();
		$( this ).find(".button_confirm").toggle();
  	$( this ).find(".button_edit").toggle();
  	$( this ).find('.text_solid').html( text );
	});

});



	// $( ".add_choice" ).click(function() {
	// 	$("#choices_list").append('
	// 	<li>
	// 		<%= form_for new_choice, :html=> {:class => 'choice_form'} do |f| %>
	// 			<%= f.hidden_field :question_id, :value => question.id %>
	// 			<div class="field">
	// 		    <%= f.label :text, "Answer" %><br />
	// 		    <h6 class="text_solid"><%= choice.text %></h6>
	// 		    <%= f.text_field :text, :class => "text_edit" %>
	// 		  </div>

	// 		  <button type="button" class="button tiny button_edit">Edit</button>

	// 		  <div class="actions button_confirm">
	// 		  	<%= f.submit "Confirm Changes" %>
	// 			</div>
	// 		<% end %>
	// 	</li>

	// 		');
	// });

