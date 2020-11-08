FactoryBot.define do
  factory :group do
    name { Faker::Name.initials(number: 4) }

  end
end
