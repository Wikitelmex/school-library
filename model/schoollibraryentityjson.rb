require 'json'
require 'pry'
require 'simple_attribute_mapper'

class SchoolLibraryEntity
  def initialize(file_name)
    @file_name = file_name
  end

  def save(payload)
    binding.pry
    File.write(@file_name, JSON.generate(payload.map(&:to_json))) unless payload.empty?
  end

  def load(*args)
    jsonf = File.readable?(@file_name) ? JSON.parse(File.read(@file_name)) : nil
    jsonf ? args[0].to_array(jsonf, *args) : []
    # binding.pry
  end
end
