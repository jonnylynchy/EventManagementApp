class VolunteerRegistration < ActiveRecord::Base
  attr_accessible :classroom_id, :event_id, :volunteer_id

  #associations
  belongs_to :event
  belongs_to :volunteer
  belongs_to :classroom
end
