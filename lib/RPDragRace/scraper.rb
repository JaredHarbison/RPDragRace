class RPDragRace::Scraper 
  
  def get_page
    Nokogiri::HTML(open("https://rupaulsdragrace.fandom.com/wiki/Category:Queens"))
  end
  
  def scrape_queens
    self.get_page.css('.tabber').last.css('.thumbimage')
  end 
  
######## filter out duplicates before iteration below ########

  def make_queens
    scrape_queens.each do |q|
      RPDragRace::Queen.new_from_index_page(q)
    end
  end
  
end 
