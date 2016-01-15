require "factory_girl"

FactoryGirl.define do
  factory :organization_member do
    trello_uuid  { Faker::Code.ean }
    name         { Faker::Name.name }
  end
end
