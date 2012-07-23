class AdminUser < ActiveRecord::Base
  attr_accessible :email, :first_name, :hashed_password, :last_name, :organization_id, :salt

  #associations
  belongs_to :organization 
end
