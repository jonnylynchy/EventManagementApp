class SubscriptionType < ActiveRecord::Base
  attr_accessible :description, :price, :title, :feature_list

  #associations
  has_many :organization_subscriptions
end
