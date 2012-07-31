class SessionsController < ApplicationController

  def new
  end

  def create
    user = AdminUser.authenticate(email=params[:session][:email], password=params[:session][:password])
    if user
      # Sign the user in and redirect to the user's show page.
      session[:user] = user
      flash[:success] = 'You are now signed in.'
      redirect_to :back
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      redirect_to :back
    end
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  def destroy
    session[:user] = nil
    flash[:message] = 'You are now signed out.'
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

end
