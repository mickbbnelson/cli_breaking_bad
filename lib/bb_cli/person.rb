class Person
    attr_accessor :name, nickname, :occupation, :status 

    @@all = []

    def initialize(name, nickname, occupation, status)
        @name = name
        @nickname = nickname
        @occupation = occupation
        @status = status
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end