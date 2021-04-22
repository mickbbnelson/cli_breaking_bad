class CLI  

    def welcome
        chemistry_image
        API.get_data
        puts "Welcome to the Braking Bad Character Application!".colorize(:red)
        puts "Would you like to see a list of characters from Breaking Bad?".colorize(:red)
        puts "Type 'yes' to see the list, type 'exit' to exit.".colorize(:red)
        menu
    end

    def input
        gets.strip         
    end

    def menu        
        decision = input
        if decision.downcase == "yes" || decision == "list" || decision == "y"
            person_list
        elsif decision.downcase == "exit" || decision.downcase == "exit!"
            exit_message
        else
            invalid
        end
    end

    def invalid
        puts "Invalid selection, please type 'list' to see a list of individuals or type 'exit' to exit"
        menu
    end

    def exit_message
        puts ""
        puts "Thank you. And remember, if you're ever in legal trouble, you better call Saul!"
        puts ""
    end

    def person_list
        Person.all.each.with_index(1) do |person, index|
            puts "#{index}. #{person.name}".colorize(:red)          
        end
        choose_person
    end

    def choose_person
        puts ""
        puts "'Say my name!' - Walter White"
        puts ""
        puts "Enter the name or number of the character on the list to read their profile"
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

    def person_details(person)                  
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
        puts "type list to go back to the list of characters, type exit to exit."
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