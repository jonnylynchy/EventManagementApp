$(document).ready ->
	if $('.subscription .button').length > 0
		$('input[type=submit]').attr('disabled', 'disabled')
		$('.subscription .button').click ->
			subTypeID = $(this).data('subscription_type_id')
			featureList = $(this).parent().find('.featureList').text()
			lines = featureList.split("|")
			centerPoint = $(this).parent().width()/2 + $(this).parent().parent().position().left
			console.log(centerPoint)
			# $('.subscriptionDetails').hide()
			# $('.subPointer').hide()
			$('.subscription').removeClass('callout')
			$('.subscription .button').text('Choose To View Details').removeAttr('disabled')
			$(this).text('Click Next').attr('disabled', 'disabled')
			$(this).parent().addClass('callout')
			$('input[type=submit]').removeAttr('disabled')
			$('#organization_subscription_subscription_type_id').val(subTypeID)
			$('.subscriptionDetails p').html('')
			$.each lines, (n, elem) ->
			  $('.subscriptionDetails p').append('<div>' + elem + '</div>')
			$(".subscriptionDetails").fadeIn "fast", ->
			  $(".subPointer").show()
			  $(".subPointer").animate
			    "background-position-x": centerPoint + "px"
			    "background-position-y": "0"
			  , 300, "linear"

			
			