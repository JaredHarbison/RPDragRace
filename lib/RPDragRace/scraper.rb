class RPDragRace::Scraper 
 
  def get_page
    Nokogiri::HTML(open("https://rupaulsdragrace.fandom.com/wiki/Category:Queens"))
  end
  
  def scrape_queens
    self.get_page.css('.tabber').last.css('.thumbimage')
  end 
  
  def make_queens
    scrape_queens.each {|q| RPDragRace::Queen.queens_page(q)}
  end
  
  def consolidated_queens
    make_queens.select.with_index{ |_,i| i.odd? }
  end 

end 



  
######## filter out duplicates below before scrape_queens (.each) ########

  
#.select.with_index{ |_,i| i.odd? }
#.select {|x| index(x) % n == 0}
  
  
#  def make_queens
#    scrape_queens.each do |q|
#      RPDragRace::Queen.queens_page(q)
#    end 
#  end
