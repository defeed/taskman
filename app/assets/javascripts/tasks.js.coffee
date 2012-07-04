# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$('.datepicker').datepicker({ dateFormat: "DD, d MM yy", firstDay: 1 })
	
	$('#new-task-form').hide()
	
	$('#new-task').click ->
		$('#new-task-form').show("blind")
		$('#new-task').hide("blind")
		
	$('#cancel').click ->
		$('#new-task-form').hide("blind")
		$('#new-task').show("blind")
		
	$('#tasks').sortable
		axis: 'y'
		update: ->
			$.post($(this).data('update-url'), $(this).sortable('serialize'))
	