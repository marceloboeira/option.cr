# option.cr
> Crystal implementation of Scala's Option Monad

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  option:
    github: marceloboeira/option.cr
```

## Global
> By requiring the library you add the following functions/classes to your global scope

### Functions

* `none` - Creates an instance of the None(Nil) class
* `some(value)` - Creates an instance of the Some(T) class with the value type. e.g.: some("foo") -> Some(String)
* `option(value)` - Returns either a None or a Some(T) instance

### Classes

* `Option(T)` - Abstract class that defines the contract followed by None(T)/Some(T)
* `None(T)` - Class that defines the interaction with nil values
* `Some(T)` - Class that defines the interaction with the value

### Interaction

* `get` - Returns the value or raises an exception in case of nil
* `or_else(default)` - Returns the value or the defined default
* `empty?` - Returns true when the value is not nil, false when is nil

## Usage

```
option("value") #<Some(String):0x10de55bc0 @value="value">
option(123) #<Some(Int32):0x10de5ef10 @value=123>
option(nil) #<None(Nil):0x10de5ef00>

option("123").or_else("0") # "123"
option(nil).or_else("0") # "0"
```


### Examples

```crystal
require "option"

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
```

Check the examples folder for more.
