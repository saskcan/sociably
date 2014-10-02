ready = ->

	$('#NewTagForm').submit ->
		alert $('input[name=tag[taggable_type]]:checked').val
		return false

$(document).ready(ready)
$(document).on('page:load', ready)