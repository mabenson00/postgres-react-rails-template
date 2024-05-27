# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    completed { Faker::Boolean.boolean }
    due_date { Time.zone.today + 7.days }
  end
end
