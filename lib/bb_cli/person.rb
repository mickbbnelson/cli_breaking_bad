class Person    #buiding out the base of the Person class
    #attr_accessor :name, :nickname, :occupation, :status, :img 

    @@all = []

    def initialize(person_hash)
        person_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value) if self.respond_to?("#{key}=")  
        end
            save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.find(input)                    #takes in the users input and finds a match
        self.all.detect do |person|
            person.name.downcase == input.downcase
        end
    end

    def self.find_by_index(input)
        person_result = ""
        self.all.each.with_index(1) do |person, index|
          if index == input.to_i
            person_result = person
          end
        end
        person_result
    end

end