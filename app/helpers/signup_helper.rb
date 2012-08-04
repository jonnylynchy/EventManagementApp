module SignupHelper
	def signup_sidebar(current_step)
		html = ""
		step_arr = []
		step_arr.push({step_num: 1, title: 'User Account'})
		step_arr.push({step_num: 2, title: 'Organization Information'})
		step_arr.push({step_num: 3, title: 'Account Plan'})
		step_arr.push({step_num: 4, title: 'Payment Details'})
		
		step_arr.each do |step|
			if current_step == step[:step_num]
				html += content_tag(:li, step[:title], class: 'active')
			else
				html += content_tag(:li, step[:title])
			end
		end
		content_tag :ul, class: 'side-nav' do
			raw(html)
		end
	end
end