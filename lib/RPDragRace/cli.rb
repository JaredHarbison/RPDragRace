class RPDragRace::CLI 
  
  def call
    introduction 
    list_queens
    choose_your_queen 
    goodbye 
  end 
  
  def list_queens
####something here works but doesn't feel right#### 
    RPDragRace::Scraper.new.make_queens
    @queens = RPDragRace::Queen.all
    @queens.each.with_index(1) do |queen, i, name, quote|   
      puts "#{i}. #{queen.name}"
      puts "#{queen.quote}"
    end 
      puts ""
  end 
  
  def choose_your_queen
    choose_your_queen_prompt
    input = nil 
    while input != "exit"
      input = gets.strip 
      if input.to_i > 0 
        choice = RPDragRace::Queen.find(input.to_i)
        read_queen(choice)
        chose_again
      elsif input == "list"
        list_queens
        choose_your_queen_prompt
####Why does 'exit' puts "I'm not sure..."####
      else  
      end 
    end
  end 

  def introduction
    puts ""
    puts "----------  The library is open!   ----------"
    puts "- Welcome to Ru Paul's Drag Race info-rama! -"
    puts ""
    puts "----  What's your name squirrel friend?  ----"
    @my_name = gets.strip
    puts ""
    puts "------------  Well #{@my_name},  ------------"
    puts "-----  It's time to make your decision  -----"
    puts ""
  end 

  def choose_your_queen_prompt
    puts "---------     Choose your queen     ---------"
    puts "------  type her number or type exit   ------"    
    puts "----  To see the list again type 'list'. ----"
    puts ""
  end 
  
  def chose_again
    puts ""
    puts "----  Would you like to choose another?  ----"
    puts "- If so type her number. If no type 'exit'. -"
    puts "----  To see the list again type 'list'. ----"
    puts ""
  end 
  
  def read_queen(choice)
    puts ""
    puts "#{choice.name}"
    puts "#{choice.quote}"
  end 
      
  def goodbye
    puts "So it is written, and so it shall be."
    puts "Now #{@my_name}, sashay away!"
    puts ""
  end 
  
end
  
#  def introduction
#    puts "What's your name, squirrel friend?"
#    @my_name = gets.strip 
#  end 
  