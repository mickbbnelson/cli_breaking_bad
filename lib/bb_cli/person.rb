class Person
    attr_accessor :name, nickname, :occupation, :status 

    def initialize(name, nickname, occupation, status)
        @name = name
        @nickname = nickname
        @occupation = occupation
        @status = status
    end
end