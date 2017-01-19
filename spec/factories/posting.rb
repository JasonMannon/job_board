FactoryGirl.define do
  factory :posting do
    association :user
    description { Faker::Lorem.words(4) }
    job_title { Faker::Name.name }
    kind { Posting.kinds.keys.first }
    company_name { Faker::Company.name }
    company_location { Faker::Address.state }
    application_instructions  { Faker::Lorem.words(4) }
  end
end