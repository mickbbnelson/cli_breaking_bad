class CLI   #Building out a CLI class to test along the way.

    def welcome
        puts "Welcome to the Braking Bad ID application!  
        Would you like to see a list of individuals involved in the case?
        Type y for yes, type exit to exit."
        menu
    end

    def input
        gets.strip          #collects users input
    end

    def menu        
        decision = input
        if decision == "y"
            puts "test language"
        elsif decision == "exit"
            puts "test language 2"
        else
            invalid
        end
    end

    def invalid
        puts "Invalid selection, please type y for yes or exit to exit"
    end


end