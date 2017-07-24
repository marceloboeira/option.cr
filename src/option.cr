class Option(T)
  def get : T?; end
  def or_else(default) : T; end
  def empty?; end
  
  def self.from(value : T) : Option(T)
    return None(T).new if value == nil

    some(value.as(T))
  end
end

class None < Option(T)
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

class Some(T) < Option(T)
  def initialize(@value : T); end

  def get : T
    @value
  end

  def or_else(default : T) : T
    @value
  end

  def empty?
    false
  end
end

def some(value) : Some
  Some(typeof(value)).new(value)
end

def none : None(Nil)
  None(Nil).new
end

def option(value)
  Option.from(value)
end
