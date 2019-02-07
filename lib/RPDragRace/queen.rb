class RPDragRace::Queen 
  
  def initialize(name, url)
    
  end
  
  def self.new_from_index_page(q)
    binding.pry
    self.new(
      q.attr("alt").split('_').join(' '),
      "https://rupaulsdragrace.fandom.com/wiki/" + q.attr("alt"))
  end
  
  
  
  
  
end 