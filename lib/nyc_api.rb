require 'net/http'
require 'open-uri'
require 'json'

class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  #This method uses NET::HTTP library to send an HTTP request from our program
  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  #Method that returns a list of schools or organizations that are running our after school program
  def program_school
    #We use the JSON library to parse the API response into nicely formated JSON
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq

