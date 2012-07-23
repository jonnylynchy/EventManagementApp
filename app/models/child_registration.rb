class ChildRegistration < ActiveRecord::Base
  attr_accessible :child_id, :classroom_id, :event_id, :is_active, :user_transaction_id

  #association
  belongs_to :child
  belongs_to :event
  belongs_to :classroom 
  belongs_to :user_transaction 
end
