class Classroom < ActiveRecord::Base
  attr_accessible :description, :organization_id, :title

  #associations
  belongs_to :organization 
  has_many :child_registrations
  has_many :children, through: :child_registrations
  has_many :volunteer_registrations
  has_many :volunteers, through: :volunteer_registrations
end
