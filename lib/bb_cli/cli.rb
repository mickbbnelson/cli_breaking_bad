class CLI   #Building out a CLI class to test along the way.

    def welcome
        API.get_data
        puts "Welcome to the Braking Bad ID application!  
        Would you like to see a list of individuals involved in the case?
        Type yes to see list, type exit to exit."
        menu
    end

    def input
        gets.strip         
    end

    def menu        
        decision = input
        if decision == "yes" || "list"
            person_list
            menu
        elsif decision == "exit"
            exit_message
        else
            invalid
        end
    end

    def invalid
        puts "Invalid selection, please type yes for yes or exit to exit"
        menu
    end

    def exit_message
        puts "Thank you. Have a nice day!"
    end

    def person_list
        Person.all.each.with_index(1) do |person, index|
            puts "#{index}. #{person.name}"             #returns a list of objects until you call name in the interpolation
        end
        choose_person
    end

    def choose_person
        puts "Enter the name of the person on the list to read their profile"
        person_choice = input                  
        person = Person.find(person_choice)   
        person_details(person)    
        end

    def person_details(person)                  #person object passed in as the argument when called in the choose_person
        puts "------------------------------------------------------------------"
        puts "PROFILE:"
        puts "Name: #{person.name}"
        puts "Nickname: #{person.nickname}"
        puts "Occupation: #{person.occupation}"
        puts "Status: #{person.status}"
        puts "Image: #{person.img}"
        puts "------------------------------------------------------------------"
        puts "type list to go back to the list of individuals, type exit to exit"
    end

end