class OrganizationPaymentDetail < ActiveRecord::Base
  attr_accessible :cvv, :hashed_cc_number, :organization_id, :payment_type, :salt

  #association
  belongs_to :organization 
end
