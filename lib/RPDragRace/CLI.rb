class RPDragRace::CLI 
  
def call
    RPDragRace::Scraper.new.make_queens
    greeting 
    list_queens
    choose_your_queen 
    goodbye 
  end 
  
  def list_queens
####something here works but doesn't feel right 
    @queens = RPDragRace::Queen.all
    @queens.each.with_index(1) do |queen, i, name, quote|   
####something here works but doesn't feel right 
      puts "#{i}. #{queen.name}"
      puts "#{queen.quote}"
    end 
      puts ""
  end 
  
  def choose_your_queen
    input = nil 
    if input != "exit"
      choose_your_queen_prompt
      input = gets.strip 
      choice = RPDragRace::Queen.find(input.to_i)
      read_queen(choice)
    end 
  end 
  
  def read_queen(choice)
    puts ""
    puts "#{choice.name}"
    puts "#{choice.quote}"
  end 
      
  def choose_your_queen_prompt
    puts "---------     Choose your queen     ---------"
    puts "------  type her number or type exit   ------"    
    puts ""
  end 
  
  def greeting
    puts ""
    puts "--------    The library is open!     --------"
    puts "- Welcome to Ru Paul's Drag Race info-rama! -"
    puts "------ It's time to make your decision ------"
    puts ""
  end 
  
  def goodbye
    puts "Now, sashay away!"
    puts ""
  end 
  
end