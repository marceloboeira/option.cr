abstract class Option
  def get; end
  def or_else(default); end
  def empty?; end
end

class None < Option
  def get
    raise "None.get"
  end

  def or_else(default)
    default
  end

  def empty?
    true
  end
end

class Some(T) < Option
  def initialize(@value : T); end

  def get : T
    @value
  end

  def or_else(default)
    @value
  end

  def empty?
    false
  end
end

def some(value)
  Some(typeof(value)).new(value)
end

def none
  None.new
end

def option(value)
  return none if value == nil

  some(value)
end
