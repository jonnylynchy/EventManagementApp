# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      first_name "Joe"
      last_name "Lynch"
      sequence(:email) { |i| "joe_#{i}@lynch.com"}
      home_phone "214-317-2000"
      mobile_phone "214-317-1978"
      street_address "1122 Loco lane"
      city "Dallas"
      state "TX"
      postal_code "75035"
      association :organization
    end
end