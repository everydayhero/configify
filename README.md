# Configify

Configify captures a simple pattern for setting up configuration properties, as well as enable loading configurations from environment variables.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'configify-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install configify-rb

## Usage

The following shows how to `Configify` a service class:

```ruby
  class TestService
    include Configify

    configuration do
      env_variable_prefix 'TEST'

      property :base_url, default: 'localhost:8080'
      property :init_count
    end

    def initialize config: config
      @base_url = config.base_url
      @init_count = config.init_count
    end
  end
```

With configified service class above, `TestService.configuration` can be used to access the configuration class for the `TestService`. For example:

```ruby
  config = TestService.configuration.new
  config.init_count = 100

  servcie = TestService.new config: config
```

`Configify` also supports loading properties from environment variables:

```ruby
  # Assume the following environment variables
  # TEST_INIT_COUNT = 100
  # TEST_BASE_URL = 127.0.0.1:1234

  config = TestService.configuration.new
  config.load_from_env

  servcie = TestService.new config: config
```

The preferred way to initialise a instance is to utilize the `with_config`:

```ruby
  service = TestService.with_config do |config|
    config.load_from_env
    config.init_count = 100
  end
```

## Contributing

1. Fork it ( https://github.com/everydayhero/configify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
