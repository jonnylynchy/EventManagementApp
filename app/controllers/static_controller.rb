class StaticController < ApplicationController
  def index
  end

  def about
  end

  def contact
    @contact_form = ContactForm.new
  end

  def send_email
    @contact_form = ContactForm.new(params[:contact_form])

    if @contact_form.valid?
      #Notifications.contact_us(@contact_form).deliver
      flash[:success] = "Email sent, we'll get back to you ASAP!"
      redirect_to action: 'contact'
    else
      errors = ""
      @contact_form.errors.full_messages.each do |msg|
        errors+= msg + "<br />"
      end
      flash[:error] = errors.html_safe
      render :contact
    end

  end
end
