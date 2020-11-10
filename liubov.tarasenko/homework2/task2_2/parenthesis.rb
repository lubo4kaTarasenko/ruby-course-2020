class String 

  def valid?
    puts
    puts self
    opened_arr = []    
    self.each_char{ |char|
      if [ '{', '[', '(', '<' ].any?{|x| x == char}     
        opened_arr << char
      elsif [ '}', ']', ')', '>' ].any?{|x| x == char} 
        pair = find_pair(char)
        if opened_arr.last == pair 
          opened_arr.pop
        else
          return false
        end
      end
    }
    opened_arr.empty?
  end

  def find_pair(char)
    return '{' if char == "}"
    return '<' if char == ">"
    return '[' if char == "]"
    return '(' if char == ")"
  end

end 
puts '<<}'.valid?
puts '<<}>'.valid?
puts '<<}>>'.valid?
puts '<<{}>>'.valid? 
puts '<([{})]>>'.valid?
puts '<<{([])}>>'.valid?
puts ')('.valid?
puts '({}){}'.valid?
