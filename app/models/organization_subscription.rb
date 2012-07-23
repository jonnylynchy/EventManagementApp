class OrganizationSubscription < ActiveRecord::Base
  attr_accessible :end_date, :is_auto_renew, :organization_id, :start_date, :subscription_type_id

  #associations
  belongs_to :organization
  belongs_to :subscription_type
end
