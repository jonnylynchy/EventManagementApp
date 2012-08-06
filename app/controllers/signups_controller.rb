class SignupsController < ApplicationController
  def new
    # User info
    @org_admin_user = AdminUser.new
    @signup_step = 1
  end

  def save_user
    @org_admin_user = AdminUser.new(params[:admin_user])
    @signup_step = 1
    #raise "error"
    if @org_admin_user.save
      session[:user_id] = @org_admin_user.id
      flash[:success] = "Your user account was created."
      redirect_to '/signup/organization'
    else
      flash[:error] = error_messages_for(@org_admin_user).html_safe
      render 'new'
    end
  end

  def organization
    @org = Organization.new
    @signup_step = 2
  end

  def save_organization
    @org = Organization.new(params[:organization])
    @signup_step = 2
    if @org.save
      @current_user.organization_id = @org.id
      @current_user.save
      flash[:success] = "Organization was created."
      redirect_to '/signup/account_plan'
    else
      flash[:error] = error_messages_for(@org).html_safe
      render 'organization'
    end
  end

  def account_plan
  	@org_sub = OrganizationSubscription.new({
      organization_id: @current_user.organization_id,
      start_date: Date.today,
      end_date: 1.month.from_now
    })
    @org_sub_types = SubscriptionType.all
    @signup_step = 3
  end

  def save_account
    @org_sub = OrganizationSubscription.new(params[:organization_subscription])
    @signup_step = 3
    if @org_sub.save
      flash[:success] = "Your account plan was saved."
      redirect_to '/signup/payment_details'
    else
      flash[:error] = error_messages_for(@org_sub).html_safe
      render 'account_plan'
    end
  end

  def payment_details
  	@org_payment = OrganizationPaymentDetail.new
    @signup_step = 4
  end

  def save_payment_details

  end

  def complete

  end

end
