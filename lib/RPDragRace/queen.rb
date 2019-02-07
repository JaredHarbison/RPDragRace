class RPDragRace::Queen 
  attr_accessor :name, :position, :location, :url, :queen_and_season, :facts_are_facts, :quotes_and_jokes, :follow_your_queen
  @@all = []

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
  
  def self.new_from_index_page(q)
    self.new(
      q.attr("alt").split('_').join(' '),
      "https://rupaulsdragrace.fandom.com/wiki/" + q.attr("alt"))
  end
  
  def queen_and_season
    @queen_and_season = queen_and_season
    puts "Naomi Smalls - All Stars 4"
  end 
  
  def facts_are_facts
    @facts_are_facts = facts_are_facts
    puts "Real Name: David Heppenstall"
  end 
  
  def quotes_and_jokes
    @quotes_and_jokes = quotes_and_jokes
    puts "Check your lipstick before you come for me."
  end 
  
  def follow_your_queen
    @follow_your_queen = follow_your_queen
    puts "https://www.instagram.com/naomismalls/?hl=en"
  end 
  
  
  
end 