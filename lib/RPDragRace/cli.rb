class RPDragRace::CLI 
  
  def call
    greeting 
    list_queens
    choose_your_queen_prompt
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
      else  
        puts "I'm not sure what you mean by that"
        puts ""
      end 
    end
  end 

  def greeting
    puts ""
    puts "--------    The library is open!     --------"
    puts "- Welcome to Ru Paul's Drag Race info-rama! -"
    puts "------ It's time to make your decision ------"
    puts ""
  end 
  
  def choose_your_queen_prompt
    puts "---------     Choose your queen     ---------"
    puts "------  type her number or type exit   ------"    
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
    puts "Now, sashay away!"
    puts ""
  end 
  
end