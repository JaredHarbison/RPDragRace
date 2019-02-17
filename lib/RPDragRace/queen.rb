class RPDragRace::Queen 
  attr_accessor :name, :url, :quotes, :season, :statistics, :biography
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
  
  def biography
    @biography ||= doc.css("#mw-content-text > aside > section:nth-child(3)").text 
  end 
  
  def statistics
    @statistics ||= doc.css("#mw-content-text > table.wikitable").text 
  end 
  
  def quotes
    @quotes ||= doc.css('#mw-content-text > ul > li').text
  end 
  
  def season
    @season ||= doc.css("#mw-content-text > aside > section:nth-child(4) > div:nth-child(2) > div").text
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
end 

  #def quotes
    #@quotes ||= doc.css('#mw-content-text > ul > li').text
    ##Entrance_Quotes
    #page.css('div#reference a')
    #page.css('div#entrance_quotes')[0]
    #tagcloud_elements = nokogiri_object.xpath("//ul[@class='tagcloud']/li/a")
      #tagcloud_elements.each do |tagcloud_element|
        #puts tagcloud_element.text
      #end
    #ul.tagcloud  > li >  a
    ##mw-content-text > ul:nth-child(24) > li:nth-child(1)
    ##mw-content-text > ul:nth-child(24) > li:nth-child(1)
    ##mw-content-text > ul
  #end 