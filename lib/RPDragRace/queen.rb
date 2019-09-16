class RPDragRace::Queen
  attr_accessor :name, :url, :statistics, :biography, :trivia
  @@all = []

  def self.queens_page(q)
    I18n.enforce_available_locales = false
    queen_url = "https://rupaulsdragrace.fandom.com/wiki/#{q.attr("title")}"
    url = I18n.transliterate(queen_url).split(' ').join('_')
    self.new(q.attr("title").split('_').join(' '), url.gsub(/\(.+/, ''))
  end

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.remove_dup
    @@all.select.with_index{|_, i| i.odd?}
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.remove_dup[id-1]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def biography
    selector = "#mw-content-text > aside > section:nth-child(3)"
    string = doc.css(selector).text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '')
    array = string.split(/\n/).reject!(&:empty?)[1..]
    hash_one = Hash[*array.flatten(1)]
    hash_two = hash_one.transform_keys!(&:to_sym)
    @biography = hash_two
  end

  def drag_name
    @drag_name ||= doc.css("#mw-content-text > aside > section:nth-child(3) 
                           > div:nth-child(2) > div")
                           .text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '')
  end

  def real_name
    @real_name ||= doc.css("#mw-content-text > aside > section:nth-child(3) 
                          > div:nth-child(3) > div").text.split(' ').join(' ')
  end

  def hometown  
    first = doc.xpath('//*[@data-source="Birthplace"]
                      /*[@class="pi-data-value pi-font"]
                      /text()').text
    second = doc.xpath('//*[@data-source="Hometown"]
                      /*[@class="pi-data-value pi-font"]
                      /text()').text
    @hometown 
      if first === ""
        second
      else 
        first 
      end 
  end

  def current_city
    @current_city ||= doc.xpath('//*[@data-source="Current City"]
                                /*[@class="pi-data-value pi-font"]
                                /text()').text
  end 

  def date_of_birth 
    @date_of_birth ||= doc.xpath('//*[@data-source="birth year"]
                                /div[@class="pi-data-value pi-font"]
                                /text()').text[0..-3]
  end

  def age 
    dob ||= doc.xpath('//*[@data-source="birth year"]
                                /div[@class="pi-data-value pi-font"]
                                /text()').text[0..-3]
    @age = ((Time.now - (Date.parse(dob)).to_time)/31557600).floor
  end 

  def primary_image
    first = doc.css('#mw-content-text > aside > figure > a').attribute('href')
    second = doc.css('#pi-tab-0 > figure > a > img').attribute('src')
    @primary_image = first || second
  end

  def instagram
    if instagram = doc.xpath('//a[text()="Instagram"]').attribute('href').text
      @instagram = "https:" + instagram
    end
  end

  def twitter
    if twitter = doc.xpath('//a[text()="Twitter"]').attribute('href')
      @twitter = "https:" + twitter
    end
  end

  def facebook
    if facebook = doc.xpath('//a[text()="Facebook"]').attribute('href')
      @facebook = "https:" + facebook
    end
  end

  def youtube
    if youtube = doc.xpath('//a[text()="YouTube"]').attribute('href')
      @youtube = "https:" + youtube
    end
  end

  def wikipedia
    if wikipedia = doc.xpath('//a[text()="Wikipedia"]').attribute('href')
      @wikipedia = "https:" + wikipedia
    end
  end

  def website
    site = doc.xpath('//a[text()="Site"]').attribute('href')
    official_site = doc.xpath('//a[text()="Official Website"]').attribute('href')
    @website = site ? site : official_site
  end 

  def seasons 
    @seasons ||= doc.xpath('//*[@data-source="Season"]/div[@class="pi-data-value pi-font"]/a').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
  end 

  def placement 
    @placement ||= doc.xpath('//*[@data-source="Place"]/child::text()').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
  end 

  def sent_home_by 
    @sent_home_by ||= doc.xpath('//*[@data-source="Sent home by"]/child::text()').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
  end 

  def elimination 
    @eliminiation ||= doc.xpath('//*[@data-source="Eliminated"]//child::text()').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
  end 

  def challenge_wins 
    @challenge_wins ||= doc.xpath('//*[@data-source="Challenge Wins"]/child::text()').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
  end 

  def ethnicity 
    @ethnicity ||= doc.xpath('//*[@data-source="Ethnicity"]
                            /div[@class="pi-data-value pi-font"]
                            /text()').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
  end

  def quotes #### this one works great but the regex needs to get a little tighter
    memorable_quotes = doc.xpath('//*[preceding::*[@id="Memorable_Quotes"] and following::*[@id="Trivia"]]//following-sibling::li')
    queen_quotes = doc.xpath('//*[preceding::*[@id="Quotes"] and following::*[@id="Trivia"]]//following-sibling::li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') }
    memorable_quotes_C2_A0 =  doc.xpath('//*[preceding::*[@id="Memorable_Quotes.C2.A0"] and following::*[@id="Trivia"]]//following-sibling::li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') }
    @quotes = queen_quotes + memorable_quotes + memorable_quotes_C2_A0
  end 

  def trivia 
    @trivia = doc.xpath('//*[preceding::*[@id="Trivia"] and following::*[@id="Gallery"]]//following-sibling::li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
  end 

end

#Xqueen_quotes = doc.xpath('//div[preceding-sibling::h2[1]="Quotes"]/text()')
    #Xmemorable_quotes = doc.xpath('//div[preceding-sibling::h2[1]="Memorable Quotes"]/text()')
      #X@trivia = doc.xpath('//div[preceding-sibling::h2[1]="Trivia"]/text()')
  
#  def quotes 
#    queen_quotes = doc.xpath('//*[@id="Quotes"]/following::*/li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
#    memorable_quotes = doc.xpath('//*[@id="Memorable_Quotes"]/following::*/li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } 
#    @quotes = queen_quotes + memorable_quotes
#  end 
