# frozen_string_literal: true

# This module is responsible for validating the name format.
module NameFormatValidatable
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true,
                     length: { minimum: 3, maximum: 50 }

    validate :name_format
  end

  private

  def name_format
    unless name =~ /\A[\p{L}\s]+\z/ # Allows Unicode letter characters
      errors.add(:name, "only allows letters and spaces")
    end

    errors.add(:name, "can't start with a blank space") if name =~ /\A /

    errors.add(:name, "can't end with a blank space") if name =~ / \z/

    return unless name =~ /  /

    errors.add(:name, "can't have double spaces")
  end
end
