class OrganizationSubscription < ActiveRecord::Base
  attr_accessible :end_date, :is_auto_renew, :organization_id, :start_date, :subscription_type_id

  #associations
  belongs_to :organization
  belongs_to :subscription_type

  #validations
  validates_presence_of :organization
  validates_presence_of :subscription_type
  validates_presence_of :start_date
  validates_presence_of :end_date

end
