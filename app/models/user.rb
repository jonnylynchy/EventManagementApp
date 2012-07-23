class User < ActiveRecord::Base
  attr_accessible :church_id, :city, :email, :first_name, :hashed_password, :home_phone, :last_name, :mobile_phone, :organization_id, :postal_code, :salt, :state, :street_address

  #associations
  belongs_to :organization
  belongs_to :church 
  has_many :children
  has_many :user_registrations
end
