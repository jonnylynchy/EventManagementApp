require 'test_helper'

class OrganizationSubscriptionTest < ActiveSupport::TestCase
  
	context "an organization" do

    def setup
      @organizationSubscription = FactoryGirl.create(:organization_subscription)
    end

    def teardown
      @organizationSubscription = nil
    end

    should validate_presence_of(:organization)
    should validate_presence_of(:subscription_type)
    should validate_presence_of(:start_date)
    should validate_presence_of(:end_date)
    should belong_to(:organization)
    should belong_to(:subscription_type)

  end

end
