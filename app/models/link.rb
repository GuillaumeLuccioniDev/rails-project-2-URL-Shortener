# frozen_string_literal: true

class Link < ApplicationRecord
  validates :original_url, presence: true
end
