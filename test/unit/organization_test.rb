require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  context "an organization" do

    def setup
      @organization = FactoryGirl.create(:organization)
    end

    def teardown
      @organization = nil
    end

    should validate_presence_of(:title)
    should validate_presence_of(:contact_email)
    should validate_presence_of(:contact_phone)
    should validate_presence_of(:subdomain)
    should have_many(:users)
    should have_many(:admin_users)
    should have_many(:events)
    should have_many(:organization_domains)
    should have_many(:organization_transactions)
    should have_many(:organization_payment_details)
    should have_one(:organization_subscription)

  end

end
