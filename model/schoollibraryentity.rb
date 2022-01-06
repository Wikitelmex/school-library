# class SchoolLibraryEntity
#   def initialize(file_name = 'data.json')
#     @file_name = file_name
#   end

#   def save(payload)
#     File.write(@file_name, Marshal.dump(payload))
#   end

#   def load
#     File.readable?(@file_name) ? Marshal.load(File.read('data.json')) : {}
#   end
# end
