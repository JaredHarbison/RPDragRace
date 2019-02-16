class RPDragRace::Queen 
  attr_accessor :name, :url, :quote, :season
  @@all = []

  def self.queens_page(q)
    self.new(q.attr("alt").split('_').join(' '), "https://rupaulsdragrace.fandom.com/wiki/" + q.attr("alt").split(' ').join('_'))
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
    @season ||= doc.css("#mw-content-text > aside > section:nth-child(4) > div:nth-child(2) > div").text
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
end 