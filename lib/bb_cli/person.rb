class Person    #buiding out the base of the Person class
    attr_accessor :name, :nickname, :occupation, :status, :img

    @@all = []

    def initialize(people_hash)
        people_hash.each do |key, value|
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
            person.name == input
        end
    end

end