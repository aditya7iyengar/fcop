require "fcop/version"
require "fcop/configure"
require "fcop/replacement"

module Fcop
  class << self
    attr_accessor :replace
  end

  def self.run(replace = false)
    self.replace = replace
    self.config ||= Config.new
    files = get_files
    puts files
  end

  private_class_method

  def self.check_filenames
  end

  def self.get_files
    config.files.reduce([]) do |filenames, regex|
      filenames + Dir[regex].reduce([]) { |d| get_paths(d, []) }
    end
  end

  def self.get_paths(path, paths)
    return path if File.file?(path)
    Dir[path + '.*'].reduce(paths) do |total_paths, child|
      total_paths + get_paths(child, [])
    end
  end
end
