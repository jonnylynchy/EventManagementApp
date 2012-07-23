class TransactionType < ActiveRecord::Base
  attr_accessible :description, :title

  #associations
  has_many :user_transactions
  has_many :organization_transactions
end
