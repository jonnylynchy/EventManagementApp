class UserTransaction < ActiveRecord::Base
  attr_accessible :amount, :event_id, :transaction_type_id, :user_id, :user_payment_detail_id

  #associations
  belongs_to :user
  belongs_to :user_payment_detail
  belongs_to :event
  belongs_to :transaction_type
  has_many :child_registrations
end
