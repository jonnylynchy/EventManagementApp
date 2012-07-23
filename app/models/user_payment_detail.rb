class UserPaymentDetail < ActiveRecord::Base
  attr_accessible :cvv, :hashed_cc_number, :payment_type, :salt, :user_id

  #associations
  belongs_to :user
  has_many :user_transactions
end
