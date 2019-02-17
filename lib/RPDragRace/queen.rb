class RPDragRace::Queen 
  attr_accessor :name, :url, :statistics, :biography, :quotes, :tryout 
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
  
  def tryout
    @tryout ||= doc.css('.Memorable_Quotes').collect do |quote|
      quote.css('li').text
    end 
    #doc.search('#mw-content-text > ul > li')
    #doc.at_css("span").next_sibling().text 
    #doc.css("#Memorable_Quotes", "ul li").text
    #page.xpath('//li[@class="clearfix"]').map do |item|
    #This says, hey Nokogiri, for the page object, return all list items with a class of ‘clearfix’ on them - and lets map and iterate over them.
    #title = item.at_xpath('.//h2').text.strip
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