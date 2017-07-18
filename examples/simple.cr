require "../src/option"

module UnsafeIO
  class User
    def count : Int32?
      # IO operation can fail
      [10, nil].sample
    end
  end
end

10.times do
  users = option(UnsafeIO::User.new.count).or_else(0)
  puts "#{users} on storage"
end
