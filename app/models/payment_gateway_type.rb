class PaymentGatewayType < ActiveRecord::Base
  attr_accessible :description, :requires, :title

  #associations
  has_many :organization_payment_gateways
end
