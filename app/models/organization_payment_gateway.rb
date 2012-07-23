class OrganizationPaymentGateway < ActiveRecord::Base
  attr_accessible :hashed_password, :is_active, :is_test_mode, :login, :organization_id, :payment_gateway_type_id, :salt, :user

  #associations
  belongs_to :organization 
  belongs_to :payment_gateway_type 
end
