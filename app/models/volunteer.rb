class Volunteer < ActiveRecord::Base
  attr_accessible :email, :first_name, :hashed_password, :last_name, :organization_id, :phone, :salt

  #associations
  belongs_to :organization 
  has_many :volunteer_registrations
  has_many :classrooms, through: :volunteer_registrations
end
