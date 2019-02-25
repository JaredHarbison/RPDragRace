class RPDragRace::Queen
  attr_accessor :name, :url, :statistics, :biography, :trivia
  @@all = []

  def self.queens_page(q)
    I18n.enforce_available_locales = false
    url = I18n.transliterate("https://rupaulsdragrace.fandom.com/wiki/#{q.attr("alt")}").split(' ').join('_')
    self.new(q.attr("alt").split('_').join(' '), url)
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

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def biography
    @biography ||= doc.css("#mw-content-text > aside > section:nth-child(3)").text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '')
  end

  def statistics
    @statistics ||= doc.css("#mw-content-text > table.wikitable").text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '')
  end

  def trivia
    @trivia ||= doc.css('#mw-content-text > ul > li').text
  end

end
