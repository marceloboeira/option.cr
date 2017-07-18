# option.cr
> An attempt to implement Option monads for Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  option:
    github: marceloboeira/option.cr
```

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
