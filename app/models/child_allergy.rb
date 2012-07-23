class ChildAllergy < ActiveRecord::Base
  attr_accessible :allergy_id, :child_id

  #associations
  belongs_to :child 
  belongs_to :allergy 
end
