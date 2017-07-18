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

* `none` - Creates an instance of the None class
* `some(value)` - Creates an instance of the Some(T) class with the value type. e.g.: some("foo") -> Some(String)
* `option(value)` - Returns either a None or a Some(T) instance

### Classes

* `Option` - Abstract class that defines the contract followed by None/Some(T)
* `None` - Class that defines the interaction with nil values
* `Some(T)` - Class that defines the interaction with the value

### Interaction

* `get` - Returns the value or raises an exception in case of nil
* `or_else(default)` - Returns the value or the defined default
* `empty?` - Returns true when the value is not nil, false when is nil

## Usage

```crystal
require "option"

class Unsafe
  def io
    ["Data", nil].sample
  end
end

10.times do
  puts option(Unsafe.new.io).or_else("Empty...")
end
```

Check the examples folder for more.
