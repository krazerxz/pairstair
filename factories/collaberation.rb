require "factory_girl"

FactoryGirl.define do
  factory :collaberation do
    card                { Faker::Code.ean }
    last_activity_date  { Faker::Date.backward }
  end
end
