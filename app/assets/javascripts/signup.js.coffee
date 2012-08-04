$(document).ready ->
	if $('.subscription .button').length > 0
		$('input[type=submit]').attr('disabled', 'disabled')
		$('.subscription .button').click ->
			$('.subscription').removeClass('callout')
			$('.subscription .button').text('Choose Plan').removeAttr('disabled')
			$(this).text('Click Next').attr('disabled', 'disabled')
			$(this).parent().addClass('callout')
			$('input[type=submit]').removeAttr('disabled')
			$('#organization_subscription_subscription_type_id').val($(this).data('subscription_type_id'))
			#console.log()