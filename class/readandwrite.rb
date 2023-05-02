require 'json'
module Write
def read_item(file)
  read=[]
  if File.exist?(file) and File.size(file) != 0
    data = File.read(file)
    read =JSON.parse(data)
  else
    []
  end
  read
end

def write_to_file(item ,file_name)
    File.open(file_name, 'w') do |file|
      file.write(JSON.pretty_generate(item.map(&:to_h)))
    end
end

end