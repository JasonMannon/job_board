FactoryGirl.define do
  factory :posting do
    association :user
    description { Faker::Lorem.paragraph(4) }
    job_title { Faker::Name.title }
    kind { Posting.kinds.keys.first }
    company_name { Faker::Company.name }
    company_location { Faker::Address.state }
    application_instructions  { Faker::Lorem.paragraph(1) }
    company_url { Faker::Internet.url }
    
    trait :programming do
      kind "programming"
    end
    
    trait :marketing do
      kind "marketing"
    end
    
    trait :design do
      kind "design"
    end
    
    trait :devops do
      kind 'devops'
    end
    
    trait :customer_support do
      kind "customer_support"
    end
  end
end