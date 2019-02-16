class RPDragRace::Queen 
  attr_accessor :name, :url, :quote, :season
  @@all = []

  def self.queens_page(q)
    self.new(
      q.attr("alt").split('_').join(' '),
      "https://rupaulsdragrace.fandom.com/wiki/" + q.attr("alt").split(' ').join('_'))
  end 

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all.select.with_index{|_, i| i.odd?}
  end

  def self.find(id)
    self.all[id-1]
  end
  
  def season
    @season ||= doc.css("div.pi-data-value.pi-font a").text.split[1, 2]
    # @season ||= doc.search("div.class").text 
    # @season ||= doc.css("div.c-4.nr.nt ul:nth-child(8) li").text
    # @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
end 

#    queen_1 = self.new
#    queen_1.name = "Latrice Royale"
#    queen_1.quote = "She is large and in charge, chunky, yet funky. Bold and Beautiful baby."
#    
#    queen_2 = self.new
#    queen_2.name = "Monet Exchange"
#    queen_2.quote = "Guess who's black in the house, bitch!"
    
#    queen_3 = self.new
#    queen_3.name = "Monique Heart"
#    queen_3.quote = "Honey, the face, the look, the meme. Miss Monique Heart. Reclaiming my time, reclaiming my crown, RuPaul where's my check at?"
#    
#    queen_4 = self.new
#    queen_4.name = "Naomi Smalls"
#    queen_4.quote = "You can't spell legendary without...leg!"
#    
#    queen_5 = self.new
#    queen_5.name = "Trinity Taylor"
#    queen_5.quote = "Yes! The body is back"
#    
#    [queen_1, queen_2, queen_3, queen_4, queen_5]
 
   
