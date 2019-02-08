class RPDragRace::Queen 
  attr_accessor :name, :url
  @@all = []

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
    puts "Latrice Royale "
    puts "Monet Exchange"
    puts "Monique Heart"
    puts "Naomi Smalls"
    puts "Trinity Taylor"
  end

  def self.find(id)
    self.all[id-1]
  end
  
  def self.new_from_index_page(q)
    self.new(
      q.attr("alt").split('_').join(' '),
      "https://rupaulsdragrace.fandom.com/wiki/" + q.attr("alt"))
  end
  

  
end 