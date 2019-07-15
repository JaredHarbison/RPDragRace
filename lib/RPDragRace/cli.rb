
class RPDragRace::CLI

  def call
    introduction
    list_queens
    make_your_selection
    goodbye
  end

  def introduction
    puts ""
    puts "----------  The library is open!   ----------"
    puts "- Welcome to Ru Paul's Drag Race info-rama! -"
    puts ""
    puts "----  What's your name squirrel friend?  ----"
                                  @user_name = gets.strip
    puts ""
    puts "------------  Well #{@user_name}  ------------"
    puts "-----  It's time to make your decision  -----"
    puts ""
  end

  def list_queens
    RPDragRace::Scraper.new.get_queens
    @queens = RPDragRace::Queen.remove_dup[0..185]
    @queens.each.with_index(1) do |queen, i, url|
      puts "#{i}. #{queen.name}"
    end
  end

  def make_your_selection
    choose_your_queen
    input = nil
    while input != "exit"
      input = gets.strip
      if input.to_i > 0
        choice = RPDragRace::Queen.find(input.to_i)
        read_queen(choice)
        chose_again
      elsif input == "list"
        list_queens
        choose_your_queen
      else
      end
    end
  end

  def choose_your_queen
    puts ""
    puts "------------  Choose your queen  ------------"
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
    puts "@drag_name - #{choice.drag_name}"
    puts "@real_name - #{choice.real_name}"
    puts "@site - #{choice.site}"
    puts "@instagram - #{choice.instagram}"
    puts "@twitter - #{choice.twitter}"
    puts "@facebook - #{choice.facebook}"
    puts "@youtube - #{choice.youtube}"
    puts "@date_of_birth - #{choice.date_of_birth}"
    puts "@ethnicity - #{choice.ethnicity}"
    puts "@primary_image - #{choice.primary_image}"
#    puts "#{choice.season}"
#    puts "#{choice.placement} place"
#    puts "sent home by #{choice.eliminated}"
    puts ""
#    puts "---------------------------------------------"
#    puts "---------------- STATISTICS  ----------------"
#    puts "---------------------------------------------"
#    puts "#{choice.statistics}"
#    puts ""
#    puts "---------------------------------------------"
#    puts "------------  BIOGRAPHICAL INFO  ------------"
#    puts "---------------------------------------------"
#    puts "#{choice.biography}"
#    puts ""
#    puts "---------------------------------------------"
#    puts "------------  MEMORABLE TRIVIA  -------------"
#    puts "---------------------------------------------"
#    puts ""
    puts "---------------------------------------------"
    puts "@trivia"
    choice.trivia.each do |trivium|
      puts "#{trivium}"
    end
#    puts "---------------------------------------------"
#    puts "@trivia_2"
#    choice.trivia_2.each do |trivium|
#      puts "#{trivium}"
#    end
#    puts "---------------------------------------------"
#    puts "@trivia_3"
#    choice.trivia_3.each do |trivium|
#      puts "#{trivium}"
#    end
#    puts "---------------------------------------------"
#    puts "@trivia_2 - #{choice.trivia_2}"
#    puts "---------------------------------------------"
#    puts "@trivia_3 - #{choice.trivia_3}"
#    puts "---------------------------------------------"
#    puts "@trivia_4 - #{choice.trivia_4}"

  end

  def goodbye
    puts ""
    puts "So it is written, and so it shall be."
    puts "Now #{@user_name}, sashay away!"
    puts ""
  end

end
#    puts "Queen.first_name = #{choice.first_name}"
#    puts "Queen.last_name = #{choice.last_name}"
#    puts "Queen.username = #{choice.first_name}#{choice.last_name}"
#    puts "Queen.url = #{choice.url}"
#    puts "Queen.email = #{choice.first_name}@#{choice.last_name}.com"
