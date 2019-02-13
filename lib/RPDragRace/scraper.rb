class RPDragRace::Scraper 
 
  def get_page
    Nokogiri::HTML(open("https://rupaulsdragrace.fandom.com/wiki/Category:Queens"))
  end

  def get_queens
    list = self.get_page.css('.tabber').last.css('.thumbimage')
    list.each {|q| RPDragRace::Queen.queens_page(q)}
  end
  
end 

