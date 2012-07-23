class Allergy < ActiveRecord::Base
  attr_accessible :title

  #associations
  has_many :child_allergies
  has_many :children, through: :child_allergies
end
