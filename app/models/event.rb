class Event < ActiveRecord::Base
  attr_accessible :description, :end_date_time, :maximum_registrations, :organization_id, :start_date_time, :title

  #associations
  belongs_to :organization 
  has_many :child_registrations
  has_many :children, through: :child_registrations
  has_many :volunteer_registrations
  has_many :volunteers, through: :volunteer_registrations
end
