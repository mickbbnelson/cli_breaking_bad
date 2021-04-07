class Person    #buiding out the base of the Person class
    attr_accessor :name, :nickname, :occupation, :status

    @@all = []

    def initialize(people_hash)
        people_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")     #self refers to the instantiated object in initialize methods.
        end
            save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end