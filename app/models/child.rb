class Child < ActiveRecord::Base
  attr_accessible :dob, :first_name, :gender, :grade_completed, :last_name, :special_needs, :user_id

  #associations
  belongs_to :user
  belongs_to :classroom
  has_many :child_allergies
  has_many :allergies, through: :child_allergies
  has_many :child_registrations
  has_many :events, through: :child_registrations
  has_many :emergency_contacts
end
