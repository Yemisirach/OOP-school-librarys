require 'json'



data = File.read('data.json')



parsed_data = JSON.parse(data)



puts parsed_data['books'][0]['title']

