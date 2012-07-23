class SubscriptionType < ActiveRecord::Base
  attr_accessible :description, :price, :title

  #associations
  has_many :organization_subscriptions
end
