# Popul Client

Popul API wrapper.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'popul', '~> 0.1'
```

And then execute:

    $ bundle

## Documentation

    $ yard && open doc/index.html

## Usage

```ruby
require 'popul'

popul = Popul.client

popul.cbsa('90291')

```

Endpoint can be set using:

```ruby
Popul.configure do |config|
  config.endpoint = ENDPOINT # defaults to 'http://api.daveed.io'
end

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
