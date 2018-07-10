module Fcop
  module SearchFile
    def self.scan(path, word)
      system "ag -i #{word} #{path}"
    end
  end
end
