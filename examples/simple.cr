require "../src/option"

module UnsafeIO
  class User
    def self.count : Int32?
      # IO operation can fail
      [10, nil].sample
    end
  end
end

10.times do
  users = option(UnsafeIO::User.count).or_else(0)
  puts "#{users} on storage"
end
