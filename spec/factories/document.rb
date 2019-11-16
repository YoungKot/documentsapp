# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    title { Faker::String.random(length: 3..12) }
    description  { 'bla' }
    attachment { Faker::String.random(length: 3..12) }
  end
end
