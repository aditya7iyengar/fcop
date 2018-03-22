module Fcop
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config = Config.new
    yield(config)
  end

  class Config
    attr_accessor :replacements, :files

    def initialize
      self.replacements = Fcop::Replacement.default
      self.files = []
    end

    def add_replacement(word, replacement = "")
      self.replacements += Fcop::Replacement.new(word, replacement)
    end

    def add_files(regex)
      self.files << regex
    end
  end
end
