require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "a user" do

    def setup
      @password = 'secretpass'
      @user = FactoryGirl.create(:user, password: @password)
    end

    def teardown
      @user = nil
    end

    # validation tests
    should belong_to(:organization)
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:email)
    should validate_presence_of(:mobile_phone)
    should validate_presence_of(:home_phone)
    should validate_uniqueness_of(:email)
    should validate_presence_of(:organization)

    should_not allow_mass_assignment_of(:password)
    should_not allow_value("yoyo").for(:email)
    should allow_value("jo@blah.com").for(:email)
    
    # association tests
    should "require an organization title" do
      assert !@user.organization.title.empty?, "user must belong to an organization and have a title"
    end

    should "work with password for authentication" do
      #@password = 'blabla'
      assert User.authenticate(email=@user.email, password=@password), "password did not match"
    end

  end

end
