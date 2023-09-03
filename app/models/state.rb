# frozen_string_literal: true

class State < ApplicationRecord
  has_many :cities, dependent: :destroy

  include NameFormatValidatable
  validates :name, uniqueness: { case_sensitive: false }
end
