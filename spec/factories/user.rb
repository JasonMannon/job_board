FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password "testtest"
    password_confirmation "testtest"
    
    trait :admin do
      email "admin@job_board.com"
      after(:build) do |user|
        user.add_role :admin
        user
      end
    end
  end
end
