class OrganizationTransaction < ActiveRecord::Base
  attr_accessible :amount, :organization_id, :organization_payment_detail_id, :transaction_type_id

  #associations
  belongs_to :organization 
  belongs_to :organization_payment_detail 
end
