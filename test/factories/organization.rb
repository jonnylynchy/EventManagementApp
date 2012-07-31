# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
      sequence(:contact_email) { |i| "soandso_#{i}@organization.com"}
      contact_phone "312-444-5567"
      description "This is an organization."
      subdomain "myorg"
      title "My Org"
    end
end