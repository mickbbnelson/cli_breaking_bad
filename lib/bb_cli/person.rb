class Person        #building out the base of my Person class.
    attr_accessor :name, :nickname, :occupation, :status

    @@all = []

    def initialize(name, nickname, occupation, status)
        @name = name
        @nickname = nickname
        @occupation = occupation
        @status = status
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end