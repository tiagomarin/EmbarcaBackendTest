# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    valid_names = ["São Paulo", "Rio de Janeiro", "Salvador", "Belo Horizonte", "Curitiba"]
    sequence(:name) { |n| "#{valid_names[n % valid_names.length]}-#{n}" }
    state
  end
end
