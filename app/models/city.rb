# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :state

  include NameFormatValidatable

  # Uniqueness validation scoped to state
  validates :name, uniqueness: { scope: :state, case_sensitive: false }
end
