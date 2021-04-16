class Person   
    
    @@all = []

    def initialize(person_hash)
        person_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value) 
            binding.pry
        end
            save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.find(input)                    
        self.all.detect do |person|
            person.name.downcase == input.downcase
        end
    end

    def self.find_by_index(input)
        self.all.detect.with_index(1) do |person, index|
          index == input.to_i
        end
    end
end