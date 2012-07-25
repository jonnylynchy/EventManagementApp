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
      flash[:notice] = "Email sent, we'll get back to you."
      redirect_to action: 'contact'
    else
      render :contact
    end

  end
end
