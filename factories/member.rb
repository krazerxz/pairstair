require "factory_girl"

FactoryGirl.define do
  factory :member do
    member_uuid { Faker::Code.ean }
  end
end
