class RPDragRace::CLI 
  
  def call
    RPDragRace::Scraper.new.make_queens
    puts "--------    The library is open!     --------"
    puts "- Welcome to Ru Paul's Drag Race info-rama! -"
    puts "------ It's time to make your decision ------"
    list_queens 
  end 
  
  def list_queens
    puts "Latrice Royale "
    puts "Monet Exchange"
    puts "Monique Heart"
    puts "Naomi Smalls"
    puts "Trinity Taylor"
  end
  
  def start 
    puts "Would you like to see a list of queens? Type yes or no"
    input = gets.strip 
    if input == "yes"
      list_queens
      puts "Which queen would you like to read?"
      input = gets.strip 
      read_queen(input)
      puts "Would you like to read another queen? Type yes or no"
      input = gets.strip.downcase
      if input == "yes"
        start 
      elsif input == "no"
        puts "Sashay away!"
        exit 
      else 
        puts "What part of yes or no do you not understand?!"
        start
      end 
    elsif input == "no" 
      puts "Sashay away!"
      exit 
    else 
      puts "What part of yes or no do you not understand?!"
      start
    end
  end 
  
  def read_queen(queen)
    puts "queen - season:"
    puts "facts are facts:"
    puts "quotes and jokes:"
    puts "follow queen:"
  end
  
end