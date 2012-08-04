class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_admin_user
  helper_method :error_messages_for

  def set_current_admin_user
    @current_user = AdminUser.find(session[:user_id]) if !session[:user_id].nil?
  end

  def error_messages_for(object)
		errors = ""
    object.errors.full_messages.each do |msg|
      errors+= msg + "<br />"
    end
    return errors
	end

end
