# frozen_string_literal: true

module Utils
  class ShortIdGenerator
    BASE = (0..9).collect(&:to_s) + ('A'..'Z').to_a + ('a'..'z').to_a

    def self.generate
      BASE.sample(8).join
    end
  end
end
