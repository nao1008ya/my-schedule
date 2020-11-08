FactoryBot.define do
  factory :user do
    name { Faker::Name.initials(number: 4) }
    email { Faker::Internet.free_email }
    password = '1a2b3c'
    password { password }
    password_confirmation { password }
  end
end
