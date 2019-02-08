class RPDragRace::CLI 
  
def call
    RPDragRace::Scraper.new.make_queens
    greeting 
    list_queens
    choose_your_queen 
    goodbye 
  end 
  
  def list_queens
    @queens = RPDragRace::Queen.all
    @queens.each do |name|
      puts "#{name}"
    end 
      puts ""
  end 
  
  def choose_your_queen
    input = nil 
    while input != "exit"
      choose_your_queen_prompt
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
      puts ""
    end 
  end 
  
  def choose_your_queen_prompt
    puts "---------     Choose your queen     ---------"
    puts "------    type her name or type exit   ------"    
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