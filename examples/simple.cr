require "../src/option"

class Unsafe
  def io
    ["Data", nil].sample
  end
end

10.times do
  puts option(Unsafe.new.io).or_else("Empty...")
end
