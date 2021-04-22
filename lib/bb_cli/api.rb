class API      
        
    def self.get_data
        data_response = RestClient.get("https://www.breakingbadapi.com/api/characters") 
        person_array = JSON.parse(data_response)       
        person_array.each do |person_ob|
            Person.new(person_ob)
        end
    end                         
end
                                    