class RPDragRace::CLI 
  
def call
    RPDragRace::Scraper.new.make_queens
    puts "--------    The library is open!     --------"
    puts "- Welcome to Ru Paul's Drag Race info-rama! -"
    puts "------ It's time to make your decision ------"
    puts ""
    list_queens 
    puts ""
    choose_your_queen
  end 
  
  def list_queens
    puts "Latrice Royale "
    puts "Monet Exchange"
    puts "Monique Heart"
    puts "Naomi Smalls"
    puts "Trinity Taylor"
  end
  
  def choose_your_queen
    input = nil 
    while input != "exit"
    puts "---------     Choose your queen     ---------"
    puts "------    type her name or type exit   ------"
    input = gets.strip
    case input
    when "Latrice Royale"
      puts "She is large and in charge, chunky, yet funky. Bold and Beautiful baby."
    when "Monet Exchange"
      puts "Guess who's black in the house, bitch!"
    when "Monique Heart"
      puts "Honey, the face, the look, the meme. Miss Monique Heart. Reclaiming my time, reclaiming my crown, RuPaul where's my check at?"
    when "Naomi Smalls"
      puts "You can't spell legendary without...leg!"
    when "Trinity Taylor"
      puts "Yes! The body is back"
    when "exit"
      goodbye
    else 
      puts "Try again!"
    end 
  end 
end 
  
  def goodbye
    puts "Now, sashay away!"
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