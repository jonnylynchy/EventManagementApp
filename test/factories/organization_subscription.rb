FactoryGirl.define do
  factory :organization_subscription do
      start_date '05/06/2012'
      end_date '09/06/2012'
      is_auto_renew true
      association :organization
      association :subscription_type
    end
end