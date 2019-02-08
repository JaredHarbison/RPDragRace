class RPDragRace::CLI 
  
def call
    RPDragRace::Scraper.new.make_queens
    greeting 
    @queens=RPDragRace::Queen.all 
    choose_your_queen
    goodbye
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
      else 
        puts "Try again!"
      end 
    end 
  end 
  
  def your_queen(queen)
    puts ""
    puts "#{queen.name}"
    puts "#{queen.quote}"
  end 
  
  def greeting
    puts ""
    puts "--------    The library is open!     --------"
    puts "- Welcome to Ru Paul's Drag Race info-rama! -"
    puts "------ It's time to make your decision ------"
    puts ""
  end 
  
  def goodbye
    puts ""
    puts "Now, sashay away!"
    puts ""
  end 
  
end