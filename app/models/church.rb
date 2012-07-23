class Church < ActiveRecord::Base
  attr_accessible :city, :description, :postal_code, :state, :street_address, :title

  #associations 
  has_many :users
end
