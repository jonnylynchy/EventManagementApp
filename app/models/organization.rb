class Organization < ActiveRecord::Base
  attr_accessible :contact_email, :contact_phone, :description, :subdomain, :title

  #associations
  has_many :admin_users
  has_many :users
  has_many :events
  has_many :organization_domains
  has_many :organization_transactions
  has_many :organization_payment_details
  has_one :organization_subscription
end
