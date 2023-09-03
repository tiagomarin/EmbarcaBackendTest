# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    valid_names = ["São Paulo", "Rio de Janeiro", "Bahia", "Minas Gerais", "Paraná"]
    sequence(:name) { |n| "#{valid_names[n % valid_names.length]}-#{n}" }
  end
end
