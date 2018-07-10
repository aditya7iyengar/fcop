require "fcop/version"
require "fcop/configure"
require "fcop/replacement"
require "fcop/search_file"

module Fcop
  class << self
    attr_accessor :replace
  end

  def self.run(replace = false)
    self.replace = replace
    self.config ||= Config.new
    files = get_files
    search_files(files)
  end

  private_class_method

  def self.check_filenames
  end

  def self.search_files(files)
    files.each do |file|
      config.replacements.each do |r|
        SearchFile.scan(file, r.word)
      end
    end
  end

  def self.get_files
    config.files.map(&method(:get_paths)).flatten
  end

  def self.get_paths(path)
    return path if File.file?(path)
    Dir.glob(path + "/*").map(&method(:get_paths))
  end
end
