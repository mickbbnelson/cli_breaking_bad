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
            person_list
        elsif decision == "exit"
            exit_message
        else
            invalid
        end
    end

    def invalid
        puts "Invalid selection, please type y for yes or exit to exit"
    end

    def exit_message
        puts "Thank you.  Have a nice day!"
    end

    def person_list
        people = ["person1", "person2", "person3"]
        people.each.with_index(1) do |person, index|
            puts "#{index}. #{person}"
        end
    end

end