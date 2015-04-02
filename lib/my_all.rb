# add the method #my_all? to the Enumerable module

module Enumerable
  def my_all?
    each do |value|
      begin
        val = yield(value)
      rescue
        block = lambda { |i| i }
        val = block.call(value)
      end
      true_or_false = !!val
      return false if true_or_false == false
    end
    true
  end
end