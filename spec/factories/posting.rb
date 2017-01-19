FactoryGirl.define do
  factory :posting do
    association :user
    description { Faker::Lorem.words(4) }
    title { Faker::Name.name }
    kind { Faker::Lorem.word }
    company_name { Faker::Company.name }
    company_location { Faker::Address.state }
    application_instructions  { Faker::Lorem.words(4) }
  end
end