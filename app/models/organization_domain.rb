class OrganizationDomain < ActiveRecord::Base
  attr_accessible :domain_name, :organization_id

  #associations
  belongs_to :organization 
  
end
