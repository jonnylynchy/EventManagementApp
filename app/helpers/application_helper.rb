module ApplicationHelper

	def account_links
		default_org = Organization.find_by_subdomain('default')
		if !@current_user.nil? and @current_user.organization.id != default_org.id
    	content_tag :li, class: 'has-flyout' do
    		content_tag(:a, @current_user.organization.title, href: '#') + 
    		content_tag(:ul, class: 'flyout small right') do
    			render partial: 'shared/account'
    		end
      end
    else
    	content_tag :li, class: 'has-flyout' do
    		content_tag(:a, 'Sign in', href: '#') + 
    		content_tag(:div, class: 'flyout large right') do
    			render partial: 'shared/signin'
    		end
      end
    end
	end

end
