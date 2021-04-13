class CLI   #Building out a CLI class to test along the way.

    def welcome
        chemistry_image
        API.get_data
        puts "Welcome to the Braking Bad ID application!".colorize(:red)
        puts "Would you like to see a list of individuals involved in the case?".colorize(:red)
        puts "Type yes to see list, type exit to exit.".colorize(:red)
        menu
    end

    def input
        gets.strip         
    end

    def menu        
        decision = input
        if decision.downcase == "yes" || decision == "list" || decision == "y"
            person_list
        elsif decision.downcase == "exit" || "exit!"
            exit_message
        else
            invalid
        end
    end

    def invalid
        puts "Invalid selection, please type list to see a list of individuals or type exit to exit"
        menu
    end

    def exit_message
        puts "Thank you. Have a nice day!"
    end

    def person_list
        Person.all.each.with_index(1) do |person, index|
            puts "#{index}. #{person.name}".colorize(:red)           #returns a list of objects until you call name in the interpolation
        end
        choose_person
    end

    def choose_person
        puts "Enter the name or number of the individual on the list to read their profile"
        person_choice = input 
        if Person.find(person_choice)                
            person = Person.find(person_choice)
            person_details(person) 
        elsif Person.find_by_index(person_choice)
            person = Person.find_by_index(person_choice)
            person_details(person)
        elsif person_choice == "exit" || person_choice == "exit!"
            exit_message
        else
            invalid
        end  
    end

    def person_details(person)                  #person object passed in as the argument when called in the choose_person
        puts ""
        puts "------------------------------------------------------------------"
        puts "PROFILE".colorize(:red)
        puts "Name: #{person.name}".colorize(:red)
        puts "Nickname: #{person.nickname}".colorize(:red)
        puts "Occupation: #{person.occupation}".colorize(:red)
        puts "Status: #{person.status}".colorize(:red)
        puts "Image: #{person.img}".colorize(:red)
        puts "------------------------------------------------------------------"
        puts ""
        puts "type list to go back to the list of individuals, type exit to exit."
        menu
    end

    def chemistry_image
        puts <<-'EOF'.colorize(:green)

            o  .      
        . .  .      )
         . O o .   (   
       .  o  .      )
         o O.      (
         . o O     |/|
         ___o_    /,,|
         | O |   |,,,|
         |o .|   | ,,|
         | .o|   | , |
         |O  |   | , |
         | .O|   |   |
       __|o .|__ |   |
      / . O o  o\|   |
     /. O .o .O .\   |
    |^^^^^^^^^^^^^|  |
    |             |__|_
     \           /======
      \_________/
      
      EOF
    end

end