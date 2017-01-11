# add the method #my_all? to the Enumerable module
module Enumerable
  def my_all?
    
   self.each do |item| 
    begin 
      val = yield item
    rescue
     block = lambda {|i| i}
     val = block.call(item)
    end
    truthiness = !!val
    return false if truthiness == false

  end
  true
  end

end 