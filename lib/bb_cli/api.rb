class API      
        
    def self.get_data
        data_response = RestClient.get("https://www.breakingbadapi.com/api/characters") #retreives the data from API soucre and sets it to a variable
        person_array = JSON.parse(data_response)                #makes the response dat look nice and sets it to a variable that we can iterate through
        person_array.each do |peeps|
            Person.new(peeps)
        end
    end                      
    
end




                                    