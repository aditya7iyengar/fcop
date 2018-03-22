module Fcop
  class Replacement
    attr_reader :word, :replacement

    DEFAULT = [
      ["fuck", "fun"],
      ["shit", "stuff"],
    ].freeze

    def initialize(word, replacement)
      @word = word
      @replacement = replacement
    end

    def self.default
      DEFAULT.map { |word, rep| new(word, rep) }
    end
  end
end
