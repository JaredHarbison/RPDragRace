class RPDragRace::Queen
  attr_accessor :name, :url, :statistics, :biography, :trivia
  @@all = []

  def self.queens_page(q)
    I18n.enforce_available_locales = false
    url = I18n.transliterate("https://rupaulsdragrace.fandom.com/wiki/#{q.attr("title")}").split(' ').join('_')
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

  def age
    @age ||= doc.css("#mw-content-text > aside > section:nth-child(3) > div:nth-child(6) > div").text
  end

  def hometown
    @hometown ||= doc.css("#mw-content-text > aside > section:nth-child(3) > div:nth-child(7) > div").text
  end

  def current_city
    @current_city ||= doc.css("#mw-content-text > aside > section:nth-child(3) > div:nth-child(8) > div").text
  end

  def season
    @season ||= doc.css("#mw-content-text > aside > section:nth-child(4) > div > a:nth-child(1)").text
  end

  def placement
    @placement ||= doc.css("#mw-content-text > aside > section:nth-child(4) > div:nth-child(3) > div").text
  end

  def eliminated
    @eliminated ||= doc.css("#mw-content-text > aside > section:nth-child(4) > div:nth-child(5) > div").text
  end

  def sent_home_by
  end

  def challenge_wins
  end

  def friends
  end

  def statistics
    @statistics ||= doc.css("#mw-content-text > table").text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '')
  end

  def drag_name
    @drag_name ||= doc.css("#mw-content-text > aside > section:nth-child(3) > div:nth-child(2) > div").text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '')
  end

  def real_name
    @real_name ||= doc.css("#mw-content-text > aside > section:nth-child(3) > div:nth-child(3) > div").text.split(' ').join(' ')
  end

  def ethnicity #### this works!
    @ethnicity ||= doc.xpath('//*[@data-source="Ethnicity"]/div[@class="pi-data-value pi-font"]/text()').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') }
    #@ethnicity ||= doc.css("#mw-content-text > aside > section:nth-child(3) > div:nth-child(4) > div").text
  end

  def date_of_birth #### this is not pulling when ethnicity pulls DOB
    @date_of_birth ||= doc.css("#mw-content-text > aside > section:nth-child(3) > div:nth-child(5) > div").text
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

  def site
    if doc.xpath('//a[text()="Site"]').attribute('href')
      @site = "https:" + site
    end
  end

  def trivia ################## "trivia" top choice!! working perfectly just need to stop before Gallery
    @trivia =  doc.xpath('//*[@id="Trivia"]/following::*/li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } #### clean and neat list, not an array
  end

  #### for trivia, try something modeled after this - /*/p[count(preceding-sibling::divider)=1]
  #### for trivia, "//ul/li[preceding-sibling::li='doprep' and following-sibling::li='Savior']"
  def trivia_2 ################ "trivia_2"
    @trivia_2 = doc.xpath('//*[prececing-sibling::*[@id="Gallery"]]').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } #### clean and neat list, not an array
  end

  def trivia_3 ################ "trivia_3"
    @trivia_3 = doc.xpath('//*[prececing-sibling::*[@id="Gallery"] and following-sibling::*[@id="Trivia"]]').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } #### clean and neat list, not an array
  end

  def trivia_4 ################ "trivia_4" pulls the appropriate section header
    @trivia_4 = doc.xpath('//*[@id="Trivia"]/following::*/li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } #### clean and neat list, not an array
  end

end


## doc.xpath('')
## "trivia"
################ https://docs.scrapy.org/en/xpath-tutorial/topics/xpath-tutorial.html
################ doc.xpath('following::node()*[@id="Trivia"]')


# !! doc.xpath('//*[@id="Trivia"]/following::*/li').map { |e| e.text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') } #### clean and neat list, not an array
# !! doc.xpath('//*[@id="Trivia"]/following::*/li/text()').text.gsub(/[^0-9a-z%&!\n\/(). ]/i, '') #### one of best so far - pulls all after Trivia span and a lot of whitespace
# !! doc.xpath('//*[@id="Trivia"]/following::*/li') #### does pull lis, but doesn't stop at gallery
# !! doc.xpath('//*[@id="mw-content-text"]/ul') ####pulls a LOT of ul/li, but not consistent
# !! doc.xpath('//*[@id="mw-content-text"]/ul[2]/li[1]/text()') #### pulls exact, but not consistent
# !! doc.xpath('//*[@id="Trivia"]/following::*/ul/li/text()') #### pulls only the first trivia
# !! doc.xpath('//span[@id="Trivia"]') ####pulls same as //*[id...
# !! doc.xpath('//*[@id="Trivia"]')
# !! doc.xpath('//*[@id="Trivia"]').text ####pulls just "Trivia"
# X doc.xpath('//*[@id="Trivia"]/ul')
# X doc.xpath('//*[@id="Trivia"]/ul').text
# X doc.xpath('//*[@id="Trivia"]//li')
# X doc.xpath('//*[@id="Trivia"]//li').text
# X doc.xpath('//*[@id="Trivia"]/ul/li')
# X doc.xpath('//*[@id="Trivia"]/ul/li').text
# X doc.xpath('//*[@id="Trivia"]::ul')
# X doc.xpath('//*[@id="Trivia"]/following-sibling')
# X doc.xpath('//*[@id="Trivia"]/following-sibling::ul')
# X doc.xpath('//*[@id="Trivia"]/following-sibling::ul/li')
# X doc.xpath('//following-sibling::*[@id="Trivia"]')
# X doc.xpath('//following-sibling::[@id="Trivia"]')
# X doc.xpath('following-sibling[ul/li]::span[@id="Trivia"]')
# X doc.xpath('//*[@id="mw-content-text"]/ul/text()')
# X doc.css('#mw-content-text > ul:nth-child(40)').text

#### to try, for @ trivia
#### - following <h2>Trivia</h2> | prececing <h2>Gallery</h2>

#### removed, handling in the real_name method
####  def first_name
####    @real_name[0] || "Ryan"
####  end

####  def last_name
####    @real_name[-1] || "Taylor"
####  end
