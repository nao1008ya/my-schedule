FactoryBot.define do
  factory :event do
    title { 'テストチーム' }
    content { Faker::Lorem.sentence }
    start_time { '2020-11-15-10-00-00' }
    association :user

  end
end
