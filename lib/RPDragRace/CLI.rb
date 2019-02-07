class RPDragRace::CLI 
  
  def call
    RPDragRace::Scraper.new.make_queens
    puts "The library is open! Welcome to Ru Paul's Drag Race info-rama!"
    start
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
  
  
  def list_queens
    puts "Naomi Smalls, Monet Exchange, Monique Heart, Latrice Royale"
  end 
  
  def read_queen(queen)
    puts "queen - season"
    puts "facts are facts:"
    puts "quotes and jokes:"
    puts "follow queen:"
  end
  
end